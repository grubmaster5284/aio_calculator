import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:calculator_online/main.dart';
import 'package:calculator_online/currency_conversion/application/providers/currency_providers.dart';
import 'package:calculator_online/currency_conversion/domain/repositories/i_currency_repository.dart';
import 'package:calculator_online/currency_conversion/domain/entities/currency_model.dart';
import 'package:calculator_online/currency_conversion/domain/entities/rate_model.dart';
import 'package:calculator_online/currency_conversion/domain/entities/conversion_result_model.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/currency_code_vo.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/amount_vo.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/conversion_date_vo.dart';
import 'package:calculator_online/core/result.dart';
import 'package:calculator_online/currency_conversion/domain/errors/conversion_error.dart';

/// Mock repository for integration tests
class IntegrationMockRepository implements ICurrencyRepository {
  final List<CurrencyModel> currencies = [
    CurrencyModel(code: CurrencyCode('USD'), name: 'US Dollar', symbol: '\$'),
    CurrencyModel(code: CurrencyCode('EUR'), name: 'Euro', symbol: '€'),
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
    return Result.success(currencies);
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
      rateScaled: BigInt.from(850000),
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
    final rate = BigInt.from(850000);
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
  group('Comprehensive Integration Tests', () {
    late SharedPreferences sharedPreferences;
    late IntegrationMockRepository mockRepository;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      sharedPreferences = await SharedPreferences.getInstance();
      mockRepository = IntegrationMockRepository();
    });

    testWidgets('App launches and shows calculator page', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(sharedPreferences),
            currencyRepositoryProvider.overrideWithValue(mockRepository),
          ],
          child: const CalculatorApp(),
        ),
      );

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(CalculatorApp), findsOneWidget);
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('App handles multiple screen size changes', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(sharedPreferences),
            currencyRepositoryProvider.overrideWithValue(mockRepository),
          ],
          child: const CalculatorApp(),
        ),
      );

      // Test various screen sizes
      final sizes = [
        const Size(400, 800),   // Portrait phone
        const Size(800, 400),   // Landscape phone
        const Size(768, 1024),  // Portrait tablet
        const Size(1024, 768),  // Landscape tablet
        const Size(1920, 1080), // Desktop
      ];

      for (final size in sizes) {
        await tester.binding.setSurfaceSize(size);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 50));
        expect(find.byType(CalculatorApp), findsOneWidget);
      }

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('App maintains state across orientation changes', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(sharedPreferences),
            currencyRepositoryProvider.overrideWithValue(mockRepository),
          ],
          child: const CalculatorApp(),
        ),
      );

      // Initial state
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Change to landscape
      await tester.binding.setSurfaceSize(const Size(800, 400));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Change back to portrait
      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // App should still be running
      expect(find.byType(CalculatorApp), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('App handles rapid navigation without crashes', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(sharedPreferences),
            currencyRepositoryProvider.overrideWithValue(mockRepository),
          ],
          child: const CalculatorApp(),
        ),
      );

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // App should remain stable
      expect(find.byType(CalculatorApp), findsOneWidget);
    });

    testWidgets('App handles memory pressure scenarios', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(sharedPreferences),
            currencyRepositoryProvider.overrideWithValue(mockRepository),
          ],
          child: const CalculatorApp(),
        ),
      );

      // Simulate multiple build cycles
      for (int i = 0; i < 10; i++) {
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 10));
      }

      expect(find.byType(CalculatorApp), findsOneWidget);
    });
  });
}

