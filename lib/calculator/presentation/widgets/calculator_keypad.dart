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
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isLandscape = constraints.maxWidth > constraints.maxHeight;
          final availableHeight = constraints.maxHeight;
          
          // In landscape mode, limit the number of rows to prevent overflow
          if (isLandscape && isExpanded) {
            return _buildLandscapeExpandedLayout(ref, isExpanded, availableHeight);
          }
          
          return isExpanded ? _buildExpandedLayout(ref, isExpanded) : _buildCollapsedLayout(ref, isExpanded);
        },
      ),
    );
  }

  Widget _buildCollapsedLayout(WidgetRef ref, bool isExpanded) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate available height and adjust button spacing
        final availableHeight = constraints.maxHeight;
        final buttonHeight = KSize.buttonHeightCalculator;
        final spacing = KSize.buttonSpacing;
        final padding = KSize.margin2x * 2; // top and bottom padding
        
        // Calculate how much space we need for 5 rows
        final requiredHeight = (buttonHeight * 5) + (spacing * 4) + padding;
        final adjustedSpacing = availableHeight > requiredHeight 
            ? spacing 
            : (availableHeight - padding - (buttonHeight * 5)) / 4;
        
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // First row: AC, ⌫, %, ÷
            _buildCollapsedRow([
              _buildCollapsedButton(ref, 'AC', ButtonType.clear, () => ref.read(calculatorUiNotifierProvider.notifier).press('AC')),
              _buildCollapsedButton(ref, '⌫', ButtonType.function, () => ref.read(calculatorUiNotifierProvider.notifier).press('⌫')),
              _buildCollapsedButton(ref, '%', ButtonType.function, () => ref.read(calculatorUiNotifierProvider.notifier).press('%')),
              _buildCollapsedButton(ref, '÷', ButtonType.operator, () => ref.read(calculatorUiNotifierProvider.notifier).press('÷')),
            ], adjustedSpacing),
            // Second row: 7, 8, 9, ×
            _buildCollapsedRow([
              _buildCollapsedButton(ref, '7', ButtonType.number, () => ref.read(calculatorUiNotifierProvider.notifier).press('7')),
              _buildCollapsedButton(ref, '8', ButtonType.number, () => ref.read(calculatorUiNotifierProvider.notifier).press('8')),
              _buildCollapsedButton(ref, '9', ButtonType.number, () => ref.read(calculatorUiNotifierProvider.notifier).press('9')),
              _buildCollapsedButton(ref, '×', ButtonType.operator, () => ref.read(calculatorUiNotifierProvider.notifier).press('×')),
            ], adjustedSpacing),
            // Third row: 4, 5, 6, -
            _buildCollapsedRow([
              _buildCollapsedButton(ref, '4', ButtonType.number, () => ref.read(calculatorUiNotifierProvider.notifier).press('4')),
              _buildCollapsedButton(ref, '5', ButtonType.number, () => ref.read(calculatorUiNotifierProvider.notifier).press('5')),
              _buildCollapsedButton(ref, '6', ButtonType.number, () => ref.read(calculatorUiNotifierProvider.notifier).press('6')),
              _buildCollapsedButton(ref, '-', ButtonType.operator, () => ref.read(calculatorUiNotifierProvider.notifier).press('-')),
            ], adjustedSpacing),
            // Fourth row: 1, 2, 3, +
            _buildCollapsedRow([
              _buildCollapsedButton(ref, '1', ButtonType.number, () => ref.read(calculatorUiNotifierProvider.notifier).press('1')),
              _buildCollapsedButton(ref, '2', ButtonType.number, () => ref.read(calculatorUiNotifierProvider.notifier).press('2')),
              _buildCollapsedButton(ref, '3', ButtonType.number, () => ref.read(calculatorUiNotifierProvider.notifier).press('3')),
              _buildCollapsedButton(ref, '+', ButtonType.operator, () => ref.read(calculatorUiNotifierProvider.notifier).press('+')),
            ], adjustedSpacing),
            // Fifth row: expand/collapse, 0, ., =
            _buildCollapsedRow([
              _buildCollapsedButton(ref, '⛶', ButtonType.function, () => ref.read(isCalculatorExpandedProvider.notifier).state = !isExpanded, isCalculatorExpanded: isExpanded),
              _buildCollapsedButton(ref, '0', ButtonType.number, () => ref.read(calculatorUiNotifierProvider.notifier).press('0')),
              _buildCollapsedButton(ref, '.', ButtonType.number, () => ref.read(calculatorUiNotifierProvider.notifier).press('.')),
              _buildCollapsedButton(ref, '=', ButtonType.equals, () => ref.read(calculatorUiNotifierProvider.notifier).press('=')),
            ], 0), // No spacing after last row
          ],
        );
      },
    );
  }

  Widget _buildExpandedLayout(WidgetRef ref, bool isExpanded) {
    final isSecondFunction = ref.watch(isSecondFunctionProvider);
    final isDegrees = ref.watch(calculatorUiNotifierProvider).isDegreesMode;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
        // Seventh row: expand/collapse, e, 0, ., =
        Row(
          children: [
            Expanded(
              child: CalculatorButton(
                key: const ValueKey('expanded-expand'),
                text: '⛶',
                type: ButtonType.function,
                isExpanded: true,
                isCalculatorExpanded: isExpanded,
                onPressed: () => ref.read(isCalculatorExpandedProvider.notifier).state = !isExpanded,
              ),
            ),
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
      ),
    );
  }

  Widget _buildLandscapeExpandedLayout(WidgetRef ref, bool isExpanded, double availableHeight) {
    final isSecondFunction = ref.watch(isSecondFunctionProvider);
    final isDegrees = ref.watch(calculatorUiNotifierProvider).isDegreesMode;
    
    // Calculate how many rows we can fit
    final buttonHeight = KSize.buttonHeightCalculatorExpanded;
    final spacing = KSize.expandedButtonSpacing;
    final padding = KSize.margin2x * 2; // top and bottom padding
    final maxRows = ((availableHeight - padding) / (buttonHeight + spacing)).floor();
    
    // Limit to essential rows for landscape
    final rows = maxRows.clamp(4, 7); // Show 4-7 rows max
    
    return SingleChildScrollView(
      child: Column(
        children: [
          // First row: 2nd, deg, sin, cos, tan
          if (rows >= 1) _buildExpandedRow([
            _buildExpandedButton(ref, '2nd', isSecondFunction ? ButtonType.operator : ButtonType.function, 
                () => ref.read(isSecondFunctionProvider.notifier).state = !isSecondFunction, isExpanded),
            _buildExpandedButton(ref, isDegrees ? 'deg' : 'rad', ButtonType.function, 
                () => ref.read(calculatorUiNotifierProvider.notifier).toggleDegrees(), isExpanded),
            _buildExpandedButton(ref, isSecondFunction ? 'sin⁻¹' : 'sin', ButtonType.function, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press(isSecondFunction ? 'asin' : 'sin'), isExpanded),
            _buildExpandedButton(ref, isSecondFunction ? 'cos⁻¹' : 'cos', ButtonType.function, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press(isSecondFunction ? 'acos' : 'cos'), isExpanded),
            _buildExpandedButton(ref, isSecondFunction ? 'tan⁻¹' : 'tan', ButtonType.function, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press(isSecondFunction ? 'atan' : 'tan'), isExpanded),
          ]),
          
          // Second row: x^y, lg, ln, (, )
          if (rows >= 2) _buildExpandedRow([
            _buildExpandedButton(ref, 'xʸ', ButtonType.function, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('^'), isExpanded),
            _buildExpandedButton(ref, 'lg', ButtonType.function, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('log'), isExpanded),
            _buildExpandedButton(ref, 'ln', ButtonType.function, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('ln'), isExpanded),
            _buildExpandedButton(ref, '(', ButtonType.function, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('('), isExpanded),
            _buildExpandedButton(ref, ')', ButtonType.function, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press(')'), isExpanded),
          ]),
          
          // Third row: √x, AC, ⌫, %, ÷
          if (rows >= 3) _buildExpandedRow([
            _buildExpandedButton(ref, '√', ButtonType.function, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('√'), isExpanded),
            _buildExpandedButton(ref, 'AC', ButtonType.clear, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('AC'), isExpanded),
            _buildExpandedButton(ref, '⌫', ButtonType.function, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('⌫'), isExpanded),
            _buildExpandedButton(ref, '%', ButtonType.function, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('%'), isExpanded),
            _buildExpandedButton(ref, '÷', ButtonType.operator, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('÷'), isExpanded),
          ]),
          
          // Fourth row: x!, 7, 8, 9, ×
          if (rows >= 4) _buildExpandedRow([
            _buildExpandedButton(ref, 'x!', ButtonType.function, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('!'), isExpanded),
            _buildExpandedButton(ref, '7', ButtonType.number, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('7'), isExpanded),
            _buildExpandedButton(ref, '8', ButtonType.number, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('8'), isExpanded),
            _buildExpandedButton(ref, '9', ButtonType.number, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('9'), isExpanded),
            _buildExpandedButton(ref, '×', ButtonType.operator, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('×'), isExpanded),
          ]),
          
          // Fifth row: 1/x, 4, 5, 6, -
          if (rows >= 5) _buildExpandedRow([
            _buildExpandedButton(ref, '1/x', ButtonType.function, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('1/x'), isExpanded),
            _buildExpandedButton(ref, '4', ButtonType.number, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('4'), isExpanded),
            _buildExpandedButton(ref, '5', ButtonType.number, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('5'), isExpanded),
            _buildExpandedButton(ref, '6', ButtonType.number, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('6'), isExpanded),
            _buildExpandedButton(ref, '-', ButtonType.operator, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('-'), isExpanded),
          ]),
          
          // Sixth row: π, 1, 2, 3, +
          if (rows >= 6) _buildExpandedRow([
            _buildExpandedButton(ref, 'π', ButtonType.function, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('π'), isExpanded),
            _buildExpandedButton(ref, '1', ButtonType.number, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('1'), isExpanded),
            _buildExpandedButton(ref, '2', ButtonType.number, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('2'), isExpanded),
            _buildExpandedButton(ref, '3', ButtonType.number, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('3'), isExpanded),
            _buildExpandedButton(ref, '+', ButtonType.operator, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('+'), isExpanded),
          ]),
          
          // Seventh row: expand/collapse, e, 0, ., =
          if (rows >= 7) _buildExpandedRow([
            _buildExpandedButton(ref, '⛶', ButtonType.function, 
                () => ref.read(isCalculatorExpandedProvider.notifier).state = !isExpanded, isExpanded, isCalculatorExpanded: isExpanded),
            _buildExpandedButton(ref, 'e', ButtonType.function, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('e'), isExpanded),
            _buildExpandedButton(ref, '0', ButtonType.number, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('0'), isExpanded),
            _buildExpandedButton(ref, '.', ButtonType.number, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('.'), isExpanded),
            _buildExpandedButton(ref, '=', ButtonType.equals, 
                () => ref.read(calculatorUiNotifierProvider.notifier).press('='), isExpanded),
          ]),
        ],
      ),
    );
  }

  Widget _buildExpandedRow(List<Widget> children, [double? spacing]) {
    return Padding(
      padding: EdgeInsets.only(bottom: spacing ?? KSize.expandedButtonSpacing),
      child: Row(
        children: children.map((child) => Expanded(child: child)).toList(),
      ),
    );
  }

  Widget _buildExpandedButton(WidgetRef ref, String text, ButtonType type, VoidCallback onPressed, bool isExpanded, {bool? isCalculatorExpanded}) {
    return CalculatorButton(
      key: ValueKey('landscape-$text'),
      text: text,
      type: type,
      isExpanded: isExpanded,
      isCalculatorExpanded: isCalculatorExpanded,
      onPressed: onPressed,
    );
  }

  Widget _buildCollapsedRow(List<Widget> children, double spacing) {
    return Padding(
      padding: EdgeInsets.only(bottom: spacing),
      child: Row(
        children: children.map((child) => Expanded(child: child)).toList(),
      ),
    );
  }

  Widget _buildCollapsedButton(WidgetRef ref, String text, ButtonType type, VoidCallback onPressed, {bool? isCalculatorExpanded}) {
    return CalculatorButton(
      key: ValueKey('collapsed-$text'),
      text: text,
      type: type,
      isCalculatorExpanded: isCalculatorExpanded,
      onPressed: onPressed,
    );
  }

  
}
