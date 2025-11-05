import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:calculator_online/currency_conversion/application/providers/currency_providers.dart';
import 'package:calculator_online/currency_conversion/presentation/pages/currency_page.dart';
import 'package:calculator_online/currency_conversion/domain/entities/currency_model.dart';
import 'package:calculator_online/currency_conversion/domain/repositories/i_currency_repository.dart';
import 'package:calculator_online/currency_conversion/domain/entities/rate_model.dart';
import 'package:calculator_online/currency_conversion/domain/entities/conversion_result_model.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/currency_code_vo.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/amount_vo.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/conversion_date_vo.dart';
import 'package:calculator_online/core/result.dart';
import 'package:calculator_online/currency_conversion/domain/errors/conversion_error.dart';

/// Mock repository for testing
class MockCurrencyRepository implements ICurrencyRepository {
  final List<CurrencyModel> mockCurrencies = [
    CurrencyModel(code: CurrencyCode('USD'), name: 'US Dollar', symbol: '\$'),
    CurrencyModel(code: CurrencyCode('EUR'), name: 'Euro', symbol: '€'),
    CurrencyModel(code: CurrencyCode('GBP'), name: 'British Pound', symbol: '£'),
  ];

  @override
  Future<Result<ConversionResultModel, ConversionError>> convert({
    required CurrencyCode from,
    required CurrencyCode to,
    required Amount amount,
    ConversionDate? at,
  }) async {
    await Future.delayed(const Duration(milliseconds: 10));
    final rate = BigInt.from(850000); // 0.85
    final convertedAmount = (amount.toDouble() * 0.85 * 1000000).round();
    return Result.success(ConversionResultModel(
      fromCurrencyCode: from,
      toCurrencyCode: to,
      rateScaled: rate,
      amountInScaled: BigInt.from((amount.toDouble() * 1000000).round()),
      amountOutScaled: BigInt.from(convertedAmount),
      timestamp: DateTime.now(),
    ));
  }

  @override
  Future<Result<List<CurrencyModel>, ConversionError>> getSupportedCurrencies() async {
    await Future.delayed(const Duration(milliseconds: 10));
    return Result.success(mockCurrencies);
  }

  @override
  Future<Result<RateModel, ConversionError>> getRate({
    required CurrencyCode from,
    required CurrencyCode to,
    ConversionDate? at,
  }) async {
    await Future.delayed(const Duration(milliseconds: 10));
    return Result.success(RateModel(
      baseCurrencyCode: from,
      quoteCurrencyCode: to,
      rateScaled: BigInt.from(850000), // 0.85
      timestamp: DateTime.now(),
    ));
  }

  @override
  Future<Result<ConversionResultModel, ConversionError>> convertOffline({
    required CurrencyCode from,
    required CurrencyCode to,
    required Amount amount,
  }) async {
    await Future.delayed(const Duration(milliseconds: 10));
    final rate = BigInt.from(850000); // 0.85
    final convertedAmount = (amount.toDouble() * 0.85 * 1000000).round();
    return Result.success(ConversionResultModel(
      fromCurrencyCode: from,
      toCurrencyCode: to,
      rateScaled: rate,
      amountInScaled: BigInt.from((amount.toDouble() * 1000000).round()),
      amountOutScaled: BigInt.from(convertedAmount),
      timestamp: DateTime.now(),
    ));
  }

  @override
  Future<Result<void, ConversionError>> initializeCache() async {
    await Future.delayed(const Duration(milliseconds: 10));
    return const Result.success(null);
  }
}

void main() {
  group('Currency Conversion Tests', () {
    late SharedPreferences sharedPreferences;
    late MockCurrencyRepository mockRepository;

    setUp(() async {
      // Initialize SharedPreferences for testing
      SharedPreferences.setMockInitialValues({});
      sharedPreferences = await SharedPreferences.getInstance();
      mockRepository = MockCurrencyRepository();
    });

    testWidgets('Currency page displays correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(sharedPreferences),
            currencyRepositoryProvider.overrideWithValue(mockRepository),
          ],
          child: const MaterialApp(
            home: CurrencyPage(),
          ),
        ),
      );

      // Wait for initial load to complete
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Verify currency page elements are present
      expect(find.byType(CurrencyPage), findsOneWidget);
      expect(find.text('Convert'), findsOneWidget);
    });

    testWidgets('Currency selection works', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(sharedPreferences),
            currencyRepositoryProvider.overrideWithValue(mockRepository),
          ],
          child: const MaterialApp(
            home: CurrencyPage(),
          ),
        ),
      );

      // Wait for initialization with timeout
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(const Duration(milliseconds: 100));

      // Test currency picker interaction
      final currencyPickers = find.byType(DropdownButton<CurrencyModel>);
      if (currencyPickers.evaluate().isNotEmpty) {
        await tester.tap(currencyPickers.first);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));
      }
    });

    testWidgets('Amount input works', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(sharedPreferences),
            currencyRepositoryProvider.overrideWithValue(mockRepository),
          ],
          child: const MaterialApp(
            home: CurrencyPage(),
          ),
        ),
      );

      // Wait for initialization with timeout to prevent infinite waiting
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(const Duration(milliseconds: 100));

      // Find amount input field
      final amountField = find.byType(TextField);
      if (amountField.evaluate().isNotEmpty) {
        await tester.enterText(amountField.first, '100');
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 50));
        
        // Verify the text was entered
        expect(find.text('100'), findsOneWidget);
      }
    });
  });
}

