import 'package:dashboardca/core/theme/app_colors.dart';
import 'package:dashboardca/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final String icon;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 82,
      height: 74,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6), // smaller padding
      decoration: BoxDecoration(
        color: AppColors.white1,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.5)), // lighter border
        boxShadow: const [
          BoxShadow(blurRadius: 6, offset: Offset(0, 4), color: Colors.black12),
        ],
      ),
         child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // ✅ STAT NUMBER — RIGHT
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              value,
              style: AppTextStyles.statNumber.copyWith(
                color: color,
                fontSize: 25,
                height: 1,
              ),
              maxLines: 1,
            ),
          ),

          const SizedBox(height: 4),

          // ✅ TITLE — BELOW NUMBER
          _StyledTitle(title: title),
        ],
      ),
    );
  }
}
 
class _StyledTitle extends StatelessWidget {
  final String title;

  const _StyledTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    final words = title.split(' ');

    return RichText(
      maxLines: 6,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: '${words.take(words.length - 1).join(' ')}\n',
            style: AppTextStyles.statTitle.copyWith(fontSize: 10, height: 1.1),
          ),
          TextSpan(
            text: words.last,
            style: AppTextStyles.statTitle.copyWith(
              fontSize: 15, // 👈 slightly bigger
              fontWeight: FontWeight.w600, // 👈 bold
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}
