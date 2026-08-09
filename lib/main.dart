import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramids/Core/Features/Auth/Presentation/View/Login.dart';
import 'package:pyramids/Core/Features/Auth/Presentation/View/SignUp.dart';
import 'package:pyramids/Core/Features/Home/Presentation/View/Home.dart';

void main() {
  runApp(const Pyramids());
}

class Pyramids extends StatelessWidget {
  const Pyramids({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 890),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
        );
      },
    );
  }
}
