import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pyramids/Core/Features/Auth/Data/Repo/AuthRepo.dart';
import 'package:pyramids/Core/Features/Auth/Presentation/Cubit/AuthState.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(LoginInitial());
  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController signUpNameController = TextEditingController();
  final TextEditingController signUpEmailController = TextEditingController();
  final TextEditingController signUpPasswordController =
      TextEditingController();
  final TextEditingController signUpConfirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureSignUpPassword = true;
  bool _obscureSignUpConfirmPassword = true;

  bool get obscurePassword => _obscurePassword;
  bool get obscureSignUpPassword => _obscureSignUpPassword;
  bool get obscureSignUpConfirmPassword => _obscureSignUpConfirmPassword;

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    emit(LoginInitial());
  }

  void toggleSignUpPasswordVisibility() {
    _obscureSignUpPassword = !_obscureSignUpPassword;
    emit(SignupInitial());
  }

  void toggleSignUpConfirmPasswordVisibility() {
    _obscureSignUpConfirmPassword = !_obscureSignUpConfirmPassword;
    emit(SignupInitial());
  }

  Future<void> loginLogic() async {
    emit(Loading());
    try {
      final authRepo = Authrepo();
      final result = await authRepo.login(
        email: emailController.text,
        password: passwordController.text,
      );
      result.fold(
        (error) {
          emit(LoginFailure(error: error));
        },
        (loginModel) {
          emit(
            LoginSuccess(
              accessToken: loginModel.accessToken ?? "",
              userName: loginModel.user?.name ?? "",
            ),
          );
        },
      );
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }

  Future<void> signUpLogic() async {
    if (signUpPasswordController.text != signUpConfirmPasswordController.text) {
      emit(SignupError(error: 'كلمتا السر غير متطابقتين'));
      return;
    }

    emit(Loading());
    try {
      final authRepo = Authrepo();
      final result = await authRepo.signup(
        name: signUpNameController.text,
        email: signUpEmailController.text,
        password: signUpPasswordController.text,
      );
      result.fold(
        (error) {
          emit(SignupError(error: error));
        },
        (signUpModel) {
          emit(SignupSuccess(signUpModel: signUpModel));
        },
      );
    } catch (e) {
      emit(SignupError(error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    signUpNameController.dispose();
    signUpEmailController.dispose();
    signUpPasswordController.dispose();
    signUpConfirmPasswordController.dispose();
    return super.close();
  }
}
