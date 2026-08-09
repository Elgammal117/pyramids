import 'package:pyramids/Core/Features/Auth/Data/Models/AuthModels.dart';

abstract class AuthState {}

class LoginInitial extends AuthState {}

class Loading extends AuthState {}

class LoginSuccess extends AuthState {
  final String accessToken;
  final String userName;

  LoginSuccess({required this.accessToken, required this.userName});
}

class LoginFailure extends AuthState {
  final String error;
  LoginFailure({required this.error});
}

class SignupInitial extends AuthState {}

class SignupSuccess extends AuthState {
  final SignUpModel signUpModel;
  SignupSuccess({required this.signUpModel});
}

class SignupError extends AuthState {
  final String error;
  SignupError({required this.error});
}

class GetUserInitial extends AuthState {}

class GetUserSuccess extends AuthState {
  final UserModel userModel;
  GetUserSuccess({required this.userModel});
}

class GetUserError extends AuthState {
  final String error;
  GetUserError({required this.error});
}
