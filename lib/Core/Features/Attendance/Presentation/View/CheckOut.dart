import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

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
                child: Column(
                  children: [
                    // Checked In Card
                    Container(
                      padding: EdgeInsets.all(20.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.03),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Checked In',
                                    style: TextStyle(
                                      color: const Color(0xFF101828),
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  Row(
                                    children: [
                                      Container(
                                        width: 8.r,
                                        height: 8.r,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF12B76A),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SizedBox(width: 6.w),
                                      Text(
                                        'Session active',
                                        style: TextStyle(
                                          color: const Color(0xFF475467),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // Green Check Circle
                              Container(
                                width: 44.r,
                                height: 44.r,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFECFDF3),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.check_circle_rounded,
                                  color: const Color(0xFF12B76A),
                                  size: 26.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          // Workplace Inner Card
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 14.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8F9FE),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 40.r,
                                  height: 40.r,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE0E0FF),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Icon(
                                    Icons.business_outlined,
                                    color: const Color(0xFF4F46E5),
                                    size: 22.sp,
                                  ),
                                ),
                                SizedBox(width: 14.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Workplace',
                                        style: TextStyle(
                                          color: const Color(0xFF667085),
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 2.h),
                                      Text(
                                        'New Cairo Headquarters',
                                        style: TextStyle(
                                          color: const Color(0xFF101828),
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20.h),

                    // Total Working Time Blue/Purple Card
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 24.h,
                        horizontal: 20.w,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4F46E5),
                        borderRadius: BorderRadius.circular(24.r),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(
                              0xFF4F46E5,
                            ).withValues(alpha: 0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            'TOTAL WORKING TIME',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.8),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.0,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            '07:51:24',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 42.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.access_time_rounded,
                                color: Colors.white.withValues(alpha: 0.8),
                                size: 18.sp,
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                'Started at 08:30 AM',
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.9),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // Check Out Button
                    SizedBox(
                      width: double.infinity,
                      height: 56.h,
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
                            Icon(
                              Icons.logout_rounded,
                              color: Colors.white,
                              size: 22.sp,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              'CHECK OUT',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
