// lib/core/theme/app_text_styles.dart
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const headerName = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white1,
  );

  static const headerRole = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.white70,
  );

  static const statNumber = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static const statTitle = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  static const sectionTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
}
