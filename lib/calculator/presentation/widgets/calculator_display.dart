import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/k_sizes.dart';
 
import 'package:calculator_online/calculator/application/providers/calculation_providers.dart';

class CalculatorDisplay extends ConsumerWidget {
  const CalculatorDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiState = ref.watch(calculatorUiNotifierProvider);
    final displayValue = uiState.displayValue;
    final secondaryValue = uiState.secondaryDisplayValue;

    return Container(
      height: KSize.calculatorDisplayHeight,
      width: double.infinity,
      color: KColors.displayBackground,
      padding: const EdgeInsets.symmetric(
        horizontal: KSize.margin6x,
        vertical: KSize.margin4x,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Secondary display (for formula/history)
          if (secondaryValue.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: KSize.margin2x),
              child: Text(
                secondaryValue,
                style: const TextStyle(
                  color: KColors.displayTextSecondary,
                  fontSize: KSize.fontLarge,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          // Main display
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerRight,
                child: Text(
                  displayValue,
                  style: const TextStyle(
                    color: KColors.displayText,
                    fontSize: KSize.fontDisplay,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
