import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pyramids/Core/helper/my_navigator.dart';
import 'package:pyramids/Core/helper/show_snack_bar.dart';

class LocationPermissionScreen extends StatelessWidget {
  final VoidCallback? onEnableLocationAccess;
  final VoidCallback? onNotNow;

  const LocationPermissionScreen({
    super.key,
    this.onEnableLocationAccess,
    this.onNotNow,
  });

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFF1B1B4B);
    const cardColor = Color(0xFFFFFFFF);
    const primaryBlue = Color(0xFF4B42DB);
    const privacyCardBg = Color(0xFFEFF3FE);
    const shieldIconBg = Color(0xFF4B42DB);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(height: 48.h),
            // Header: Target GPS Icon & Title
            Center(
              child: Column(
                children: [
                  Container(
                    width: 72.w,
                    height: 72.h,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(22.r),
                    ),
                    child: const Icon(
                      Icons.my_location_rounded,
                      color: Colors.white,
                      size: 38,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'Location Access Required',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 48.h),

            // Bottom White Sheet Container
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
                    horizontal: 28.w,
                    vertical: 36.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Explanatory Text
                      Text(
                        'Nexus Attendance requires your precise GPS location to verify your proximity to the workplace.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: const Color(0xFF5A607F),
                          height: 1.45,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 28.h),

                      // Privacy First Box
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 24.h,
                        ),
                        decoration: BoxDecoration(
                          color: privacyCardBg,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Column(
                          children: [
                            // Shield Icon with Checkmark
                            Container(
                              width: 36.w,
                              height: 36.h,
                              decoration: const BoxDecoration(
                                color: shieldIconBg,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check_rounded,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                            SizedBox(height: 14.h),
                            Text(
                              'Privacy First',
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF1B1B4B),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'Location is only captured during Check-In and Check-Out. We never track your movement outside of these actions.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: const Color(0xFF6E7191),
                                height: 1.45,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 36.h),

                      // Enable Location Access Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            // 1. Check if location services are enabled
                            bool serviceEnabled =
                                await Geolocator.isLocationServiceEnabled();
                            if (!serviceEnabled) {
                              showCustomSnackBar(
                                context,
                                status: SnackBarStatus.fail,
                                text:
                                    'Location services are disabled. Please enable them in settings.',
                              );
                              return;
                            }

                            // 2. Check & request runtime permission
                            LocationPermission permission =
                                await Geolocator.checkPermission();
                            if (permission == LocationPermission.denied) {
                              permission = await Geolocator.requestPermission();
                              if (permission == LocationPermission.denied) {
                                showCustomSnackBar(
                                  context,
                                  status: SnackBarStatus.fail,
                                  text:
                                      'Please give the app permission to access your location.',
                                );
                                return;
                              }
                            }

                            if (permission ==
                                LocationPermission.deniedForever) {
                              showCustomSnackBar(
                                context,
                                status: SnackBarStatus.fail,
                                text:
                                    'Location permission permanently denied. Please enable it in app settings.',
                              );
                              await Geolocator.openAppSettings();
                              return;
                            }

                            // 3. All checks passed — get position
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryBlue,
                            foregroundColor: Colors.white,
                            elevation: 4,
                            shadowColor: primaryBlue.withValues(alpha: 0.4),
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                          child: Text(
                            'Enable Location Access',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),

                      // Not Now Text Button
                      GestureDetector(
                        onTap: onNotNow,
                        child: Text(
                          'Not Now',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xFF6E7191),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
