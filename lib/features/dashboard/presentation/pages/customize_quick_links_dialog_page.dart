import 'package:dashboardca/features/dashboard/presentation/widgets/selected_quick_link.dart';
import 'package:flutter/material.dart';
import 'package:dashboardca/core/theme/app_colors.dart';
import '../models/quick_link_item.dart';
import '../widgets/available_quick_link_item.dart';

class CustomizeQuickLinksDialog extends StatefulWidget {
  const CustomizeQuickLinksDialog({super.key});

  @override
  State<CustomizeQuickLinksDialog> createState() =>
      _CustomizeQuickLinksDialogState();
}

class _CustomizeQuickLinksDialogState extends State<CustomizeQuickLinksDialog> {
  final List<QuickLinkItem> selectedLinks = [
    QuickLinkItem(label: 'Add Employee', icon: Icons.person_add),
    QuickLinkItem(label: 'Schedule Meeting', icon: Icons.schedule),
    QuickLinkItem(label: 'Visitor Pass', icon: Icons.badge),
    QuickLinkItem(label: 'Raise Compliance', icon: Icons.assignment),
  ];

  final List<QuickLinkItem> availableLinks = [
    QuickLinkItem(label: 'Add Announcement', icon: Icons.campaign),
    QuickLinkItem(label: 'Request Leave', icon: Icons.event_busy),
    QuickLinkItem(label: 'Vehicle Entry', icon: Icons.local_shipping),
  ];

  void removeFromSelected(QuickLinkItem item) {
    setState(() {
      selectedLinks.remove(item);
      availableLinks.add(item);
    });
  }

  void addToSelected(QuickLinkItem item) {
    setState(() {
      availableLinks.remove(item);
      selectedLinks.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        height: 400,
        child: Column(
          children: [
            /// HEADER
            Container(
              height: 72,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Stack(
                children: [
                  const Center(
                    child: Text(
                      'Select your quick links',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 12,
                    top: 12,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.close, size: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// BODY
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  /// CURRENTLY SELECTED
                  const Text(
                    'Currently Selected',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),

                  SizedBox(
                    height: 95,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: selectedLinks.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final item = selectedLinks[index];
                        return SelectedQuickLinkItem(
                          item: item,
                          onRemove: () => removeFromSelected(item),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// AVAILABLE LINKS
                  const Text(
                    'Available Quick Links',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),

                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: availableLinks.map((item) {
                      return AvailableQuickLinkItem(
                        item: item,
                        onAdd: () => addToSelected(item),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 32),

                  /// BUTTONS
                  Row(
                    children: [
                      Expanded(
                        child: _ActionButton(text: 'Reset', onTap: () {}),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _ActionButton(
                          text: 'Save Changes',
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
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

/// BOTTOM BUTTON
class _ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _ActionButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
