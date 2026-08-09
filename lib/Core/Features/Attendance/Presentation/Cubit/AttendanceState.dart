import 'package:pyramids/Core/Features/Home/Data/Models/WorkplaceItem.dart';

abstract class HomeState {
  final WorkplaceItem? selectedWorkplace;
  final bool isCheckedIn;
  final int maxDistanceMeters;

  const HomeState({
    required this.selectedWorkplace,
    required this.isCheckedIn,
    required this.maxDistanceMeters,
  });
}

class HomeInitial extends HomeState {
  const HomeInitial({
    required super.selectedWorkplace,
    required super.isCheckedIn,
    required super.maxDistanceMeters,
  });
}

class HomeLoading extends HomeState {
  const HomeLoading({
    required super.selectedWorkplace,
    required super.isCheckedIn,
    required super.maxDistanceMeters,
  });
}

class HomeSuccess extends HomeState {
  const HomeSuccess({
    required super.selectedWorkplace,
    required super.isCheckedIn,
    required super.maxDistanceMeters,
  });
}

class HomeFailure extends HomeState {
  final String error;

  const HomeFailure({
    required super.selectedWorkplace,
    required super.isCheckedIn,
    required super.maxDistanceMeters,
    required this.error,
  });
}
