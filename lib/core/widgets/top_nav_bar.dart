import 'package:flutter/material.dart';
import '../constants/k_sizes.dart';

/// Common top navigation bar used across multiple screens.
/// - Highlights the active destination
/// - Navigates using named routes: '/', '/converter', '/graphing'
/// - Optionally shows a History button on the calculator screen
class TopNavBar extends StatelessWidget {
  final bool isCalculatorScreen;
  final bool isGraphingScreen;
  final bool showHistoryButton;
  final VoidCallback? onHistoryTap;

  const TopNavBar({
    super.key,
    required this.isCalculatorScreen,
    this.isGraphingScreen = false,
    this.showHistoryButton = false,
    this.onHistoryTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isConverterScreen = !isCalculatorScreen && !isGraphingScreen;

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
          // Calculator
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
          // Converter
          _buildNavButton(
            icon: Icons.swap_horiz_outlined,
            isSelected: isConverterScreen,
            onTap: () {
              if (!isConverterScreen) {
                Navigator.of(context).pushNamed('/converter');
              }
            },
          ),
          const SizedBox(width: 16),
          // Graphing
          _buildNavButton(
            icon: Icons.show_chart_outlined,
            isSelected: isGraphingScreen,
            onTap: () {
              if (!isGraphingScreen) {
                Navigator.of(context).pushReplacementNamed('/graphing');
              }
            },
          ),
          const Spacer(),
          // History (calculator screen only)
          if (showHistoryButton && isCalculatorScreen)
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


