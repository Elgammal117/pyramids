import 'package:pyramids/Core/Features/Attendance/Data/Models/WorkplaceItem.dart';

abstract class AttendanceState {
  final WorkplaceItem? selectedWorkplace;
  final bool? isCheckedIn;
  final int elapsedSeconds;

  const AttendanceState({
    this.selectedWorkplace,
    this.isCheckedIn,
    this.elapsedSeconds = 0,
  });
}

class AttendanceInitial extends AttendanceState {
  const AttendanceInitial({
    super.selectedWorkplace,
    super.isCheckedIn,
    super.elapsedSeconds,
  });
}

class AttendanceLoading extends AttendanceState {
  const AttendanceLoading({
    super.selectedWorkplace,
    super.isCheckedIn,
    super.elapsedSeconds,
  });
}

class AttendanceSuccess extends AttendanceState {
  const AttendanceSuccess({
    super.selectedWorkplace,
    super.isCheckedIn,
    super.elapsedSeconds,
  });
}

class AttendanceFailure extends AttendanceState {
  final String error;

  const AttendanceFailure({
    required this.error,
    super.selectedWorkplace,
    super.isCheckedIn,
    super.elapsedSeconds,
  });
}

class AttendanceTimerTick extends AttendanceState {
  const AttendanceTimerTick({
    super.selectedWorkplace,
    super.isCheckedIn,
    super.elapsedSeconds,
  });
}
