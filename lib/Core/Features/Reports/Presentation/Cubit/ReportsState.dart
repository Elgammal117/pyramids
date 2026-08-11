import 'package:pyramids/Core/Features/Reports/Data/Models/ReportsModels.dart';

abstract class ReportsState {
  const ReportsState();
}

class ReportsInitial extends ReportsState {
  const ReportsInitial();
}

class ReportsLoading extends ReportsState {
  const ReportsLoading();
}

class ReportsSuccess extends ReportsState {
  final HistoryModel historyModel;

  const ReportsSuccess({required this.historyModel});
}

class ReportsFailure extends ReportsState {
  final String error;

  const ReportsFailure({required this.error});
}
