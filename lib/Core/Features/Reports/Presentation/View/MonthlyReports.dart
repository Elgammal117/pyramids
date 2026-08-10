import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramids/Core/Features/Reports/Presentation/View/DailyReports.dart';

class MonthlyReportsScreen extends StatelessWidget {
  final String tokken;
  final String userName;

  const MonthlyReportsScreen({
    super.key,
    required this.tokken,
    required this.userName,
  });

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
                  SizedBox(width: 14.w),
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
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Month Selector Dropdown / Pill
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE2E8F0).withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        'Current Month',
                        style: TextStyle(
                          color: const Color(0xFF1E293B),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),

                    Row(
                      children: [
                        Expanded(
                          child: _buildMetricCard(
                            value: '164h',
                            valueColor: const Color(0xFF4F46E5),
                            label: 'TOTAL HRS',
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: _buildMetricCard(
                            value: '92%',
                            valueColor: const Color(0xFF10B981),
                            label: 'ON-TIME',
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: _buildMetricCard(
                            value: '1',
                            valueColor: const Color(0xFFEF4444),
                            label: 'ABSENT',
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 28.h),

                    Text(
                      'Recent Logs',
                      style: TextStyle(
                        color: const Color(0xFF1E293B),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 16.h),

                    _buildLogCard(
                      context: context,
                      dayNumber: '24',
                      dateText: 'Oct 24, Tue',
                      timeText: '07h 51m',
                      statusText: 'Present',
                      isPresent: true,
                      circleBg: const Color(0xFFC7D2FE).withValues(alpha: 0.6),
                      circleTextColor: const Color(0xFF4F46E5),
                    ),
                    SizedBox(height: 12.h),

                    _buildLogCard(
                      context: context,
                      dayNumber: '23',
                      dateText: 'Oct 23, Mon',
                      timeText: '08h 12m',
                      statusText: 'Present',
                      isPresent: true,
                      circleBg: const Color(0xFFC7D2FE).withValues(alpha: 0.6),
                      circleTextColor: const Color(0xFF4F46E5),
                    ),
                    SizedBox(height: 12.h),

                    _buildLogCard(
                      context: context,
                      dayNumber: '22',
                      dateText: 'Oct 22, Sun',
                      timeText: '07h 45m',
                      statusText: 'Present',
                      isPresent: true,
                      circleBg: const Color(0xFFC7D2FE).withValues(alpha: 0.6),
                      circleTextColor: const Color(0xFF4F46E5),
                    ),
                    SizedBox(height: 12.h),

                    _buildLogCard(
                      context: context,
                      dayNumber: '21',
                      dateText: 'Oct 21, Sat',
                      timeText: '--',
                      statusText: 'Absent',
                      isPresent: false,
                      cardBg: const Color(0xFFFEE2E2).withValues(alpha: 0.7),
                      circleBg: const Color(0xFFFCA5A5).withValues(alpha: 0.5),
                      circleTextColor: const Color(0xFF991B1B),
                      statusColor: const Color(0xFFDC2626),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard({
    required String value,
    required Color valueColor,
    required String label,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            label,
            style: TextStyle(
              color: const Color(0xFF64748B),
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogCard({
    required BuildContext context,
    required String dayNumber,
    required String dateText,
    required String timeText,
    required String statusText,
    required bool isPresent,
    Color? cardBg,
    required Color circleBg,
    required Color circleTextColor,
    Color statusColor = const Color(0xFF10B981),
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DailyReportsScreen(
              dateText: dateText,
              totalHours: isPresent ? timeText : '00h 00m',
              status: isPresent ? 'Status: Completed' : 'Status: Absent',
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: cardBg ?? Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: cardBg == null
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            // Day circle badge
            Container(
              width: 44.r,
              height: 44.r,
              decoration: BoxDecoration(
                color: circleBg,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  dayNumber,
                  style: TextStyle(
                    color: circleTextColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(width: 14.w),

            // Date & Time details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dateText,
                    style: TextStyle(
                      color: const Color(0xFF1E293B),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: const Color(0xFF64748B),
                        size: 14.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        timeText,
                        style: TextStyle(
                          color: const Color(0xFF64748B),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        '•',
                        style: TextStyle(
                          color: const Color(0xFF94A3B8),
                          fontSize: 13.sp,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        statusText,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Arrow Right Icon
            Icon(
              Icons.chevron_right_rounded,
              color: const Color(0xFF94A3B8),
              size: 22.sp,
            ),
          ],
        ),
      ),
    );
  }
}
