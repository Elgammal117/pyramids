import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pyramids/Core/Features/Auth/Presentation/Cubit/AuthCubit.dart';
import 'package:pyramids/Core/Features/Auth/Presentation/Cubit/AuthState.dart';
import 'package:pyramids/Core/Features/Auth/Presentation/View/Login.dart';
import 'package:pyramids/Core/helper/app_validator.dart';
import 'package:pyramids/Core/helper/my_navigator.dart';
import 'package:pyramids/Core/helper/show_snack_bar.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFF1B1B4B);
    const cardColor = Color(0xFFF8F9FF);
    const primaryBlue = Color(0xFF4B42DB);
    const inputFillColor = Color(0xFFF0F3FA);
    const labelColor = Color(0xFF5A607F);

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignupError) {
            showCustomSnackBar(
              context,
              text: state.error,
              status: SnackBarStatus.fail,
            );
          } else if (state is SignupSuccess) {
            showCustomSnackBar(
              context,
              text: 'تم إنشاء الحساب بنجاح',
              status: SnackBarStatus.success,
            );
            goTo(
              context,
              page: const LoginScreen(),
              state: NavAction.pushReplace,
            );
          }
        },
        builder: (context, state) {
          final cubit = AuthCubit.get(context);
          final isLoading = state is Loading;

          return Scaffold(
            backgroundColor: backgroundColor,
            body: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  SizedBox(height: 32.h),
                  // Header: Logo & Branding
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 64.w,
                          height: 64.h,
                          decoration: BoxDecoration(
                            color: primaryBlue,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: const Icon(
                            Icons.polyline_rounded,
                            color: Colors.white,
                            size: 36,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'Pyramids',
                          style: TextStyle(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          'Enterprise Workforce Management',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 36.h),
                  // Form Card container
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32.r),
                          topRight: Radius.circular(32.r),
                        ),
                      ),
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 32.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Full Name field
                            Text(
                              'FULL NAME',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: labelColor,
                                letterSpacing: 0.8,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            TextField(
                              controller: cubit.signUpNameController,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                hintText: 'John Doe',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                ),
                                prefixIcon: Icon(
                                  Icons.person_outline_rounded,
                                  color: Colors.grey.shade500,
                                ),
                                filled: true,
                                fillColor: inputFillColor,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 16,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),

                            // Email field
                            Text(
                              'EMAIL',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: labelColor,
                                letterSpacing: 0.8,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            TextField(
                              controller: cubit.signUpEmailController,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                hintText: 'elgammalm071@gmail.com',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                ),
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: Colors.grey.shade500,
                                ),
                                filled: true,
                                fillColor: inputFillColor,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 16,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),

                            // Secure Password field
                            Text(
                              'SECURE PASSWORD',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: labelColor,
                                letterSpacing: 0.8,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            TextFormField(
                              controller: cubit.signUpPasswordController,
                              obscureText: cubit.obscureSignUpPassword,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: AppValidator.validatePassword,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                hintText: '••••••••',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                ),
                                prefixIcon: Icon(
                                  Icons.lock_outline_rounded,
                                  color: Colors.grey.shade500,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    cubit.obscureSignUpPassword
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: Colors.grey.shade500,
                                  ),
                                  onPressed: () {
                                    cubit.toggleSignUpPasswordVisibility();
                                  },
                                ),
                                filled: true,
                                fillColor: inputFillColor,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                errorMaxLines: 2,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 16,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),

                            // Confirm Password field
                            Text(
                              'CONFIRM PASSWORD',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: labelColor,
                                letterSpacing: 0.8,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            TextFormField(
                              controller: cubit.signUpConfirmPasswordController,
                              obscureText: cubit.obscureSignUpConfirmPassword,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) =>
                                  AppValidator.validateConfirmPassword(
                                    value,
                                    cubit.signUpPasswordController.text,
                                  ),
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                hintText: '••••••••',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                ),
                                prefixIcon: Icon(
                                  Icons.lock_outline_rounded,
                                  color: Colors.grey.shade500,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    cubit.obscureSignUpConfirmPassword
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: Colors.grey.shade500,
                                  ),
                                  onPressed: () {
                                    cubit
                                        .toggleSignUpConfirmPasswordVisibility();
                                  },
                                ),
                                filled: true,
                                fillColor: inputFillColor,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                errorMaxLines: 2,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 16,
                                ),
                              ),
                            ),
                            SizedBox(height: 32.h),

                            // Create Account Button
                            ElevatedButton(
                              onPressed: isLoading
                                  ? null
                                  : () {
                                      cubit.signUpLogic();
                                    },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryBlue,
                                disabledBackgroundColor: primaryBlue.withValues(
                                  alpha: 0.6,
                                ),
                                foregroundColor: Colors.white,
                                elevation: 4,
                                shadowColor: primaryBlue.withValues(alpha: 0.4),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: isLoading
                                  ? const SpinKitRing(
                                      color: Colors.white,
                                      size: 25,
                                    )
                                  : Text(
                                      'Create Account',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                            SizedBox(height: 24.h),

                            // Already have an account footer
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account? ',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    goTo(
                                      context,
                                      page: const LoginScreen(),
                                      state: NavAction.pushReplace,
                                    );
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: primaryBlue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
