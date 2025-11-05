import 'package:flutter/material.dart';
import '../constants/k_sizes.dart';

/// Navigation bar widget for top of pages
class TopNavBar extends StatelessWidget {
  final bool isCalculatorScreen;
  final bool? isGraphingScreen;
  final bool showHistoryButton;
  final VoidCallback? onHistoryTap;

  const TopNavBar({
    super.key,
    required this.isCalculatorScreen,
    this.isGraphingScreen,
    this.showHistoryButton = false,
    this.onHistoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      color: KColors.backgroundMedium,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side - back button and current screen indicator
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: KColors.textPrimary),
                tooltip: 'Back',
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  } else {
                    Navigator.pushReplacementNamed(context, '/');
                  }
                },
              ),
              // Current screen indicator (non-interactive)
              if (isCalculatorScreen)
                const IconButton(
                  icon: Icon(Icons.calculate, color: KColors.textPrimary),
                  tooltip: 'Calculator',
                  onPressed: null,
                ),
              if (!isCalculatorScreen && !(isGraphingScreen ?? false))
                const IconButton(
                  icon: Icon(Icons.swap_horiz, color: KColors.textPrimary),
                  tooltip: 'Converters',
                  onPressed: null,
                ),
              if (isGraphingScreen ?? false)
                const IconButton(
                  icon: Icon(Icons.show_chart, color: KColors.textPrimary),
                  tooltip: 'Graphing',
                  onPressed: null,
                ),
            ],
          ),
          // Right side - navigation buttons and history button
          Row(
            children: [
              // Navigation buttons to other main screens
              if (!isCalculatorScreen) ...[
                // Calculator button
                IconButton(
                  icon: const Icon(Icons.calculate, color: KColors.textPrimary),
                  tooltip: 'Calculator',
                  onPressed: () => Navigator.pushNamed(context, '/'),
                ),
              ],
              if (isCalculatorScreen) ...[
                // Converter button
                IconButton(
                  icon: const Icon(Icons.swap_horiz, color: KColors.textPrimary),
                  tooltip: 'Converters',
                  onPressed: () => Navigator.pushNamed(context, '/converter'),
                ),
                // Graphing button
                IconButton(
                  icon: const Icon(Icons.show_chart, color: KColors.textPrimary),
                  tooltip: 'Graphing',
                  onPressed: () => Navigator.pushNamed(context, '/graphing'),
                ),
              ],
              if (!isCalculatorScreen && !(isGraphingScreen ?? false)) ...[
                // Graphing button (on converter/currency pages)
                IconButton(
                  icon: const Icon(Icons.show_chart, color: KColors.textPrimary),
                  tooltip: 'Graphing',
                  onPressed: () => Navigator.pushNamed(context, '/graphing'),
                ),
              ],
              if (isGraphingScreen ?? false) ...[
                // Converter button (on graphing page)
                IconButton(
                  icon: const Icon(Icons.swap_horiz, color: KColors.textPrimary),
                  tooltip: 'Converters',
                  onPressed: () => Navigator.pushNamed(context, '/converter'),
                ),
              ],
              // History button if applicable
              if (showHistoryButton && onHistoryTap != null)
                IconButton(
                  icon: const Icon(Icons.history, color: KColors.textPrimary),
                  tooltip: 'History',
                  onPressed: onHistoryTap,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

