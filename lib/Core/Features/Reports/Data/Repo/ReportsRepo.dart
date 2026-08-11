import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pyramids/Core/Features/Reports/Data/Models/ReportsModels.dart';
import 'package:pyramids/Core/helper/dio_helper.dart';

class ReportsRepo {
  Future<Either<String, HistoryModel>> history({required String tokken}) async {
    try {
      var response = await dio.get(
        'attendance/history',
        options: Options(headers: {'Authorization': 'Bearer $tokken'}),
      );
      return right(HistoryModel.fromJson(response.data));
    } catch (e) {
      return left(handleDioException(e));
    }
  }
}
