import 'package:flutter/material.dart';
import 'package:calculator_online/core/constants/k_sizes.dart';
import 'package:calculator_online/currency_conversion/domain/entities/conversion_result_model.dart';

/// Widget for displaying conversion results
class ConversionResultWidget extends StatelessWidget {
  final ConversionResultModel? result;
  final bool isLoading;
  final bool hasError;
  final VoidCallback? onRetry;

  const ConversionResultWidget({
    super.key,
    this.result,
    this.isLoading = false,
    this.hasError = false,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _buildLoadingState();
    }

    if (hasError) {
      return _buildErrorState();
    }

    if (result == null) {
      return _buildEmptyState();
    }

    return _buildResultState();
  }

  Widget _buildLoadingState() {
    return Container(
      padding: const EdgeInsets.all(KSize.margin6x),
      decoration: BoxDecoration(
        color: KColors.backgroundMedium,
        borderRadius: BorderRadius.circular(KSize.radiusDefault),
        border: Border.all(
          color: KColors.backgroundLight,
          width: 1,
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(KColors.buttonOperator),
          ),
          SizedBox(height: KSize.margin4x),
          Text(
            'Converting...',
            style: TextStyle(
              color: KColors.textSecondary,
              fontSize: KSize.fontDefault,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState() {
    return Container(
      padding: const EdgeInsets.all(KSize.margin6x),
      decoration: BoxDecoration(
        color: KColors.backgroundMedium,
        borderRadius: BorderRadius.circular(KSize.radiusDefault),
        border: Border.all(
          color: Colors.red.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.red,
            size: KSize.iconLarge,
          ),
          const SizedBox(height: KSize.margin4x),
          const Text(
            'Conversion Failed',
            style: TextStyle(
              color: KColors.textPrimary,
              fontSize: KSize.fontLarge,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: KSize.margin2x),
          const Text(
            'Unable to convert currency. Please check your connection and try again.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: KColors.textSecondary,
              fontSize: KSize.fontDefault,
            ),
          ),
          if (onRetry != null) ...[
            const SizedBox(height: KSize.margin4x),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: KColors.buttonOperator,
                foregroundColor: KColors.textPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(KSize.radiusSmall),
                ),
              ),
              child: const Text('Retry'),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.all(KSize.margin6x),
      decoration: BoxDecoration(
        color: KColors.backgroundMedium,
        borderRadius: BorderRadius.circular(KSize.radiusDefault),
        border: Border.all(
          color: KColors.backgroundLight,
          width: 1,
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.currency_exchange,
            color: KColors.textSecondary,
            size: KSize.iconLarge,
          ),
          SizedBox(height: KSize.margin4x),
          Text(
            'Enter an amount to convert',
            style: TextStyle(
              color: KColors.textSecondary,
              fontSize: KSize.fontDefault,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultState() {
    final result = this.result!;
    final fromSymbol = _getCurrencySymbol(result.fromCurrencyCode.value);
    final toSymbol = _getCurrencySymbol(result.toCurrencyCode.value);
    final amountIn = result.amountInAsDouble;
    final amountOut = result.amountOutAsDouble;
    final rate = result.rateAsDouble;

    return Container(
      padding: const EdgeInsets.all(KSize.margin6x),
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
          // Header
          const Text(
            'Conversion Result',
            style: TextStyle(
              color: KColors.textPrimary,
              fontSize: KSize.fontLarge,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: KSize.margin4x),
          
          // Amount in
          _buildAmountRow(
            label: 'Amount',
            amount: amountIn,
            symbol: fromSymbol,
            currency: result.fromCurrencyCode.value,
          ),
          
          const SizedBox(height: KSize.margin2x),
          
          // Arrow
          const Center(
            child: Icon(
              Icons.arrow_downward,
              color: KColors.buttonOperator,
              size: KSize.iconMedium,
            ),
          ),
          
          const SizedBox(height: KSize.margin2x),
          
          // Amount out
          _buildAmountRow(
            label: 'Converted to',
            amount: amountOut,
            symbol: toSymbol,
            currency: result.toCurrencyCode.value,
            isHighlighted: true,
          ),
          
          const SizedBox(height: KSize.margin4x),
          
          // Rate info
          Container(
            padding: const EdgeInsets.all(KSize.margin3x),
            decoration: BoxDecoration(
              color: KColors.backgroundDark,
              borderRadius: BorderRadius.circular(KSize.radiusSmall),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Exchange Rate:',
                  style: TextStyle(
                    color: KColors.textSecondary,
                    fontSize: KSize.fontSmall,
                  ),
                ),
                Text(
                  '1 $fromSymbol = ${rate.toStringAsFixed(6)} $toSymbol',
                  style: const TextStyle(
                    color: KColors.textPrimary,
                    fontSize: KSize.fontSmall,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: KSize.margin2x),
          
          // Timestamp
          Text(
            'Updated: ${_formatTimestamp(result.timestamp)}',
            style: const TextStyle(
              color: KColors.textSecondary,
              fontSize: KSize.fontSmall,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmountRow({
    required String label,
    required double amount,
    required String symbol,
    required String currency,
    bool isHighlighted = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(KSize.margin3x),
      decoration: BoxDecoration(
        color: isHighlighted ? KColors.backgroundDark : Colors.transparent,
        borderRadius: BorderRadius.circular(KSize.radiusSmall),
            border: isHighlighted
                ? Border.all(
                    color: KColors.buttonOperator.withOpacity(0.3),
                    width: 1,
                  )
                : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: KColors.textSecondary,
              fontSize: KSize.fontDefault,
            ),
          ),
          Row(
            children: [
              Text(
                symbol,
                style: TextStyle(
                  color: isHighlighted ? KColors.buttonOperator : KColors.textPrimary,
                  fontSize: KSize.fontLarge,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: KSize.margin1x),
              Text(
                _formatAmount(amount),
                style: TextStyle(
                  color: isHighlighted ? KColors.buttonOperator : KColors.textPrimary,
                  fontSize: KSize.fontXLarge,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: KSize.margin1x),
              Text(
                currency,
                style: TextStyle(
                  color: isHighlighted ? KColors.buttonOperator : KColors.textSecondary,
                  fontSize: KSize.fontDefault,
                  fontWeight: FontWeight.w500,
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

  String _formatAmount(double amount) {
    // Always show the full precise amount without abbreviations
    if (amount >= 1) {
      // For amounts >= 1, show up to 2 decimal places
      return amount.toStringAsFixed(2);
    } else {
      // For amounts < 1, show up to 6 decimal places for precision
      return amount.toStringAsFixed(6);
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);
    
    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }
}
