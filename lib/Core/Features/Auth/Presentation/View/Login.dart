import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramids/Core/Features/Attendance/Presentation/View/Home.dart';
import 'package:pyramids/Core/Features/Auth/Presentation/Cubit/AuthCubit.dart';
import 'package:pyramids/Core/Features/Auth/Presentation/Cubit/AuthState.dart';
import 'package:pyramids/Core/Features/Auth/Presentation/View/SignUp.dart';
import 'package:pyramids/Core/Navigation/MainNavigation.dart';
import 'package:pyramids/Core/helper/my_navigator.dart';
import 'package:pyramids/Core/helper/show_snack_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          if (state is LoginFailure) {
            showCustomSnackBar(
              context,
              text: state.error,
              status: SnackBarStatus.fail,
            );
          } else if (state is LoginSuccess) {
            showCustomSnackBar(
              context,
              text: 'تم تسجيل الدخول بنجاح',
              status: SnackBarStatus.success,
            );

            goTo(
              context,
              page: MainNavigation(
                tokken: state.accessToken,
                userName: state.userName,
              ),
              state: NavAction.pushReplace,
            );
          }
        },
        builder: (context, state) {
          final cubit = AuthCubit.get(context);
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
                  SizedBox(height: 100.h),
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
                              controller: cubit.emailController,
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
                            TextField(
                              controller: cubit.passwordController,
                              obscureText: cubit.obscurePassword,
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
                                    cubit.obscurePassword
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: Colors.grey.shade500,
                                  ),
                                  onPressed: () {
                                    cubit.togglePasswordVisibility();
                                  },
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

                            SizedBox(height: 32.h),

                            // Create Account Button
                            ElevatedButton(
                              onPressed: state is Loading
                                  ? null
                                  : () {
                                      cubit.loginLogic();
                                    },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryBlue,
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
                              child: state is Loading
                                  ? const SpinKitRing(
                                      color: Colors.white,
                                      size: 25,
                                    )
                                  : Text(
                                      'Login',
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
                                  'Dont have an account? ',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    goTo(context, page: SignUpScreen());
                                  },
                                  child: Text(
                                    'Sign Up',
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
