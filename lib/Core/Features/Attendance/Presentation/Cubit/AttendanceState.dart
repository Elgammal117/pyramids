import 'package:pyramids/Core/Features/Attendance/Data/Models/WorkplaceItem.dart';

abstract class AttendanceState {
  final WorkplaceItem? selectedWorkplace;
  final bool isCheckedIn;
  final int maxDistanceMeters;

  const AttendanceState({
    required this.selectedWorkplace,
    required this.isCheckedIn,
    required this.maxDistanceMeters,
  });
}

class AttendanceInitial extends AttendanceState {
  const AttendanceInitial({
    required super.selectedWorkplace,
    required super.isCheckedIn,
    required super.maxDistanceMeters,
  });
}

class AttendanceLoading extends AttendanceState {
  const AttendanceLoading({
    required super.selectedWorkplace,
    required super.isCheckedIn,
    required super.maxDistanceMeters,
  });
}

class AttendanceSuccess extends AttendanceState {
  const AttendanceSuccess({
    required super.selectedWorkplace,
    required super.isCheckedIn,
    required super.maxDistanceMeters,
  });
}

class AttendanceFailure extends AttendanceState {
  final String error;

  const AttendanceFailure({
    required super.selectedWorkplace,
    required super.isCheckedIn,
    required super.maxDistanceMeters,
    required this.error,
  });
}
