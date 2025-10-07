import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:calculator_online/core/constants/k_sizes.dart';

/// Widget for inputting the amount to convert
class AmountInputWidget extends StatefulWidget {
  final String amount;
  final ValueChanged<String> onAmountChanged;
  final String fromCurrency;

  const AmountInputWidget({
    super.key,
    required this.amount,
    required this.onAmountChanged,
    required this.fromCurrency,
  });

  @override
  State<AmountInputWidget> createState() => _AmountInputWidgetState();
}

class _AmountInputWidgetState extends State<AmountInputWidget> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.amount);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AmountInputWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.amount != oldWidget.amount && _controller.text != widget.amount) {
      _controller.text = widget.amount;
    }
  }

  void _onAmountChanged(String value) {
    // Remove any non-numeric characters except decimal point
    final cleaned = value.replaceAll(RegExp(r'[^0-9.]'), '');
    
    // Ensure only one decimal point
    final parts = cleaned.split('.');
    final sanitized = parts.length > 2 
        ? '${parts[0]}.${parts.sublist(1).join('')}'
        : cleaned;
    
    // Limit decimal places to 6
    if (sanitized.contains('.')) {
      final decimalParts = sanitized.split('.');
      if (decimalParts.length == 2 && decimalParts[1].length > 6) {
        final limited = '${decimalParts[0]}.${decimalParts[1].substring(0, 6)}';
        _controller.text = limited;
        _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: limited.length),
        );
        widget.onAmountChanged(limited);
        return;
      }
    }
    
    widget.onAmountChanged(sanitized);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KSize.margin4x,
        vertical: KSize.margin2x,
      ),
      decoration: BoxDecoration(
        color: KColors.backgroundMedium,
        borderRadius: BorderRadius.circular(KSize.radiusDefault),
        border: Border.all(
          color: KColors.backgroundLight,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Amount',
            style: TextStyle(
              color: KColors.textSecondary,
              fontSize: KSize.fontSmall,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: KSize.margin1x),
          Row(
            children: [
              // Currency symbol
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: KSize.margin2x,
                  vertical: KSize.margin1x,
                ),
                decoration: BoxDecoration(
                  color: KColors.backgroundLight,
                  borderRadius: BorderRadius.circular(KSize.radiusSmall),
                ),
                child: Text(
                  _getCurrencySymbol(widget.fromCurrency),
                  style: const TextStyle(
                    color: KColors.textPrimary,
                    fontSize: KSize.fontDefault,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: KSize.margin2x),
              // Amount input field
              Expanded(
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                  ],
                  style: const TextStyle(
                    color: KColors.textPrimary,
                    fontSize: KSize.fontXLarge,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: const InputDecoration(
                    hintText: '0.00',
                    hintStyle: TextStyle(
                      color: KColors.textSecondary,
                      fontSize: KSize.fontXLarge,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                  ),
                  onChanged: _onAmountChanged,
                  onSubmitted: (_) {
                    _focusNode.unfocus();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getCurrencySymbol(String currency) {
    // Common currency symbols
    const symbols = {
      'USD': '\$',
      'EUR': '€',
      'GBP': '£',
      'JPY': '¥',
      'CAD': 'C\$',
      'AUD': 'A\$',
      'CHF': 'CHF',
      'CNY': '¥',
      'INR': '₹',
      'BRL': 'R\$',
      'RUB': '₽',
      'KRW': '₩',
      'MXN': 'Mex\$',
      'SGD': 'S\$',
      'HKD': 'HK\$',
      'NZD': 'NZ\$',
      'NOK': 'kr',
      'SEK': 'kr',
      'DKK': 'kr',
      'PLN': 'zł',
      'CZK': 'Kč',
      'HUF': 'Ft',
      'ILS': '₪',
      'TRY': '₺',
      'ZAR': 'R',
      'THB': '฿',
    };
    
    return symbols[currency] ?? currency;
  }
}
