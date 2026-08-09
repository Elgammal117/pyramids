import 'package:pyramids/Core/Features/Auth/Data/Models/AuthModels.dart';

abstract class AuthState {}

class LoginInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final LoginModel loginModel;
  LoginSuccess({required this.loginModel});
}

class LoginFailure extends AuthState {
  final String error;
  LoginFailure({required this.error});
}

class SignupInitial extends AuthState {}

class SignupLoading extends AuthState {}

class SignupSuccess extends AuthState {
  final SignUpModel signUpModel;
  SignupSuccess({required this.signUpModel});
}

class SignupError extends AuthState {
  final String error;
  SignupError({required this.error});
}

class GetUserInitial extends AuthState {}

class GetUserLoading extends AuthState {}

class GetUserSuccess extends AuthState {
  final UserModel userModel;
  GetUserSuccess({required this.userModel});
}

class GetUserError extends AuthState {
  final String error;
  GetUserError({required this.error});
}
