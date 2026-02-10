import 'package:flutter/material.dart';

class ApprovalAvatar extends StatelessWidget {
  final String label;
  final IconData? icon;

  const ApprovalAvatar({
    super.key,
    required this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: icon != null
                ? Icon(icon, size: 18, color: Colors.orange)
                : const Icon(Icons.person, size: 18),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
