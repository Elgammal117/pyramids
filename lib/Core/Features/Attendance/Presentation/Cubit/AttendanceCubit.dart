import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pyramids/Core/Features/Attendance/Presentation/Cubit/AttendanceState.dart';
import 'package:pyramids/Core/Features/Attendance/Data/Models/WorkplaceItem.dart';

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

  void onCheckInPressed() {
    if (state.selectedWorkplace == null) {
      emit(
        AttendanceFailure(
          selectedWorkplace: state.selectedWorkplace,
          isCheckedIn: state.isCheckedIn,
          maxDistanceMeters: state.maxDistanceMeters,
          error: 'Please select a workplace first',
        ),
      );
      return;
    }

    toggleCheckInStatus();
  }
}
