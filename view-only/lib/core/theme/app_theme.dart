import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData buildAquaTheme() {
  final scheme = ColorScheme.fromSeed(
    seedColor: AquaColors.aqua,
    primary: AquaColors.forest,
    surface: AquaColors.sand,
  );
  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: AquaColors.sand,
  );
}
