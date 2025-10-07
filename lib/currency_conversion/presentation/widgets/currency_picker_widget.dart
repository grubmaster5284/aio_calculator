import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calculator_online/core/constants/k_sizes.dart';
import 'package:calculator_online/currency_conversion/application/providers/currency_providers.dart';
import 'package:calculator_online/currency_conversion/domain/entities/currency_model.dart';

/// Widget for selecting from and to currencies
class CurrencyPickerWidget extends ConsumerWidget {
  final String fromCurrency;
  final String toCurrency;
  final ValueChanged<String> onFromCurrencyChanged;
  final ValueChanged<String> onToCurrencyChanged;
  final VoidCallback onSwapCurrencies;
  final bool isSwapping;

  const CurrencyPickerWidget({
    super.key,
    required this.fromCurrency,
    required this.toCurrency,
    required this.onFromCurrencyChanged,
    required this.onToCurrencyChanged,
    required this.onSwapCurrencies,
    this.isSwapping = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supportedCurrencies = ref.watch(supportedCurrenciesProvider);
    final isLoading = ref.watch(isLoadingProvider);

    return Column(
      children: [
        // From currency picker
        _CurrencyDropdown(
          label: 'From',
          value: fromCurrency,
          currencies: supportedCurrencies,
          onChanged: onFromCurrencyChanged,
          isLoading: isLoading,
        ),
        
        const SizedBox(height: KSize.margin2x),
        
        // To currency picker
        _CurrencyDropdown(
          label: 'To',
          value: toCurrency,
          currencies: supportedCurrencies,
          onChanged: onToCurrencyChanged,
          isLoading: isLoading,
        ),
      ],
    );
  }
}

/// Individual currency dropdown
class _CurrencyDropdown extends StatelessWidget {
  final String label;
  final String value;
  final List<CurrencyModel> currencies;
  final ValueChanged<String> onChanged;
  final bool isLoading;

  const _CurrencyDropdown({
    required this.label,
    required this.value,
    required this.currencies,
    required this.onChanged,
    this.isLoading = false,
  });

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
          Text(
            label,
            style: const TextStyle(
              color: KColors.textSecondary,
              fontSize: KSize.fontSmall,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: KSize.margin1x),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: currencies.any((c) => c.code.value == value) ? value : null,
              isExpanded: true,
              style: const TextStyle(
                color: KColors.textPrimary,
                fontSize: KSize.fontDefault,
                fontWeight: FontWeight.w500,
              ),
              dropdownColor: KColors.backgroundMedium,
              hint: const Text(
                'Select',
                style: TextStyle(
                  color: KColors.textSecondary,
                ),
              ),
              icon: isLoading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(KColors.textSecondary),
                      ),
                    )
                  : const Icon(
                      Icons.keyboard_arrow_down,
                      color: KColors.textSecondary,
                    ),
              items: currencies.where((currency) => 
                currency.code.value.isNotEmpty && currency.code.value.length >= 3
              ).map((currency) {
                return DropdownMenuItem<String>(
                  value: currency.code.value,
                  child: Row(
                    children: [
                      // Currency flag or symbol (placeholder)
                      Container(
                        width: 24,
                        height: 16,
                        decoration: BoxDecoration(
                          color: KColors.backgroundLight,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Center(
                          child: Text(
                            currency.symbol.isNotEmpty 
                                ? currency.symbol 
                                : (currency.code.value.isNotEmpty
                                    ? currency.code.value.substring(0, 1) 
                                    : '?'),
                            style: const TextStyle(
                              color: KColors.textPrimary,
                              fontSize: KSize.fontSmall,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: KSize.margin2x),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              currency.code.value,
                              style: const TextStyle(
                                color: KColors.textPrimary,
                                fontSize: KSize.fontDefault,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            if (currency.name.isNotEmpty)
                              Text(
                                currency.name,
                                style: const TextStyle(
                                  color: KColors.textSecondary,
                                  fontSize: KSize.fontSmall,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: isLoading ? null : (String? newValue) {
                if (newValue != null) {
                  onChanged(newValue);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
