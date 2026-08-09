import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramids/Core/Features/Attendance/Presentation/View/LocationPermission.dart';
import 'package:pyramids/Core/helper/my_navigator.dart';

class WorkplaceItem {
  final String id;
  final String title;
  final String subtitle;
  final IconData icon;

  const WorkplaceItem({
    required this.id,
    required this.title,
    required this.subtitle,
    this.icon = Icons.apartment_rounded,
  });
}

class HomeScreen extends StatefulWidget {
  final String tokken;
  final String userName;
  final WorkplaceItem? initialSelectedWorkplace;
  final int maxDistanceMeters;
  final bool initialIsCheckedIn;
  final List<WorkplaceItem> workplaces;
  final VoidCallback? onMenuTap;
  final VoidCallback? onProfileTap;
  final ValueChanged<WorkplaceItem>? onSelectWorkplace;
  final VoidCallback? onCheckInTap;
  final VoidCallback? onCheckOutTap;
  final ValueChanged<int>? onBottomNavTap;
  final int currentBottomNavIndex;

  const HomeScreen({
    super.key,
    required this.tokken,
    required this.userName,
    this.initialSelectedWorkplace,
    this.maxDistanceMeters = 900,
    this.initialIsCheckedIn = false,
    this.workplaces = const [
      WorkplaceItem(
        id: '1',
        title: 'New Cairo Headquarters',
        subtitle: 'Main Administrative Hub',
        icon: Icons.apartment_rounded,
      ),
      WorkplaceItem(
        id: '2',
        title: 'Administrative Capital',
        subtitle: 'Satellite Business District',
        icon: Icons.location_city_rounded,
      ),
    ],
    this.onMenuTap,
    this.onProfileTap,
    this.onSelectWorkplace,
    this.onCheckInTap,
    this.onCheckOutTap,
    this.onBottomNavTap,
    this.currentBottomNavIndex = 0,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WorkplaceItem? _selectedWorkplace;
  late bool _isCheckedIn;

  @override
  void initState() {
    super.initState();
    _selectedWorkplace = widget.initialSelectedWorkplace;
    _isCheckedIn = widget.initialIsCheckedIn;
  }

  void _showWorkplaceBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28.r),
          topRight: Radius.circular(28.r),
        ),
      ),
      builder: (ctx) {
        return WorkplaceSelectionBottomSheet(
          workplaces: widget.workplaces,
          selectedWorkplaceId: _selectedWorkplace?.id,
          onSelect: (item) {
            Navigator.pop(ctx);
            setState(() {
              _selectedWorkplace = item;
            });
            widget.onSelectWorkplace?.call(item);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const headerBgColor = Color(0xFF1B1B4B);
    const primaryBlue = Color(0xFF4B42DB);
    const bodyBgColor = Color(0xFFF6F8FF);
    const lightCardBg = Color(0xFFE8EEFF);
    const infoBoxBg = Color(0xFFE5E7FF);
    const disabledButtonBg = Color(0xFFC7CDED);

    final isCheckInEnabled = _selectedWorkplace != null || _isCheckedIn;

    return Scaffold(
      backgroundColor: bodyBgColor,
      body: Column(
        children: [
          // Dark Header
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 16.h,
              bottom: 24.h,
              left: 20.w,
              right: 20.w,
            ),
            decoration: BoxDecoration(
              color: headerBgColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(28.r),
                bottomRight: Radius.circular(28.r),
              ),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: widget.onMenuTap,
                  child: Container(
                    width: 44.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.menu_rounded, color: Colors.white),
                  ),
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'WELCOME BACK',
                        style: TextStyle(
                          fontSize: 11.sp,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withValues(alpha: 0.6),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        widget.userName,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: widget.onProfileTap,
                  child: Container(
                    width: 44.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person_outline_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Body Content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status Banner Card
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(24.w),
                    decoration: BoxDecoration(
                      color: lightCardBg,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 56.w,
                          height: 56.h,
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.05),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            _isCheckedIn
                                ? Icons.check_circle_outline_rounded
                                : Icons.person_off_outlined,
                            color: _isCheckedIn
                                ? Colors.green.shade600
                                : Colors.black54,
                            size: 28,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          _isCheckedIn ? 'Checked In' : 'Not Checked In',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1B1B4B),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          _isCheckedIn
                              ? 'Session active at ${_selectedWorkplace?.title ?? 'workplace'}'
                              : 'Please select a workplace to start your session.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black54,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // Section Heading
                  Text(
                    'Start Session',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1B1B4B),
                    ),
                  ),
                  SizedBox(height: 14.h),

                  // Select Workplace Tile
                  InkWell(
                    onTap: () => _showWorkplaceBottomSheet(context),
                    borderRadius: BorderRadius.circular(16.r),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      decoration: BoxDecoration(
                        color: lightCardBg,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: primaryBlue,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Icon(
                              _selectedWorkplace?.icon ??
                                  Icons.location_on_outlined,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                          SizedBox(width: 14.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _selectedWorkplace?.title ??
                                      'Select Workplace',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF1B1B4B),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Text(
                                  _selectedWorkplace?.subtitle ??
                                      'Tap to choose location',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.chevron_right_rounded,
                            color: Colors.black45,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 14.h),

                  // Info Notice Box
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: infoBoxBg,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.info_outline_rounded,
                          color: Color(0xFF5A607F),
                          size: 22,
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Text(
                            'You must be within ${widget.maxDistanceMeters} meters of the selected workplace to successfully register your attendance.',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: const Color(0xFF5A607F),
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 28.h),

                  // CHECK IN / CHECK OUT Action Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isCheckInEnabled
                          ? () {
                              goTo(context, page: LocationPermissionScreen());
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isCheckInEnabled
                            ? primaryBlue
                            : disabledButtonBg,
                        disabledBackgroundColor: disabledButtonBg,
                        foregroundColor: Colors.white,
                        disabledForegroundColor: Colors.white70,
                        elevation: isCheckInEnabled ? 4 : 0,
                        shadowColor: isCheckInEnabled
                            ? primaryBlue.withValues(alpha: 0.4)
                            : Colors.transparent,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            _isCheckedIn
                                ? Icons.logout_rounded
                                : Icons.login_rounded,
                            size: 20,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            _isCheckedIn ? 'CHECK OUT' : 'CHECK IN',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
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
            padding: EdgeInsets.symmetric(vertical: 10.h),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  icon: Icons.grid_view_rounded,
                  label: 'HOME',
                  isSelected: widget.currentBottomNavIndex == 0,
                  onTap: () => widget.onBottomNavTap?.call(0),
                ),
                _buildNavItem(
                  icon: Icons.history_rounded,
                  label: 'HISTORY',
                  isSelected: widget.currentBottomNavIndex == 1,
                  onTap: () => widget.onBottomNavTap?.call(1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    const primaryBlue = Color(0xFF4B42DB);
    const unselectedColor = Color(0xFF6E7191);

    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? primaryBlue : unselectedColor,
            size: 24,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
              color: isSelected ? primaryBlue : unselectedColor,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

// Workplace Selection Bottom Sheet Drawer Widget
class WorkplaceSelectionBottomSheet extends StatefulWidget {
  final List<WorkplaceItem> workplaces;
  final String? selectedWorkplaceId;
  final ValueChanged<WorkplaceItem> onSelect;

  const WorkplaceSelectionBottomSheet({
    super.key,
    required this.workplaces,
    this.selectedWorkplaceId,
    required this.onSelect,
  });

  @override
  State<WorkplaceSelectionBottomSheet> createState() =>
      _WorkplaceSelectionBottomSheetState();
}

class _WorkplaceSelectionBottomSheetState
    extends State<WorkplaceSelectionBottomSheet> {
  late String? _selectedId;

  @override
  void initState() {
    super.initState();
    _selectedId = widget.selectedWorkplaceId;
  }

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF4B42DB);
    const selectedBg = Color(0xFFEEF2FF);
    const unselectedBorder = Color(0xFFEEF1F8);

    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 12.h,
        bottom: MediaQuery.of(context).padding.bottom + 20.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top pill handle bar
          Center(
            child: Container(
              width: 36.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          SizedBox(height: 20.h),

          // Title & Subtitle
          Text(
            'Select Workplace',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1B1B4B),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Choose your current office location',
            style: TextStyle(fontSize: 13.sp, color: Colors.black45),
          ),
          SizedBox(height: 20.h),

          // Workplace Options List
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: widget.workplaces.length,
              separatorBuilder: (context, index) => SizedBox(height: 12.h),
              itemBuilder: (context, index) {
                final item = widget.workplaces[index];
                final isSelected = item.id == _selectedId;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedId = item.id;
                    });
                    widget.onSelect(item);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 14.h,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? selectedBg : Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: isSelected ? primaryBlue : unselectedBorder,
                        width: isSelected ? 1.5 : 1.0,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 44.w,
                          height: 44.h,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? primaryBlue
                                : const Color(0xFFEFF2F8),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Icon(
                            item.icon,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF7A849B),
                            size: 22,
                          ),
                        ),
                        SizedBox(width: 14.w),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: isSelected
                                      ? const Color(0xFF2C3258)
                                      : const Color(0xFF4A516D),
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                item.subtitle,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black38,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Checkmark Icon
                        if (isSelected)
                          const Icon(
                            Icons.check_rounded,
                            color: primaryBlue,
                            size: 22,
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
