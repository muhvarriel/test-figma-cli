import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_typography.dart';
import '../widgets/brew_pill_selector.dart';
import '../widgets/featured_card.dart';
import '../widgets/menu_list_item.dart';
import '../widgets/primary_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _strength = 0;
  static const _options = ['Ringan', 'Sedang', 'Kuat'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.oatBg,
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
                      'Halo, Sinta — KopiCraft Roastery',
                      style: AppTypography.greeting,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Mau ngopi apa hari ini?',
                      style: AppTypography.headline,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 48,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Text(
                        'Cari Gayo, Toraja, Cold Brew...',
                        style: AppTypography.searchHint,
                      ),
                    ),
                    const SizedBox(height: 16),
                    BrewPillSelector(
                      options: _options,
                      selectedIndex: _strength,
                      onSelected: (i) => setState(() => _strength = i),
                    ),
                    const SizedBox(height: 16),
                    const FeaturedCard(),
                    const SizedBox(height: 16),
                    const MenuListItem(title: 'Espresso Tubruk — Rp 22K'),
                    const SizedBox(height: 12),
                    const MenuListItem(title: 'Cold Brew Aren — Rp 28K'),
                    const SizedBox(height: 16),
                    PrimaryButton(
                      label: 'Pesan Sekarang — Ambil di Bar',
                      onTap: () {},
                    ),
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
