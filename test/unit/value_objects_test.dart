import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/currency_code_vo.dart';
import 'package:calculator_online/currency_conversion/domain/value_objects/amount_vo.dart';

void main() {
  group('Value Objects Tests', () {
    group('CurrencyCode', () {
      test('creates valid currency code from uppercase string', () {
        final code = CurrencyCode('USD');
        expect(code.value, 'USD');
      });

      test('normalizes lowercase to uppercase', () {
        final code = CurrencyCode('usd');
        expect(code.value, 'USD');
      });

      test('trims whitespace', () {
        final code = CurrencyCode('  EUR  ');
        expect(code.value, 'EUR');
      });

      test('throws error for empty string', () {
        expect(() => CurrencyCode(''), throwsArgumentError);
        expect(() => CurrencyCode('   '), throwsArgumentError);
      });

      test('throws error for wrong length', () {
        expect(() => CurrencyCode('US'), throwsArgumentError);
        expect(() => CurrencyCode('USDD'), throwsArgumentError);
        expect(() => CurrencyCode('U'), throwsArgumentError);
      });

      test('throws error for non-alphabetic characters', () {
        expect(() => CurrencyCode('US1'), throwsArgumentError);
        expect(() => CurrencyCode('12D'), throwsArgumentError);
        expect(() => CurrencyCode('U@D'), throwsArgumentError);
        expect(() => CurrencyCode('US-'), throwsArgumentError);
      });

      test('equality works correctly', () {
        final code1 = CurrencyCode('USD');
        final code2 = CurrencyCode('USD');
        final code3 = CurrencyCode('EUR');
        
        expect(code1, equals(code2));
        expect(code1, isNot(equals(code3)));
        expect(code1 == code2, true);
        expect(code1 == code3, false);
      });

      test('hashCode is consistent', () {
        final code1 = CurrencyCode('USD');
        final code2 = CurrencyCode('USD');
        
        expect(code1.hashCode, equals(code2.hashCode));
      });

      test('toString returns value', () {
        final code = CurrencyCode('USD');
        expect(code.toString(), 'USD');
      });

      test('handles all valid ISO currency codes', () {
        final validCodes = ['USD', 'EUR', 'GBP', 'JPY', 'AUD', 'CAD', 'CHF', 
                           'CNY', 'INR', 'BRL', 'RUB', 'KRW', 'MXN', 'SGD'];
        
        for (final codeStr in validCodes) {
          expect(() => CurrencyCode(codeStr), returnsNormally);
          final code = CurrencyCode(codeStr);
          expect(code.value, codeStr);
        }
      });
    });

    group('Amount', () {
      test('creates amount from integer string', () {
        final amount = Amount.fromDecimalString('100');
        expect(amount.toDouble(), 100.0);
      });

      test('creates amount from decimal string', () {
        final amount = Amount.fromDecimalString('100.50');
        expect(amount.toDouble(), closeTo(100.50, 0.001));
      });

      test('creates amount from double', () {
        final amount = Amount.fromDouble(100.50);
        expect(amount.toDouble(), closeTo(100.50, 0.001));
      });

      test('handles zero', () {
        final amount1 = Amount.fromDecimalString('0');
        final amount2 = Amount.fromDouble(0.0);
        expect(amount1.toDouble(), 0.0);
        expect(amount2.toDouble(), 0.0);
      });

      test('handles very large numbers', () {
        final amount = Amount.fromDecimalString('999999999.99');
        expect(amount.toDouble(), closeTo(999999999.99, 0.01));
      });

      test('handles very small decimals', () {
        final amount = Amount.fromDecimalString('0.000001');
        expect(amount.toDouble(), closeTo(0.000001, 0.0000001));
      });

      test('trims whitespace', () {
        final amount1 = Amount.fromDecimalString('  100  ');
        final amount2 = Amount.fromDecimalString('100');
        expect(amount1.toDouble(), amount2.toDouble());
      });

      test('throws error for empty string', () {
        expect(() => Amount.fromDecimalString(''), throwsArgumentError);
        expect(() => Amount.fromDecimalString('   '), throwsArgumentError);
      });

      test('throws error for invalid decimal format', () {
        expect(() => Amount.fromDecimalString('100.50.25'), throwsArgumentError);
        expect(() => Amount.fromDecimalString('..'), throwsArgumentError);
      });

      test('throws error for non-numeric characters', () {
        expect(() => Amount.fromDecimalString('abc'), throwsArgumentError);
        expect(() => Amount.fromDecimalString('100abc'), throwsArgumentError);
        expect(() => Amount.fromDecimalString('100.5a'), throwsArgumentError);
      });

      test('throws error for negative numbers', () {
        expect(() => Amount.fromDecimalString('-100'), throwsArgumentError);
        expect(() => Amount.fromDouble(-100.0), throwsArgumentError);
      });

      test('throws error for invalid scale', () {
        expect(() => Amount.fromDecimalString('100', scale: -1), throwsArgumentError);
        expect(() => Amount.fromDecimalString('100', scale: 19), throwsArgumentError);
      });

      test('throws error for NaN', () {
        expect(() => Amount.fromDouble(double.nan), throwsArgumentError);
      });

      test('throws error for infinity', () {
        expect(() => Amount.fromDouble(double.infinity), throwsArgumentError);
        expect(() => Amount.fromDouble(double.negativeInfinity), throwsArgumentError);
      });

      test('handles different scales correctly', () {
        final amount1 = Amount.fromDecimalString('100.123456', scale: 6);
        final amount2 = Amount.fromDecimalString('100.123', scale: 3);
        
        expect(amount1.toDouble(), closeTo(100.123456, 0.000001));
        expect(amount2.toDouble(), closeTo(100.123, 0.001));
      });

      test('rounds to specified scale', () {
        final amount = Amount.fromDecimalString('100.123456789', scale: 6);
        expect(amount.toDouble(), closeTo(100.123457, 0.000001));
      });

      test('equality works correctly', () {
        final amount1 = Amount.fromDecimalString('100.50');
        final amount2 = Amount.fromDecimalString('100.50');
        final amount3 = Amount.fromDecimalString('100.51');
        
        expect(amount1, equals(amount2));
        expect(amount1, isNot(equals(amount3)));
      });

      test('hashCode is consistent', () {
        final amount1 = Amount.fromDecimalString('100.50');
        final amount2 = Amount.fromDecimalString('100.50');
        
        expect(amount1.hashCode, equals(amount2.hashCode));
      });

      test('toString formats correctly', () {
        final amount1 = Amount.fromDecimalString('100');
        final amount2 = Amount.fromDecimalString('100.50');
        final amount3 = Amount.fromDecimalString('100.123456', scale: 6);
        
        expect(amount1.toString(), '100.000000');
        expect(amount2.toString(), '100.500000');
        expect(amount3.toString(), '100.123456');
      });

      test('handles leading zeros', () {
        final amount = Amount.fromDecimalString('00100.50');
        expect(amount.toDouble(), closeTo(100.50, 0.001));
      });

      test('handles decimal without integer part', () {
        final amount = Amount.fromDecimalString('.5');
        expect(amount.toDouble(), closeTo(0.5, 0.001));
      });

      test('handles integer without decimal part', () {
        final amount = Amount.fromDecimalString('100.');
        expect(amount.toDouble(), closeTo(100.0, 0.001));
      });
    });
  });
}

