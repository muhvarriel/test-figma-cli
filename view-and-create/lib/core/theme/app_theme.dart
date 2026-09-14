import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Material 3 theme mapped from Figma KopiCraft tokens.
ThemeData buildAppTheme() {
  final scheme = ColorScheme.fromSeed(
    seedColor: AppColors.caramel,
    primary: AppColors.caramel,
    surface: AppColors.oatBg,
  );
  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: AppColors.oatBg,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.oatBg,
      foregroundColor: AppColors.espresso,
      elevation: 0,
    ),
  );
}
