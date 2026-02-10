import 'package:flutter/material.dart';
import 'package:dashboardca/core/theme/app_colors.dart';

class MoreOverlay extends StatelessWidget {
  final VoidCallback onClose;

  const MoreOverlay({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).padding.bottom+130,
      right: 16,
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 10,
        child: Container(
          width: 220,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFF1FEFE),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _item(Icons.directions_car, 'Vehicle Entries'),
              _item(Icons.restaurant, 'Mess Management'),
              _item(Icons.thumb_up_rounded, 'Feedbacks'),
              _item(Icons.people, 'Employees Directory'),
              _item(Icons.campaign, 'Announcements'),
              _item(Icons.logout, 'Leave Ledger'),
            ],
          ),
        ),
      ),
    );
  }

 
  Widget _item(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(255, 5, 164, 164), // ✅ primary text color
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

}
