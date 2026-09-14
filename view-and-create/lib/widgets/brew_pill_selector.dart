import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_typography.dart';

/// Signature element: Brew Strength Pill Selector.
/// Dark rounded container with 3 options, selected = caramel pill.
class BrewPillSelector extends StatelessWidget {
  const BrewPillSelector({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<String> options;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.darkPill,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Row(
        children: [
          for (var i = 0; i < options.length; i++)
            Expanded(
              child: GestureDetector(
                onTap: () => onSelected(i),
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: i == selectedIndex
                        ? AppColors.caramel
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    options[i],
                    style: i == selectedIndex
                        ? AppTypography.pillSelected
                        : AppTypography.pillUnselected,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
