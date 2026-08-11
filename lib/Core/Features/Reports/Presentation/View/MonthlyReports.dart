import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramids/Core/Features/Reports/Data/Models/ReportsModels.dart';
import 'package:pyramids/Core/Features/Reports/Presentation/Cubit/ReportsCubit.dart';
import 'package:pyramids/Core/Features/Reports/Presentation/Cubit/ReportsState.dart';
import 'package:pyramids/Core/Features/Reports/Presentation/View/DailyReports.dart';
import 'package:pyramids/Core/Util/app_colors.dart';
import 'package:pyramids/Core/helper/show_snack_bar.dart';

class MonthlyReportsScreen extends StatefulWidget {
  final String tokken;
  final String userName;

  const MonthlyReportsScreen({
    super.key,
    required this.tokken,
    required this.userName,
  });

  @override
  State<MonthlyReportsScreen> createState() => _MonthlyReportsScreenState();
}

class _MonthlyReportsScreenState extends State<MonthlyReportsScreen> {
  late final ReportsCubit _reportsCubit;

  @override
  void initState() {
    super.initState();
    _reportsCubit = ReportsCubit()..loadMonthlyHistory(token: widget.tokken);
  }

  @override
  void dispose() {
    _reportsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _reportsCubit,
      child: BlocConsumer<ReportsCubit, ReportsState>(
        listener: (context, state) {
          if (state is ReportsFailure) {
            showCustomSnackBar(
              context,
              text: state.error,
              status: SnackBarStatus.fail,
            );
          }
        },
        builder: (context, state) {
          final historyModel = state is ReportsSuccess
              ? state.historyModel
              : null;

          return Scaffold(
            backgroundColor: AppColors.scaffoldBackground,
            body: SafeArea(
              top: false,
              child: Column(
                children: [
                  _buildHeader(),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if (state is ReportsLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (state is ReportsFailure) {
                          return _buildErrorState(
                            context,
                            message: state.error,
                          );
                        }

                        return _buildContent(
                          context: context,
                          historyModel: historyModel,
                        );
                      },
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

  Widget _buildHeader() {
    return Container(
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
                  widget.userName,
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
    );
  }

  Widget _buildContent({
    required BuildContext context,
    required HistoryModel? historyModel,
  }) {
    final summary = historyModel?.summary;
    final days = [...(historyModel?.days ?? const <Days>[])];
    days.sort((left, right) {
      final rightDate =
          DateTime.tryParse(right.date ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0);
      final leftDate =
          DateTime.tryParse(left.date ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0);
      return rightDate.compareTo(leftDate);
    });
    final totalWorkedMinutes = days.fold<int>(
      0,
      (sum, day) => sum + (day.workedMinutes ?? 0),
    );
    final totalHoursText = _formatWorkedMinutes(totalWorkedMinutes);
    final totalTrackedDays =
        (summary?.present ?? 0) +
        (summary?.incomplete ?? 0) +
        (summary?.absent ?? 0);
    final onTimePercentage = totalTrackedDays == 0
        ? 0
        : (((summary?.present ?? 0) / totalTrackedDays) * 100).round();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: const Color(0xFFE2E8F0).withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                historyModel?.from != null && historyModel?.to != null
                    ? '${historyModel!.from} - ${historyModel.to}'
                    : 'Current Month',
                style: TextStyle(
                  color: const Color(0xFF1E293B),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: _buildMetricCard(
                  value: totalHoursText,
                  valueColor: const Color(0xFF4F46E5),
                  label: 'TOTAL HRS',
                ),
              ),

              SizedBox(width: 12.w),
              Expanded(
                child: _buildMetricCard(
                  value: '${summary?.absent ?? 0}',
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
          if (days.isEmpty)
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.r),
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
              child: Text(
                'No attendance history found.',
                style: TextStyle(
                  color: const Color(0xFF64748B),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          else
            ...days.asMap().entries.map((entry) {
              final index = entry.key;
              final day = entry.value;
              final isWeekend =
                  (day.status ?? '').toLowerCase() == 'weekend' ||
                  day.isWorkingDay == false;
              final isAbsent = (day.status ?? '').toLowerCase() == 'absent';
              final isPresent = (day.status ?? '').toLowerCase() == 'present';

              return Padding(
                padding: EdgeInsets.only(
                  bottom: index == days.length - 1 ? 0 : 12.h,
                ),
                child: _buildLogCard(
                  context: context,
                  dayNumber: _dayNumber(day.date),
                  dateText: day.date ?? 'Unknown date',
                  timeText: _formatWorkedMinutes(day.workedMinutes),
                  statusText: _statusLabel(day.status),
                  isPresent: isPresent,
                  cardBg: isWeekend
                      ? const Color(0xFFDCFCE7).withValues(alpha: 0.7)
                      : isAbsent
                      ? const Color(0xFFFEE2E2).withValues(alpha: 0.7)
                      : null,
                  circleBg: isWeekend
                      ? const Color(0xFF86EFAC).withValues(alpha: 0.5)
                      : isPresent
                      ? const Color(0xFFC7D2FE).withValues(alpha: 0.6)
                      : const Color(0xFFFCA5A5).withValues(alpha: 0.5),
                  circleTextColor: isWeekend
                      ? const Color(0xFF15803D)
                      : isPresent
                      ? const Color(0xFF4F46E5)
                      : const Color(0xFF991B1B),
                  statusColor: isWeekend
                      ? const Color(0xFF15803D)
                      : isPresent
                      ? const Color(0xFF10B981)
                      : const Color(0xFFDC2626),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DailyReportsScreen(
                          dateText: day.date ?? 'Unknown date',
                          totalHours: _formatWorkedMinutes(day.workedMinutes),
                          status: _statusLabel(day.status),
                          checkInTime: day.checkInAt ?? '--',
                          checkOutTime: day.checkOutAt ?? '--',
                          location: day.workplaceName ?? 'Workplace',
                          userName: widget.userName,
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, {required String message}) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cloud_off_outlined,
              size: 54.sp,
              color: const Color(0xFF94A3B8),
            ),
            SizedBox(height: 14.h),
            Text(
              'Could not load reports',
              style: TextStyle(
                color: const Color(0xFF1E293B),
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF64748B),
                fontSize: 14.sp,
                height: 1.4,
              ),
            ),
            SizedBox(height: 18.h),
            ElevatedButton(
              onPressed: () {
                _reportsCubit.loadMonthlyHistory(token: widget.tokken);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4F46E5),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                ),
              ),
              child: const Text('Retry'),
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

  String _dayNumber(String? date) {
    if (date == null || date.isEmpty) {
      return '--';
    }

    final match = RegExp(r'(\d{1,2})').firstMatch(date);
    return match?.group(1) ?? '--';
  }

  String _statusLabel(String? status) {
    if (status == null || status.isEmpty) {
      return 'Unknown';
    }

    return status[0].toUpperCase() + status.substring(1).toLowerCase();
  }

  String _formatWorkedMinutes(int? minutes) {
    final totalMinutes = minutes ?? 0;
    final hours = totalMinutes ~/ 60;
    final remainingMinutes = totalMinutes % 60;
    return '${hours.toString().padLeft(2, '0')}h ${remainingMinutes.toString().padLeft(2, '0')}m';
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
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
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
