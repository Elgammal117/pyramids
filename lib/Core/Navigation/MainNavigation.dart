import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramids/Core/Features/Attendance/Presentation/View/Home.dart';
import 'package:pyramids/Core/Features/Reports/Presentation/View/MonthlyReports.dart';

class MainNavigation extends StatefulWidget {
  final String tokken;
  final String userName;

  MainNavigation({super.key, required this.tokken, required this.userName});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  void _onNavTap(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeScreen(
            tokken: widget.tokken,
            userName: widget.userName,
            currentBottomNavIndex: _currentIndex,
            onBottomNavTap: _onNavTap,
          ),
          MonthlyReportsScreen(
            tokken: widget.tokken,
            userName: widget.userName,
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    return Container(
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
          _buildNavItem(index: 0, icon: Icons.grid_view_rounded, label: 'HOME'),
          _buildNavItem(
            index: 1,
            icon: Icons.history_rounded,
            label: 'HISTORY',
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final bool isActive = _currentIndex == index;
    final Color activeColor = const Color(0xFF4F46E5);
    final Color inactiveColor = const Color(0xFF667085);

    return GestureDetector(
      onTap: () => _onNavTap(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? activeColor : inactiveColor,
            size: 24.sp,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              color: isActive ? activeColor : inactiveColor,
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
