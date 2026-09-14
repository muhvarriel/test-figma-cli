import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Type scale for KopiCraft.
/// Display: Outfit-style geometric (system fallback), Body: Jakarta-style.
abstract final class AppTypography {
  static const greeting = TextStyle(
    fontSize: 14,
    height: 1.2,
    color: AppColors.muted,
  );
  static const headline = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 1.2,
    color: AppColors.espresso,
  );
  static const searchHint = TextStyle(fontSize: 14, color: AppColors.muted);
  static const pillSelected = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static const pillUnselected = TextStyle(fontSize: 13, color: AppColors.oatBg);
  static const eyebrow = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.6,
    color: AppColors.clay,
  );
  static const featuredTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
  static const featuredBody = TextStyle(fontSize: 13, color: AppColors.oatBg);
  static const menuTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.espresso,
  );
  static const cta = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
}
