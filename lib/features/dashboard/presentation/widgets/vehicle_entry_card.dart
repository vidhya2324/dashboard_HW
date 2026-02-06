import 'package:dashboardca/core/theme/app_colors.dart';
import 'package:dashboardca/core/theme/app_spacing.dart';
import 'package:flutter/material.dart';
class VehicleEntryCard extends StatelessWidget {
  const VehicleEntryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFF91F191)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const SizedBox(height: 4),
              const Text(
                'HR solutions, Surat',
                style: TextStyle(color: Color(0xFF12ABC0)),
              ),
              const Text(
                'TN 58 AA 0126',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 1),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Checked In\n10:30 AM'),
                  Text('Checked Out\n         -'),
                ],
              ),
            ],
          ),
        ),

        _Chip('Vehicle Entry', AppColors.green),
      ],
    );
  }
}


class _Chip extends StatelessWidget {
  final String text;
  final Color color;

  const _Chip(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
