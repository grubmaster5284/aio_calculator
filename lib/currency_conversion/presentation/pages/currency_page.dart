import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calculator_online/core/constants/k_sizes.dart';
import 'package:calculator_online/currency_conversion/application/providers/currency_providers.dart';
import 'package:calculator_online/currency_conversion/presentation/widgets/currency_picker_widget.dart';
import 'package:calculator_online/currency_conversion/presentation/widgets/amount_input_widget.dart';
import 'package:calculator_online/currency_conversion/presentation/widgets/conversion_result_widget.dart';
import 'package:calculator_online/currency_conversion/presentation/widgets/rate_chip_widget.dart';
import 'package:calculator_online/currency_conversion/presentation/widgets/swap_button_widget.dart';

/// Main page for currency conversion
class CurrencyPage extends ConsumerStatefulWidget {
  const CurrencyPage({super.key});

  @override
  ConsumerState<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends ConsumerState<CurrencyPage> {
  bool _hasInitialized = false;

  @override
  void initState() {
    super.initState();
    // Initialize cache and load data when page is first opened
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeCurrencyData();
    });
  }

  /// Initialize currency data and cache
  Future<void> _initializeCurrencyData() async {
    if (_hasInitialized) return;
    
    _hasInitialized = true;
    final notifier = ref.read(currencyNotifierProvider.notifier);
    await notifier.loadInitial();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(currencyNotifierProvider);
    final notifier = ref.read(currencyNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
        backgroundColor: KColors.backgroundDark,
        foregroundColor: KColors.textPrimary,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: state.isRefreshing ? null : () => notifier.refresh(),
            tooltip: 'Refresh rates',
          ),
        ],
      ),
      backgroundColor: KColors.backgroundDark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(KSize.margin4x),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Currency selection section
              CurrencyPickerWidget(
                fromCurrency: state.selectedFromCurrency,
                toCurrency: state.selectedToCurrency,
                onFromCurrencyChanged: notifier.setFromCurrency,
                onToCurrencyChanged: notifier.setToCurrency,
                onSwapCurrencies: notifier.swapCurrencies,
                isSwapping: state.isSwapping,
              ),
              
              const SizedBox(height: KSize.margin4x),
              
              // Swap button
              SwapButtonWidget(
                onSwap: notifier.swapCurrencies,
                isSwapping: state.isSwapping,
              ),
              
              const SizedBox(height: KSize.margin4x),
              
              // Amount input section
              AmountInputWidget(
                amount: state.amountInput,
                onAmountChanged: notifier.setAmount,
                fromCurrency: state.selectedFromCurrency,
              ),
              
              const SizedBox(height: KSize.margin4x),
              
              // Convert button
              ElevatedButton(
                onPressed: state.canConvert && !state.isLoading
                    ? () {
                        notifier.convert();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: KColors.buttonOperator,
                  foregroundColor: KColors.textPrimary,
                  minimumSize: const Size(double.infinity, KSize.buttonHeightMedium),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(KSize.radiusDefault),
                  ),
                ),
                child: state.isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(KColors.textPrimary),
                        ),
                      )
                    : const Text(
                        'Convert',
                        style: TextStyle(
                          fontSize: KSize.fontDefault,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
              
              const SizedBox(height: KSize.margin4x),
              
              // Rate display
              if (state.currentRate != null)
                RateChipWidget(
                  rate: state.currentRate!,
                  fromCurrency: state.selectedFromCurrency,
                  toCurrency: state.selectedToCurrency,
                ),
              
              // Cache status indicator
              if (state.currentRate != null)
                Container(
                  margin: const EdgeInsets.only(top: KSize.margin2x),
                  padding: const EdgeInsets.symmetric(
                    horizontal: KSize.margin2x,
                    vertical: KSize.margin1x,
                  ),
                  decoration: BoxDecoration(
                    color: KColors.backgroundLight,
                    borderRadius: BorderRadius.circular(KSize.radiusSmall),
                    border: Border.all(
                      color: KColors.textSecondary.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.offline_bolt,
                        size: 16,
                        color: KColors.textSecondary,
                      ),
                      SizedBox(width: KSize.margin1x),
                      Text(
                        'Using cached data for fast conversion',
                        style: TextStyle(
                          fontSize: KSize.fontSmall,
                          color: KColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              
              const SizedBox(height: KSize.margin4x),
              
              // Result section
              Expanded(
                child: ConversionResultWidget(
                  result: state.conversionResult,
                  isLoading: state.isLoading,
                  hasError: state.hasError,
                  onRetry: notifier.convert,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
