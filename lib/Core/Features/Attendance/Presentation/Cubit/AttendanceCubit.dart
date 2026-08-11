import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pyramids/Core/Features/Attendance/Data/Repo/AttendanceRepo.dart';
import 'package:pyramids/Core/Features/Attendance/Presentation/Cubit/AttendanceState.dart';
import 'package:pyramids/Core/Features/Attendance/Data/Models/WorkplaceItem.dart';
import 'package:pyramids/Core/Features/Attendance/Presentation/View/CheckOut.dart';
import 'package:pyramids/Core/Features/Attendance/Presentation/View/LocationPermission.dart';
import 'package:pyramids/Core/Features/Attendance/Presentation/View/Successful.dart';
import 'package:pyramids/Core/Features/Auth/Presentation/Cubit/AuthState.dart';
import 'package:pyramids/Core/helper/my_navigator.dart';
import 'package:pyramids/Core/helper/show_snack_bar.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit({
    WorkplaceItem? initialSelectedWorkplace,
    bool initialIsCheckedIn = false,
  }) : super(
         AttendanceInitial(
           selectedWorkplace: initialSelectedWorkplace,
           isCheckedIn: initialIsCheckedIn,
         ),
       );

  static AttendanceCubit get(BuildContext context) => BlocProvider.of(context);

  Timer? _timer;

  void startTimer() {
    _timer?.cancel();
    int seconds = 0;
    emit(
      AttendanceSuccess(
        selectedWorkplace: state.selectedWorkplace,
        isCheckedIn: true,
        elapsedSeconds: 0,
      ),
    );
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds++;
      emit(
        AttendanceTimerTick(
          selectedWorkplace: state.selectedWorkplace,
          isCheckedIn: true,
          elapsedSeconds: seconds,
        ),
      );
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  void selectWorkplace(WorkplaceItem workplace) {
    emit(
      AttendanceInitial(
        selectedWorkplace: workplace,
        isCheckedIn: state.isCheckedIn,
        elapsedSeconds: state.elapsedSeconds,
      ),
    );
  }

  Future checkIn(String token, BuildContext context) async {
    // 1. Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    LocationPermission permission = await Geolocator.checkPermission();

    if (!serviceEnabled ||
        permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      goTo(context, page: LocationPermissionScreen());
    } else {
      emit(
        AttendanceLoading(
          selectedWorkplace: state.selectedWorkplace,
          isCheckedIn: state.isCheckedIn ?? false,
          elapsedSeconds: state.elapsedSeconds,
        ),
      );
      final LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );
      print("latitude: ${position.latitude}");
      print("longitude: ${position.longitude}");

      var response = await AttendanceRepo().chickIn(
        workplaceid: state.selectedWorkplace!.id,
        lat: 30.018354095372796,
        long: 31.74005697912368,
        token: token,
      );
      return response.fold(
        (l) {
          emit(AttendanceFailure(error: l));
        },
        (r) {
          startTimer();
        },
      );
    }
  }

  Future checkOut(String token, String userName, BuildContext context) async {
    // 1. Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    LocationPermission permission = await Geolocator.checkPermission();

    if (!serviceEnabled ||
        permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      goTo(context, page: LocationPermissionScreen());
    } else {
      emit(
        AttendanceLoading(
          selectedWorkplace: state.selectedWorkplace,
          isCheckedIn: state.isCheckedIn ?? false,
          elapsedSeconds: state.elapsedSeconds,
        ),
      );

      final LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );
      print("latitude: ${position.latitude}");
      print("longitude: ${position.longitude}");

      var response = await AttendanceRepo().chickOut(
        lat: 30.018354095372796,
        long: 31.74005697912368,
        token: token,
      );
      return response.fold(
        (l) {
          emit(AttendanceFailure(error: l));
        },
        (r) {
          // Capture data before stopping timer
          final seconds = state.elapsedSeconds;
          final hours = (seconds ~/ 3600).toString().padLeft(2, '0');
          final mins = ((seconds % 3600) ~/ 60).toString().padLeft(2, '0');
          final totalDuration = '${hours}h ${mins}m';

          final now = DateTime.now();
          final h = now.hour % 12 == 0 ? 12 : now.hour % 12;
          final checkOutTime =
              '${h.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')} ${now.hour >= 12 ? 'PM' : 'AM'}';

          final workplaceName = state.selectedWorkplace?.title ?? 'Workplace';

          stopTimer();

          goTo(
            context,
            page: SuccessfulScreen(
              tokken: token,
              userName: userName,
              totalDuration: totalDuration,
              checkOutTime: checkOutTime,
              workplaceName: workplaceName,
            ),
          );
        },
      );
    }
  }
}
