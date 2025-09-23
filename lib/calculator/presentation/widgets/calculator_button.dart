import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/k_sizes.dart';

enum ButtonType { number, operator, function, clear, equals }

class CalculatorButton extends ConsumerWidget {
  final String text;
  final ButtonType type;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final bool isExpanded;
  final String? superscript;
  final String? subscript;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.type,
    required this.onPressed,
    this.width,
    this.height,
    this.isExpanded = false,
    this.superscript,
    this.subscript,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.all(
        isExpanded ? KSize.expandedButtonSpacing / 2 : KSize.buttonSpacing / 2,
      ),
      child: SizedBox(
        width: width,
        height: height ??
            (isExpanded
                ? KSize.buttonHeightCalculatorExpanded
                : KSize.buttonHeightCalculator),
        child: Material(
          color: _getButtonColor(),
          borderRadius: BorderRadius.circular(
            type == ButtonType.equals ? KSize.radiusCircular : KSize.radiusDefault,
          ),
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(
              type == ButtonType.equals ? KSize.radiusCircular : KSize.radiusDefault,
            ),
            child: Center(
              child: _buildButtonContent(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonContent() {
    if (superscript != null || subscript != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: _getTextColor(),
              fontSize: isExpanded ? KSize.fontDefault : KSize.fontXLarge,
              fontWeight: type == ButtonType.operator || type == ButtonType.equals
                  ? FontWeight.w500
                  : FontWeight.w400,
            ),
          ),
          if (superscript != null)
            Padding(
              padding: const EdgeInsets.only(bottom: KSize.superscriptPaddingBottom),
              child: Text(
                superscript!,
                style: TextStyle(
                  color: _getTextColor(),
                  fontSize: KSize.fontSmall,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          if (subscript != null)
            Padding(
              padding: const EdgeInsets.only(top: KSize.subscriptPaddingTop),
              child: Text(
                subscript!,
                style: TextStyle(
                  color: _getTextColor(),
                  fontSize: KSize.fontSmall,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
        ],
      );
    }

    // Special handling for specific symbols
    if (text == '⌫') {
      return Icon(
        Icons.backspace_outlined,
        color: _getTextColor(),
        size: KSize.iconMedium,
      );
    }

    return Text(
      text,
      style: TextStyle(
        color: _getTextColor(),
        fontSize: _getFontSize(),
        fontWeight: type == ButtonType.operator || type == ButtonType.equals
            ? FontWeight.w500
            : FontWeight.w400,
      ),
    );
  }

  double _getFontSize() {
    if (isExpanded) {
      if (text.length > 2) {
        return KSize.fontMedium;
      }
      return KSize.fontDefault;
    }
    if (type == ButtonType.number) {
      return KSize.fontXLarge;
    }
    if (type == ButtonType.operator || type == ButtonType.equals) {
      return KSize.fontXLarge;
    }
    return KSize.fontLarge;
  }

  Color _getButtonColor() {
    switch (type) {
      case ButtonType.number:
        return KColors.buttonNumber;
      case ButtonType.operator:
      case ButtonType.equals:
        return KColors.buttonOperator;
      case ButtonType.function:
      case ButtonType.clear:
        return KColors.buttonFunction;
    }
  }

  Color _getTextColor() {
    switch (type) {
      case ButtonType.number:
      case ButtonType.function:
      case ButtonType.clear:
        return KColors.textPrimary;
      case ButtonType.operator:
      case ButtonType.equals:
        return KColors.textPrimary;
    }
  }
}
