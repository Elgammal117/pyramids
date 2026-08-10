import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pyramids/Core/Features/Attendance/Presentation/Cubit/AttendanceState.dart';
import 'package:pyramids/Core/Features/Attendance/Data/Models/WorkplaceItem.dart';
import 'package:pyramids/Core/Features/Attendance/Presentation/View/LocationPermission.dart';
import 'package:pyramids/Core/helper/my_navigator.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit({
    WorkplaceItem? initialSelectedWorkplace,
    int maxDistanceMeters = 900,
    bool initialIsCheckedIn = false,
  }) : super(
         AttendanceInitial(
           selectedWorkplace: initialSelectedWorkplace,
           isCheckedIn: initialIsCheckedIn,
           maxDistanceMeters: maxDistanceMeters,
         ),
       );

  static AttendanceCubit get(BuildContext context) => BlocProvider.of(context);

  void selectWorkplace(WorkplaceItem workplace) {
    emit(
      AttendanceSuccess(
        selectedWorkplace: workplace,
        isCheckedIn: state.isCheckedIn,
        maxDistanceMeters: state.maxDistanceMeters,
      ),
    );
  }

  void toggleCheckInStatus() {
    emit(
      AttendanceLoading(
        selectedWorkplace: state.selectedWorkplace,
        isCheckedIn: state.isCheckedIn,
        maxDistanceMeters: state.maxDistanceMeters,
      ),
    );

    Future.delayed(const Duration(milliseconds: 300), () {
      emit(
        AttendanceSuccess(
          selectedWorkplace: state.selectedWorkplace,
          isCheckedIn: !state.isCheckedIn,
          maxDistanceMeters: state.maxDistanceMeters,
        ),
      );
    });
  }

  Future<void> CheckIn(BuildContext context) async {
    // 1. Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    LocationPermission permission = await Geolocator.checkPermission();

    if (!serviceEnabled ||
        permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      goTo(context, page: LocationPermissionScreen());
    } else {
      final LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );
      print("latitude: ${position.latitude}");
      print("longitude: ${position.longitude}");
    }
  }
}
