import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_typography.dart';
import '../widgets/aqua_button.dart';
import '../widgets/hydration_ring.dart';
import '../widgets/product_card.dart';

class AquaHomeScreen extends StatelessWidget {
  const AquaHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AquaColors.sand,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Halo, Andi — AQUA Delivery',
                      style: AquaTypography.greeting,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Penuhi hidrasimu hari ini',
                      style: AquaTypography.headline,
                    ),
                    const SizedBox(height: 16),
                    const HydrationRing(
                      progress: 0.65,
                      label: '1,3L dari target 2L — 2 gelas lagi',
                    ),
                    const SizedBox(height: 16),
                    const ProductCard(
                      title: 'Galon 19L',
                      subtitle: 'Isi ulang — antar 2 jam',
                      price: 'Rp 21K',
                      highlight: true,
                    ),
                    const SizedBox(height: 12),
                    const ProductCard(
                      title: 'Botol 600ml × 12',
                      subtitle: 'Kardus — stok ready',
                      price: 'Rp 58K',
                    ),
                    const SizedBox(height: 16),
                    AquaButton(label: 'Pesan Sekarang', onTap: () {}),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
