import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/k_sizes.dart';
import '../controllers/calculator_ui_provider.dart';
import 'package:calculator_online/calculator/application/providers/calculation_providers.dart';
import 'calculator_button.dart';

class CalculatorKeypad extends ConsumerWidget {
  const CalculatorKeypad({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = ref.watch(isCalculatorExpandedProvider);

    return Container(
      color: KColors.backgroundDark,
      padding: const EdgeInsets.all(KSize.margin2x),
      child: isExpanded ? _buildExpandedLayout(ref, isExpanded) : _buildCollapsedLayout(ref, isExpanded),
    );
  }

  Widget _buildCollapsedLayout(WidgetRef ref, bool isExpanded) {
    return Column(
      children: [
        // First row: AC, ⌫, %, ÷
        Row(
          children: [
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('collapsed-AC'),
                text: 'AC',
                type: ButtonType.clear,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('AC'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('collapsed-⌫'),
                text: '⌫',
                type: ButtonType.function,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('⌫'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('collapsed-%'),
                text: '%',
                type: ButtonType.function,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('%'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('collapsed-÷'),
                text: '÷',
                type: ButtonType.operator,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('÷'),
              ),
            ),
          ],
        ),
        // Second row: 7, 8, 9, ×
        Row(
          children: [
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('collapsed-7'),
                text: '7',
                type: ButtonType.number,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('7'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('collapsed-8'),
                text: '8',
                type: ButtonType.number,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('8'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('collapsed-9'),
                text: '9',
                type: ButtonType.number,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('9'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('collapsed-×'),
                text: '×',
                type: ButtonType.operator,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('×'),
              ),
            ),
          ],
        ),
        // Third row: 4, 5, 6, -
        Row(
          children: [
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('collapsed-4'),
                text: '4',
                type: ButtonType.number,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('4'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('collapsed-5'),
                text: '5',
                type: ButtonType.number,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('5'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('collapsed-6'),
                text: '6',
                type: ButtonType.number,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('6'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('collapsed--'),
                text: '-',
                type: ButtonType.operator,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('-'),
              ),
            ),
          ],
        ),
        // Fourth row: 1, 2, 3, +
        Row(
          children: [
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('collapsed-1'),
                text: '1',
                type: ButtonType.number,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('1'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('collapsed-2'),
                text: '2',
                type: ButtonType.number,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('2'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('collapsed-3'),
                text: '3',
                type: ButtonType.number,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('3'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('collapsed-+'),
                text: '+',
                type: ButtonType.operator,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('+'),
              ),
            ),
          ],
        ),
        // Fifth row: expand/collapse, 0, ., =
        Row(
          children: [
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('collapsed-⇆'),
                text: '⇆',
                type: ButtonType.function,
                onPressed: () => ref.read(isCalculatorExpandedProvider.notifier).state = !isExpanded,
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('collapsed-0'),
                text: '0',
                type: ButtonType.number,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('0'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('collapsed-.'),
                text: '.',
                type: ButtonType.number,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('.'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('collapsed-='),
                text: '=',
                type: ButtonType.equals,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('='),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildExpandedLayout(WidgetRef ref, bool isExpanded) {
    final isSecondFunction = ref.watch(isSecondFunctionProvider);
    final isDegrees = ref.watch(calculatorUiNotifierProvider).isDegreesMode;

    return Column(
      children: [
        // First row: 2nd, deg, sin, cos, tan
        Row(
          children: [
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-2nd'),
                text: '2nd',
                type: isSecondFunction ? ButtonType.operator : ButtonType.function,
                isExpanded: true,
                onPressed: () {
                  ref.read(isSecondFunctionProvider.notifier).state = !isSecondFunction;
                },
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: ValueKey('expanded-mode-${isDegrees ? 'deg' : 'rad'}'),
                text: isDegrees ? 'deg' : 'rad',
                type: ButtonType.function,
                isExpanded: true,
                onPressed: () {
                  ref.read(calculatorUiNotifierProvider.notifier).toggleDegrees();
                },
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: ValueKey('expanded-${isSecondFunction ? 'sin⁻¹' : 'sin'}'),
                text: isSecondFunction ? 'sin⁻¹' : 'sin',
                type: ButtonType.function,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press(isSecondFunction ? 'asin' : 'sin'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: ValueKey('expanded-${isSecondFunction ? 'cos⁻¹' : 'cos'}'),
                text: isSecondFunction ? 'cos⁻¹' : 'cos',
                type: ButtonType.function,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press(isSecondFunction ? 'acos' : 'cos'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: ValueKey('expanded-${isSecondFunction ? 'tan⁻¹' : 'tan'}'),
                text: isSecondFunction ? 'tan⁻¹' : 'tan',
                type: ButtonType.function,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press(isSecondFunction ? 'atan' : 'tan'),
              ),
            ),
          ],
        ),
        // Second row: x^y, lg, ln, (, )
        Row(
          children: [
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-xʸ'),
                text: 'xʸ',
                type: ButtonType.function,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('^'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-lg'),
                text: 'lg',
                type: ButtonType.function,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('log'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-ln'),
                text: 'ln',
                type: ButtonType.function,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('ln'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-('),
                text: '(',
                type: ButtonType.function,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('('),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-)'),
                text: ')',
                type: ButtonType.function,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press(')'),
              ),
            ),
          ],
        ),
        // Third row: √x, AC, ⌫, %, ÷
        Row(
          children: [
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-√'),
                text: '√',
                type: ButtonType.function,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('√'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-AC'),
                text: 'AC',
                type: ButtonType.clear,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('AC'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-⌫'),
                text: '⌫',
                type: ButtonType.function,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('⌫'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-%'),
                text: '%',
                type: ButtonType.function,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('%'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-÷'),
                text: '÷',
                type: ButtonType.operator,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('÷'),
              ),
            ),
          ],
        ),
        // Fourth row: x!, 7, 8, 9, ×
        Row(
          children: [
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-x!'),
                text: 'x!',
                type: ButtonType.function,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('!'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-7'),
                text: '7',
                type: ButtonType.number,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('7'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-8'),
                text: '8',
                type: ButtonType.number,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('8'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-9'),
                text: '9',
                type: ButtonType.number,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('9'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-×'),
                text: '×',
                type: ButtonType.operator,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('×'),
              ),
            ),
          ],
        ),
        // Fifth row: 1/x, 4, 5, 6, -
        Row(
          children: [
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-1/x'),
                text: '1/x',
                type: ButtonType.function,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('1/x'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-4'),
                text: '4',
                type: ButtonType.number,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('4'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-5'),
                text: '5',
                type: ButtonType.number,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('5'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-6'),
                text: '6',
                type: ButtonType.number,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('6'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded--'),
                text: '-',
                type: ButtonType.operator,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('-'),
              ),
            ),
          ],
        ),
        // Sixth row: π, 1, 2, 3, +
        Row(
          children: [
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-π'),
                text: 'π',
                type: ButtonType.function,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('π'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-1'),
                text: '1',
                type: ButtonType.number,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('1'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-2'),
                text: '2',
                type: ButtonType.number,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('2'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-3'),
                text: '3',
                type: ButtonType.number,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('3'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-+'),
                text: '+',
                type: ButtonType.operator,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('+'),
              ),
            ),
          ],
        ),
        // Seventh row: e, expand/collapse, 0, ., =
        Row(
          children: [
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-e'),
                text: 'e',
                type: ButtonType.function,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('e'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-⇆'),
                text: '⇆',
                type: ButtonType.function,
                isExpanded: true,
                onPressed: () => ref.read(isCalculatorExpandedProvider.notifier).state = !isExpanded,
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-0'),
                text: '0',
                type: ButtonType.number,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('0'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-.'),
                text: '.',
                type: ButtonType.number,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('.'),
              ),
            ),
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-='),
                text: '=',
                type: ButtonType.equals,
                isExpanded: true,
                onPressed: () => ref.read(calculatorUiNotifierProvider.notifier).press('='),
              ),
            ),
          ],
        ),
      ],
    );
  }

  
}
