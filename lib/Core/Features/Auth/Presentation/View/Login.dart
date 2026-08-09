import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramids/Core/Features/Auth/Presentation/View/SignUp.dart';
import 'package:pyramids/Core/helper/my_navigator.dart';

class LoginScreen extends StatefulWidget {
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final VoidCallback? onSignInTap;

  const LoginScreen({
    super.key,
    this.emailController,
    this.passwordController,
    this.onSignInTap,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _emailController = widget.emailController ?? TextEditingController();
    _passwordController = widget.passwordController ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.emailController == null) _emailController.dispose();
    if (widget.passwordController == null) _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFF1B1B4B);
    const cardColor = Color(0xFFF8F9FF);
    const primaryBlue = Color(0xFF4B42DB);
    const inputFillColor = Color(0xFFF0F3FA);
    const labelColor = Color(0xFF5A607F);

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
                        controller: _emailController,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black87,
                        ),
                        decoration: InputDecoration(
                          hintText: 'elgammalm071@gmail.com',
                          hintStyle: TextStyle(color: Colors.grey.shade400),
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
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black87,
                        ),
                        decoration: InputDecoration(
                          hintText: '••••••••',
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: Colors.grey.shade500,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.grey.shade500,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
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
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryBlue,
                          foregroundColor: Colors.white,
                          elevation: 4,
                          shadowColor: primaryBlue.withValues(alpha: 0.4),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
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
  }
}
