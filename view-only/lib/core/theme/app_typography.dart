import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AquaTypography {
  static const greeting = TextStyle(fontSize: 14, color: AquaColors.muted);
  static const headline = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    height: 1.2,
    color: AquaColors.ink,
  );
  static const ringValue = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AquaColors.forest,
  );
  static const ringLabel = TextStyle(fontSize: 12, color: AquaColors.muted);
  static const cardTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AquaColors.ink,
  );
  static const cardSub = TextStyle(fontSize: 13, color: AquaColors.muted);
  static const price = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AquaColors.forest,
  );
  static const cta = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
}
