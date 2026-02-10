import 'package:flutter/material.dart';
import '../models/quick_link_item.dart';
import 'package:dashboardca/core/theme/app_colors.dart';

class AvailableQuickLinkItem extends StatelessWidget {
  final QuickLinkItem item;
  final VoidCallback onAdd;

  const AvailableQuickLinkItem({
    super.key,
    required this.item,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: onAdd,
          child: Column(
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primary),
                ),
                child: Icon(item.icon, color: AppColors.primary, size: 22),
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: 60,
                child: Text(
                  item.label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
        ),

        /// ✅ GREEN TICK
        Positioned(
          top: -4,
          right: -2,
          child: Container(
            height: 18,
            width: 15,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check, size: 12, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
