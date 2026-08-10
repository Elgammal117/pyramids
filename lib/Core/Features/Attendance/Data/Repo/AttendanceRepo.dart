import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pyramids/Core/Features/Attendance/Data/Models/AttendanceModels.dart';
import 'package:pyramids/Core/helper/dio_helper.dart';

class AttendanceRepo {
  Future<Either<String, CheckInOutModel>> chickIn({
    required String workplaceid,
    required double lat,
    required double long,
    required String token,
  }) async {
    try {
      var response = await dio.post(
        'attendance/check-in',
        data: {'workplaceId': workplaceid, 'latitude': lat, 'longitude': long},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return right(CheckInOutModel.fromJson(response.data));
    } catch (e) {
      return left(handleDioException(e));
    }
  }

  Future<Either<String, CheckInOutModel>> chickOut({
    required double lat,
    required double long,
    required String token,
  }) async {
    try {
      var response = await dio.post(
        'attendance/check-out',
        data: {'latitude': lat, 'longitude': long},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return right(CheckInOutModel.fromJson(response.data));
    } catch (e) {
      return left(handleDioException(e));
    }
  }
}
