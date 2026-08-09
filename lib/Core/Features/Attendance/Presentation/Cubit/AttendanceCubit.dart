import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pyramids/Core/Features/Home/Data/Models/WorkplaceItem.dart';
import 'package:pyramids/Core/Features/Attendance/Presentation/Cubit/AttendanceState.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    WorkplaceItem? initialSelectedWorkplace,
    int maxDistanceMeters = 900,
    bool initialIsCheckedIn = false,
  }) : super(
         HomeInitial(
           selectedWorkplace: initialSelectedWorkplace,
           isCheckedIn: initialIsCheckedIn,
           maxDistanceMeters: maxDistanceMeters,
         ),
       );

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  void selectWorkplace(WorkplaceItem workplace) {
    emit(
      HomeSuccess(
        selectedWorkplace: workplace,
        isCheckedIn: state.isCheckedIn,
        maxDistanceMeters: state.maxDistanceMeters,
      ),
    );
  }

  void toggleCheckInStatus() {
    emit(
      HomeLoading(
        selectedWorkplace: state.selectedWorkplace,
        isCheckedIn: state.isCheckedIn,
        maxDistanceMeters: state.maxDistanceMeters,
      ),
    );

    Future.delayed(const Duration(milliseconds: 300), () {
      emit(
        HomeSuccess(
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
        HomeFailure(
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
