import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessfulScreen extends StatelessWidget {
  const SuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA8C0FD).withValues(alpha: 0.08),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            // Top Dark Header Bar
            Container(
              padding: EdgeInsets.only(
                top: 50.h,
                left: 20.w,
                right: 20.w,
                bottom: 24.h,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF1B1B4B),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32.r),
                  bottomRight: Radius.circular(32.r),
                ),
              ),
              child: Row(
                children: [
                  // Menu Button
                  Container(
                    width: 44.r,
                    height: 44.r,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.menu, color: Colors.white, size: 22.sp),
                  ),
                  SizedBox(width: 14.w),
                  // Welcome Text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'WELCOME BACK',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.6),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.8,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'Alexander Wright',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Profile Icon
                  Container(
                    width: 44.r,
                    height: 44.r,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.white,
                      size: 22.sp,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 32.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Circular dashed green check badge
                      Container(
                        width: 100.r,
                        height: 100.r,
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF6EE7B7),
                            width: 2.w,
                          ),
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFFECFDF5),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Container(
                              width: 48.r,
                              height: 48.r,
                              decoration: const BoxDecoration(
                                color: Color(0xFF10B981),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 28.sp,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 24.h),

                      // Check Out Successful Text
                      Text(
                        'Check Out Successful',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF101828),
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 10.h),

                      // Description
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          'You have successfully checked out from New Cairo Headquarters.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF667085),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.4,
                          ),
                        ),
                      ),

                      SizedBox(height: 24.h),

                      // Duration & Check out time card
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFFC7D2FE,
                          ).withValues(alpha: 0.45),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Column(
                          children: [
                            // Total Duration Row
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time_rounded,
                                  color: const Color(0xFF475467),
                                  size: 20.sp,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  'Total Duration',
                                  style: TextStyle(
                                    color: const Color(0xFF475467),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  '07h 51m',
                                  style: TextStyle(
                                    color: const Color(0xFF1B1B4B),
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 14.h),

                            // Divider
                            Divider(
                              color: const Color(
                                0xFF94A3B8,
                              ).withValues(alpha: 0.3),
                              height: 1,
                            ),

                            SizedBox(height: 14.h),

                            // Check Out Time Row
                            Row(
                              children: [
                                Icon(
                                  Icons.logout_rounded,
                                  color: const Color(0xFF475467),
                                  size: 20.sp,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  'Check Out Time',
                                  style: TextStyle(
                                    color: const Color(0xFF475467),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  '04:35 PM',
                                  style: TextStyle(
                                    color: const Color(0xFF1B1B4B),
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 24.h),

                      // View Daily Report Button
                      SizedBox(
                        width: double.infinity,
                        height: 54.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4F46E5),
                            elevation: 4,
                            shadowColor: const Color(
                              0xFF4F46E5,
                            ).withValues(alpha: 0.4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'View Daily Report',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                                size: 20.sp,
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 12.h),

                      // Return to Dashboard Button
                      SizedBox(
                        width: double.infinity,
                        height: 52.h,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xFFF8F9FE),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                          child: Text(
                            'Return to Dashboard',
                            style: TextStyle(
                              color: const Color(0xFF4F46E5),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Navigation Bar
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: const Color(0xFFEAECF0), width: 1.w),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Home Tab
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.grid_view_rounded,
                        color: const Color(0xFF4F46E5),
                        size: 24.sp,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'HOME',
                        style: TextStyle(
                          color: const Color(0xFF4F46E5),
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  // History Tab
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.history_rounded,
                        color: const Color(0xFF667085),
                        size: 24.sp,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'HISTORY',
                        style: TextStyle(
                          color: const Color(0xFF667085),
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
