import 'package:dashboardca/features/dashboard/presentation/widgets/bottom_nav_notch.dart';
import 'package:flutter/material.dart';
import 'package:dashboardca/core/theme/app_colors.dart';
// import 'bottom_nav_notch_painter.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final VoidCallback onMoreTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.onMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final itemWidth = width / 5;

    return SizedBox(
      height: 100,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          /// 🔹 Background with notch
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
          
             
            
            child: CustomPaint(
              size: Size(width, 100),
              painter: BottomNavNotchPainter(
                index: currentIndex,
                itemWidth: itemWidth,
              ),
            ),
          ),

          /// 🔹 Icons row
          Positioned.fill(
            child: Row(
              children: [
                _item(context, 0, 'assets/images/dashboard.png', 'Dashboard'),
                _item(
                  context,
                  1,
                  'assets/images/appointments.png',
                  'Appointments',
                ),
                _item(context, 2, 'assets/images/meeting.png', 'Meeting'),
                _item(context, 3, 'assets/images/compliance.png', 'Compliance'),
                _moreItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(BuildContext context, int index, String icon, String label) {
    final bool isActive = currentIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              transform: Matrix4.translationValues(0, isActive ? -28 : 0, 0),
              height: isActive ? 64 : 44,
              width: isActive ? 64 : 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? AppColors.primary : Colors.transparent,
              ),
              child: Center(
                child: Image.asset(
                  icon,
                  height: isActive ? 30 : 24,
                  color: isActive ? Colors.white :AppColors.primary,
                ),
              ),
            ),

            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  
 Widget _moreItem() {
    final bool isActive = currentIndex == 4;

    return Expanded(
      child: GestureDetector(
        onTap:onMoreTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              transform: Matrix4.translationValues(0, isActive ? -28 : 0, 0),
              height: isActive ? 64 : 44,
              width: isActive ? 64 : 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? AppColors.primary : Colors.transparent,
              ),
              child: Icon(
                Icons.menu,
                color: isActive ? Colors.white : AppColors.primary,
                size: isActive ? 30 : 24,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'More',
              style: TextStyle(fontSize: 12, color: AppColors.primary),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

}
