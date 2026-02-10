import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'approval_avatar.dart';

class ApprovalStrip extends StatelessWidget {
  const ApprovalStrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.orange,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
       // crossAxisAlignment: CrossAxisAlignment.values[0],
        children: [
          const ApprovalAvatar(label: 'Leave\nApprovals', icon: Icons.event),
          const ApprovalAvatar(label: 'C.Rajesh'),
          const ApprovalAvatar(label: 'M.Sarjin'),
          const ApprovalAvatar(label: 'F.Ramesh'),
          const ApprovalAvatar(label: 'R.Raja\nLakshmi'),
          const Spacer(),
          const ApprovalAvatar(
            label: 'View all',
            icon: Icons.arrow_forward_ios,
          ),
        ],
      ),
    );
  }
}
