import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_typography.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    this.highlight = false,
  });

  final String title;
  final String subtitle;
  final String price;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: highlight ? AquaColors.forest : AquaColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: AquaTypography.cardTitle.copyWith(
                    color: highlight ? Colors.white : AquaColors.ink,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: AquaTypography.cardSub.copyWith(
                    color: highlight ? AquaColors.mint : AquaColors.muted,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  price,
                  style: AquaTypography.price.copyWith(
                    color: highlight ? Colors.white : AquaColors.forest,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: highlight ? AquaColors.coral : AquaColors.mint,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              'Pesan',
              style: AquaTypography.cardTitle.copyWith(
                fontSize: 14,
                color: highlight ? Colors.white : AquaColors.forest,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
