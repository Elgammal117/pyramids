import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pyramids/Core/Features/Reports/Data/Repo/ReportsRepo.dart';
import 'package:pyramids/Core/Features/Reports/Presentation/Cubit/ReportsState.dart';

class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit() : super(const ReportsInitial());

  static ReportsCubit get(BuildContext context) => BlocProvider.of(context);

  final ReportsRepo _reportsRepo = ReportsRepo();

  Future<void> loadMonthlyHistory({required String token}) async {
    emit(const ReportsLoading());

    try {
      final result = await _reportsRepo.history(tokken: token);
      result.fold(
        (error) => emit(ReportsFailure(error: error)),
        (historyModel) => emit(ReportsSuccess(historyModel: historyModel)),
      );
    } catch (e) {
      emit(ReportsFailure(error: e.toString()));
    }
  }
}
