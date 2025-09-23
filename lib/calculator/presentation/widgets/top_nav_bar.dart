import 'package:flutter/material.dart';
import '../../../core/constants/k_sizes.dart';

class TopNavBar extends StatelessWidget {
  final bool isCalculatorScreen;
  final VoidCallback? onHistoryTap;

  const TopNavBar({
    super.key,
    required this.isCalculatorScreen,
    this.onHistoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: KSize.margin4x),
      decoration: const BoxDecoration(
        color: KColors.backgroundDark,
        border: Border(
          bottom: BorderSide(
            color: KColors.backgroundMedium,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Calculator icon button
          _buildNavButton(
            icon: Icons.calculate_outlined,
            isSelected: isCalculatorScreen,
            onTap: () {
              if (!isCalculatorScreen) {
                Navigator.of(context).pushReplacementNamed('/');
              }
            },
          ),
          const SizedBox(width: 16),
          // Converter icon button  
          _buildNavButton(
            icon: Icons.swap_horiz_outlined,
            isSelected: !isCalculatorScreen,
            onTap: () {
              if (isCalculatorScreen) {
                Navigator.of(context).pushNamed('/converter');
              }
            },
          ),
          const Spacer(),
          // History button (only show on calculator screen)
          if (isCalculatorScreen)
            _buildNavButton(
              icon: Icons.history_outlined,
              isSelected: false,
              onTap: onHistoryTap,
            ),
        ],
      ),
    );
  }

  Widget _buildNavButton({
    required IconData icon,
    required bool isSelected,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isSelected ? KColors.primary.withValues(alpha: 0.2) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: isSelected ? KColors.primary : KColors.textSecondary,
            size: 24,
          ),
        ),
      ),
    );
  }
}
