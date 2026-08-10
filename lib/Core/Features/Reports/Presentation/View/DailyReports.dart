import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramids/Core/Util/app_colors.dart';

class DailyReportsScreen extends StatelessWidget {
  final String dateText;
  final String totalHours;
  final String productivity;
  final String status;
  final String checkInTime;
  final String checkOutTime;
  final String location;

  const DailyReportsScreen({
    super.key,
    this.dateText = 'Mon, Oct 24',
    this.totalHours = '07h 51m',
    this.productivity = '94%',
    this.status = 'Status: Completed',
    this.checkInTime = '08:30 AM',
    this.checkOutTime = '04:35 PM',
    this.location = 'New Cairo Headquarters',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
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
                  // Menu / Back Button
                  InkWell(
                    onTap: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      width: 44.r,
                      height: 44.r,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 22.sp,
                      ),
                    ),
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
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Daily Report Blue Card Container
                    Container(
                      padding: EdgeInsets.all(20.r),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDBE7FE).withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Column(
                        children: [
                          // Title & Date Header
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Daily Report',
                                style: TextStyle(
                                  color: const Color(0xFF1E293B),
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                dateText,
                                style: TextStyle(
                                  color: const Color(0xFF64748B),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 16.h),

                          // Total Hours & Productivity Row
                          Row(
                            children: [
                              // TOTAL HOURS
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 14.w,
                                    vertical: 14.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'TOTAL HOURS',
                                        style: TextStyle(
                                          color: const Color(0xFF64748B),
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      SizedBox(height: 6.h),
                                      Text(
                                        totalHours,
                                        style: TextStyle(
                                          color: const Color(0xFF312E81),
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(width: 12.w),

                              // PRODUCTIVITY
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 14.w,
                                    vertical: 14.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'PRODUCTIVITY',
                                        style: TextStyle(
                                          color: const Color(0xFF64748B),
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      SizedBox(height: 6.h),
                                      Text(
                                        productivity,
                                        style: TextStyle(
                                          color: const Color(0xFF4F46E5),
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 14.h),

                          // Status Pill Container
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            decoration: BoxDecoration(
                              color: const Color(0xFFDCFCE7),
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 20.r,
                                  height: 20.r,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF15803D),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 14.sp,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  status,
                                  style: TextStyle(
                                    color: const Color(0xFF15803D),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 28.h),

                    // Activity Timeline Header
                    Text(
                      'Activity Timeline',
                      style: TextStyle(
                        color: const Color(0xFF1E293B),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 20.h),

                    // Timeline Items
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Timeline line & dots column
                          Column(
                            children: [
                              // Top dot
                              Container(
                                width: 14.r,
                                height: 14.r,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF4F46E5),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              // Vertical connecting line
                              Expanded(
                                child: Container(
                                  width: 2.w,
                                  color: const Color(0xFFCBD5E1),
                                ),
                              ),
                              // Bottom dot
                              Container(
                                width: 14.r,
                                height: 14.r,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF4F46E5),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(width: 14.w),

                          // Cards Column
                          Expanded(
                            child: Column(
                              children: [
                                // Check-in card
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 14.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(
                                      0xFFE0E7FF,
                                    ).withValues(alpha: 0.6),
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Check-in',
                                              style: TextStyle(
                                                color: const Color(0xFF1E293B),
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 4.h),
                                            Text(
                                              location,
                                              style: TextStyle(
                                                color: const Color(0xFF64748B),
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        checkInTime,
                                        style: TextStyle(
                                          color: const Color(0xFF312E81),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 16.h),

                                // Check-out card
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 16.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(
                                      0xFFE0E7FF,
                                    ).withValues(alpha: 0.6),
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Check-out',
                                        style: TextStyle(
                                          color: const Color(0xFF1E293B),
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        checkOutTime,
                                        style: TextStyle(
                                          color: const Color(0xFF312E81),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
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
                        color: const Color(0xFF667085),
                        size: 24.sp,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'HOME',
                        style: TextStyle(
                          color: const Color(0xFF667085),
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
                        color: const Color(0xFF4F46E5),
                        size: 24.sp,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'HISTORY',
                        style: TextStyle(
                          color: const Color(0xFF4F46E5),
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
