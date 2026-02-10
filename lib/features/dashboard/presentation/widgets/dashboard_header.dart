import 'package:flutter/material.dart';

import 'package:dashboardca/core/theme/app_colors.dart';
import 'package:dashboardca/core/theme/app_spacing.dart';
import 'package:dashboardca/core/theme/app_text_style.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        48,
        AppSpacing.md,
        AppSpacing.lg,
      ),
      decoration: BoxDecoration(
        color: AppColors.headerGreen,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        border: Border.all(color: AppColors.black1, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.55),
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),

      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('lib/assets/images/profile.png'),
          ),

          const SizedBox(width: AppSpacing.sm),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('K. Ashok Kumar', style: AppTextStyles.headerName),
                SizedBox(height: AppSpacing.xs),
                Text(
                  'Admin (Managing Director)',
                  style: AppTextStyles.headerRole,
                ),
              ],
            ),
          ),

          _IconWithDot(assetPath: 'assets/images/chat.png'),
          const SizedBox(width: AppSpacing.sm),
          _IconWithDot(assetPath: 'assets/images/bell.png'),
        ],
      ),
    );
  }
}

/*                              PRIVATE WIDGET                                */

class _IconWithDot extends StatelessWidget {
  final String assetPath;

  const _IconWithDot({required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(assetPath, width: 32, height: 32, color: AppColors.white1),
        Positioned(
          top: 2,
          right: 2,
          child: Container(
            width: 9,
            height: 9,
            
            decoration: const BoxDecoration(
              color: AppColors.red1,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
