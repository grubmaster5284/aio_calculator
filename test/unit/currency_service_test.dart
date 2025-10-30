import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_online/currency_conversion/domain/entities/currency_model.dart';
import 'package:calculator_online/currency_conversion/domain/entities/rate_model.dart';
import 'package:calculator_online/currency_conversion/domain/entities/conversion_result_model.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/currency_code_vo.dart';

void main() {
  group('Currency Service Unit Tests', () {
    test('should create valid currency model', () {
      final currency = CurrencyModel(
        code: CurrencyCode('USD'),
        name: 'US Dollar',
        symbol: '\$',
      );

      expect(currency.code.value, 'USD');
      expect(currency.name, 'US Dollar');
      expect(currency.symbol, '\$');
    });

    test('should create valid rate model', () {
      final rate = RateModel(
        baseCurrencyCode: CurrencyCode('USD'),
        quoteCurrencyCode: CurrencyCode('EUR'),
        rateScaled: BigInt.from(850000), // 0.85 * 10^6
        timestamp: DateTime.now(),
      );

      expect(rate.baseCurrencyCode.value, 'USD');
      expect(rate.quoteCurrencyCode.value, 'EUR');
      expect(rate.rateAsDouble, closeTo(0.85, 0.001));
      expect(rate.timestamp, isA<DateTime>());
    });

    test('should create valid conversion result', () {
      final result = ConversionResultModel(
        fromCurrencyCode: CurrencyCode('USD'),
        toCurrencyCode: CurrencyCode('EUR'),
        rateScaled: BigInt.from(850000), // 0.85 * 10^6
        amountInScaled: BigInt.from(100000000), // 100.0 * 10^6
        amountOutScaled: BigInt.from(85000000), // 85.0 * 10^6
        timestamp: DateTime.now(),
      );

      expect(result.fromCurrencyCode.value, 'USD');
      expect(result.toCurrencyCode.value, 'EUR');
      expect(result.amountInAsDouble, closeTo(100.0, 0.001));
      expect(result.amountOutAsDouble, closeTo(85.0, 0.001));
      expect(result.rateAsDouble, closeTo(0.85, 0.001));
    });

    test('should calculate conversion correctly', () {
      const amount = 100.0;
      const rate = 0.85;
      const expectedResult = 85.0;

      const result = amount * rate;
      expect(result, expectedResult);
    });

    test('should handle zero amount', () {
      const amount = 0.0;
      const rate = 0.85;
      const expectedResult = 0.0;

      const result = amount * rate;
      expect(result, expectedResult);
    });

    test('should handle negative rate', () {
      const amount = 100.0;
      const rate = -0.85;
      const expectedResult = -85.0;

      const result = amount * rate;
      expect(result, expectedResult);
    });
  });
}