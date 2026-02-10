import 'package:dashboardca/features/dashboard/presentation/pages/customize_quick_links_dialog_page.dart';
import 'package:flutter/material.dart';


class QuickLinksSection extends StatelessWidget {
  const QuickLinksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Quick Links',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => const CustomizeQuickLinksDialog(),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Icon(Icons.tune, size: 18),
                    SizedBox(width: 4),
                    Text('Customize',style: TextStyle(color: Colors.black),),
                  ],
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _QuickIcon(title: 'Add Employee', icon: Icons.person_add),
            _QuickIcon(title: 'Schedule\nMeeting', icon: Icons.calendar_month),
            _QuickIcon(title: 'Visitor\nPass', icon: Icons.badge),
            _QuickIcon(title: 'Raise\nCompliance', icon: Icons.description),
          ],
        ),
      ],
    );
  }
}

class _QuickIcon extends StatelessWidget {
  final String title;
  final IconData icon;

  const _QuickIcon({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(title, textAlign: TextAlign.center),
      ],
    );
  }
}
