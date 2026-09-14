import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_typography.dart';

class FeaturedCard extends StatelessWidget {
  const FeaturedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.moss,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('SINGLE ORIGIN — GAYO', style: AppTypography.eyebrow),
          SizedBox(height: 8),
          Text('Wine Process Pour Over', style: AppTypography.featuredTitle),
          SizedBox(height: 4),
          Text(
            'Floral, anggur merah, Rp 38K',
            style: AppTypography.featuredBody,
          ),
        ],
      ),
    );
  }
}
