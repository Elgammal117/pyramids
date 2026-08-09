import 'package:dartz/dartz.dart';
import 'package:pyramids/Core/Features/Auth/Data/Models/AuthModels.dart';
import 'package:pyramids/Core/helper/dio_helper.dart';

class Authrepo {
  Future<Either<String, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await dio.post(
        'auth/login',
        data: {'email': email, 'password': password},
      );
      return right(LoginModel.fromJson(response.data));
    } catch (e) {
      return left(handleDioException(e));
    }
  }

  Future<Either<String, SignUpModel>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      var response = await dio.post(
        'auth/register',
        data: {'name': name, 'email': email, 'password': password},
      );
      return right(SignUpModel.fromJson(response.data));
    } catch (e) {
      return left(handleDioException(e));
    }
  }
}

Future<Either<String, UserModel>> getuser() async {
  try {
    var response = await dio.get('auth/me');
    return right(UserModel.fromJson(response.data));
  } catch (e) {
    return left(handleDioException(e));
  }
}
