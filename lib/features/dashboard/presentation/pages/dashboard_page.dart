import 'package:dashboardca/core/theme/app_colors.dart';
import 'package:dashboardca/core/theme/app_spacing.dart';
import 'package:flutter/material.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/stat_card.dart';
import '../widgets/announcement_card.dart';
import '../widgets/vehicle_entry_card.dart';


class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const DashboardHeader(),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 358,
                    height: 85,
                    child: Row(
                      
                     // spacing: AppSpacing.md,
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        StatCard(
                          title: 'Employees on Leave',
                          value: '10',
                          color: AppColors.blue,
                          icon: 'assets/images/profile.png',
                          
                        ),
                        StatCard(
                          title: 'Scheduled Meetings',
                          value: '10',
                          color: AppColors.yellow,
                          icon: 'assets/images/chat.png',
                        ),
                        StatCard(
                          title: 'Expected Visitors',
                          value: '10',
                          color: AppColors.green,
                          icon: 'assets/images/profile.png',
                        ),
                        StatCard(
                          title: 'Arrived Vehicles',
                          value: '10',
                          color: AppColors.orange,
                          icon: 'assets/images/bell.png',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  const Text(
                    'Latest Updates',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                 const SizedBox(height:2),
                  const Row(
                    children: [
                      Expanded(child: AnnouncementCard()),
                     SizedBox(width: AppSpacing.md),
                      Expanded(child: VehicleEntryCard()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
