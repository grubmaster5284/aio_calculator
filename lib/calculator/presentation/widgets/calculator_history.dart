import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/k_sizes.dart';
import 'package:calculator_online/calculator/application/providers/calculation_providers.dart';
import 'package:calculator_online/calculator/application/state/calculator_ui_state.dart';
import '../controllers/calculator_ui_provider.dart';

class CalculatorHistory extends ConsumerWidget {
  const CalculatorHistory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(calculatorUiNotifierProvider).history;
    final isHistoryOnly = ref.watch(isHistoryOnlyModeProvider);

    if (history.isEmpty) {
      return Container(
        color: KColors.backgroundDark,
        alignment: Alignment.center,
        child: const Text(
          'No history yet',
          style: TextStyle(
            color: KColors.textSecondary,
            fontSize: KSize.fontMedium,
          ),
        ),
      );
    }

    // For preview mode, show the last 3 items (most recent)
    // For full history mode, show all items
    final items = isHistoryOnly 
        ? history 
        : history.length <= 3 
            ? history 
            : history.skip(history.length - 3).toList();

    if (!isHistoryOnly) {
      // Preview mode with clear recent button
      return Container(
        color: KColors.backgroundDark,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: KSize.margin4x,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent',
                    style: TextStyle(
                      color: KColors.textSecondary,
                      fontSize: KSize.fontDefault,
                    ),
                  ),
                  TextButton(
                    onPressed: items.isEmpty
                        ? null
                        : () {
                            final current = ref.read(calculatorUiNotifierProvider).history;
                            final removeCount = current.length >= 3 ? 3 : current.length;
                            ref.read(calculatorUiNotifierProvider.notifier).clearRecent(count: removeCount);
                            // Also perform AC to reset calculator state
                            ref.read(calculatorUiNotifierProvider.notifier).press('AC');
                          },
                    child: Text(
                      'Clear',
                      style: TextStyle(
                        color: items.isEmpty ? KColors.textSecondary : KColors.textPrimary,
                        fontSize: KSize.fontDefault,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: ListView.builder(
                reverse: true,
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: KSize.margin4x,
                  vertical: KSize.margin2x,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  // Show items in natural order: most recent at bottom
                  final item = items[index];
                  return _buildHistoryItem(ref, item);
                },
              ),
            ),
          ],
        ),
      );
    }

    // Full history mode
    return Container(
      color: KColors.backgroundDark,
      child: ListView.builder(
        reverse: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: KSize.margin4x,
          vertical: KSize.margin2x,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          // Show items in natural order: most recent at bottom
          final item = items[index];
          return _buildHistoryItem(ref, item);
        },
      ),
    );
  }

  Widget _buildHistoryItem(WidgetRef ref, HistoryItem item) {
    return GestureDetector(
      onTap: () {
        ref.read(calculatorUiNotifierProvider.notifier).setDisplay(item.result);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: KSize.margin2x),
        padding: const EdgeInsets.all(KSize.margin3x),
        decoration: BoxDecoration(
          color: KColors.backgroundMedium,
          borderRadius: BorderRadius.circular(KSize.radiusDefault),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              item.expression,
              style: const TextStyle(
                color: KColors.textSecondary,
                fontSize: KSize.fontDefault,
              ),
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const SizedBox(height: KSize.margin1x),
            Text(
              '= ${item.result}',
              style: const TextStyle(
                color: KColors.textPrimary,
                fontSize: KSize.fontLarge,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
