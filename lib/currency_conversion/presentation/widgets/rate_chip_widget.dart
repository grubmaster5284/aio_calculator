import 'package:flutter/material.dart';
import 'package:calculator_online/core/constants/k_sizes.dart';
import 'package:calculator_online/currency_conversion/domain/entities/rate_model.dart';

/// Widget for displaying current exchange rate
class RateChipWidget extends StatelessWidget {
  final RateModel rate;
  final String fromCurrency;
  final String toCurrency;

  const RateChipWidget({
    super.key,
    required this.rate,
    required this.fromCurrency,
    required this.toCurrency,
  });

  @override
  Widget build(BuildContext context) {
    final rateValue = rate.rateAsDouble;
    final fromSymbol = _getCurrencySymbol(fromCurrency);
    final toSymbol = _getCurrencySymbol(toCurrency);
    final timestamp = rate.timestamp;

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Rate info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Exchange Rate',
                  style: TextStyle(
                    color: KColors.textSecondary,
                    fontSize: KSize.fontSmall,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: KSize.margin1x),
                Text(
                  '1 $fromSymbol = ${_formatRate(rateValue)} $toSymbol',
                  style: const TextStyle(
                    color: KColors.textPrimary,
                    fontSize: KSize.fontDefault,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          
          // Timestamp
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(
                Icons.schedule,
                color: KColors.textSecondary,
                size: KSize.iconSmall,
              ),
              const SizedBox(height: KSize.margin1x),
              Text(
                _formatTimestamp(timestamp),
                style: const TextStyle(
                  color: KColors.textSecondary,
                  fontSize: KSize.fontSmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getCurrencySymbol(String currency) {
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

  String _formatRate(double rate) {
    if (rate >= 1) {
      return rate.toStringAsFixed(4);
    } else if (rate >= 0.01) {
      return rate.toStringAsFixed(6);
    } else {
      return rate.toStringAsFixed(8);
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);
    
    if (difference.inMinutes < 1) {
      return 'Now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h';
    } else {
      return '${difference.inDays}d';
    }
  }
}
