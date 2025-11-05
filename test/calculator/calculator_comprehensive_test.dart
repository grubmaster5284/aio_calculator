import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_online/calculator/data/services/calculator_engine_service.dart';

void main() {
  group('Calculator Comprehensive Tests', () {
    late CalculatorEngineService calculator;

    setUp(() {
      calculator = const CalculatorEngineService();
    });

    group('Basic Arithmetic Operations', () {
      test('addition with positive numbers', () {
        expect(calculator.tryCompute(5.0, 3.0, '+'), 8.0);
        expect(calculator.tryCompute(10.0, 15.0, '+'), 25.0);
        expect(calculator.tryCompute(0.0, 5.0, '+'), 5.0);
      });

      test('addition with negative numbers', () {
        expect(calculator.tryCompute(-5.0, -3.0, '+'), -8.0);
        expect(calculator.tryCompute(-5.0, 3.0, '+'), -2.0);
        expect(calculator.tryCompute(5.0, -3.0, '+'), 2.0);
      });

      test('subtraction with positive numbers', () {
        expect(calculator.tryCompute(10.0, 3.0, '-'), 7.0);
        expect(calculator.tryCompute(5.0, 5.0, '-'), 0.0);
        expect(calculator.tryCompute(3.0, 10.0, '-'), -7.0);
      });

      test('subtraction with negative numbers', () {
        expect(calculator.tryCompute(-5.0, -3.0, '-'), -2.0);
        expect(calculator.tryCompute(-5.0, 3.0, '-'), -8.0);
        expect(calculator.tryCompute(5.0, -3.0, '-'), 8.0);
      });

      test('multiplication with positive numbers', () {
        expect(calculator.tryCompute(5.0, 3.0, '×'), 15.0);
        expect(calculator.tryCompute(10.0, 0.0, '×'), 0.0);
        expect(calculator.tryCompute(0.0, 5.0, '×'), 0.0);
      });

      test('multiplication with negative numbers', () {
        expect(calculator.tryCompute(-5.0, 3.0, '×'), -15.0);
        expect(calculator.tryCompute(-5.0, -3.0, '×'), 15.0);
        expect(calculator.tryCompute(5.0, -3.0, '×'), -15.0);
      });

      test('division with positive numbers', () {
        expect(calculator.tryCompute(10.0, 2.0, '÷'), 5.0);
        expect(calculator.tryCompute(15.0, 3.0, '÷'), 5.0);
        expect(calculator.tryCompute(1.0, 4.0, '÷'), 0.25);
      });

      test('division with negative numbers', () {
        expect(calculator.tryCompute(-10.0, 2.0, '÷'), -5.0);
        expect(calculator.tryCompute(-10.0, -2.0, '÷'), 5.0);
        expect(calculator.tryCompute(10.0, -2.0, '÷'), -5.0);
      });

      test('division by zero returns null', () {
        expect(calculator.tryCompute(10.0, 0.0, '÷'), isNull);
        expect(calculator.tryCompute(-10.0, 0.0, '÷'), isNull);
        expect(calculator.tryCompute(0.0, 0.0, '÷'), isNull);
      });

      test('division with decimal results', () {
        expect(calculator.tryCompute(1.0, 3.0, '÷'), closeTo(0.333333, 0.000001));
        expect(calculator.tryCompute(7.0, 2.0, '÷'), 3.5);
      });
    });

    group('Advanced Operations', () {
      test('power operation with positive base and exponent', () {
        expect(calculator.tryCompute(2.0, 3.0, '^'), 8.0);
        expect(calculator.tryCompute(5.0, 2.0, '^'), 25.0);
        expect(calculator.tryCompute(10.0, 0.0, '^'), 1.0);
        expect(calculator.tryCompute(2.0, 1.0, '^'), 2.0);
      });

      test('power operation with negative base', () {
        expect(calculator.tryCompute(-2.0, 3.0, '^'), -8.0);
        expect(calculator.tryCompute(-2.0, 2.0, '^'), 4.0);
      });

      test('power operation with fractional exponent', () {
        expect(calculator.tryCompute(4.0, 0.5, '^'), closeTo(2.0, 0.001));
        expect(calculator.tryCompute(9.0, 0.5, '^'), closeTo(3.0, 0.001));
      });

      test('square root of positive numbers', () {
        expect(calculator.unary('√', 9.0, isDegrees: false), 3.0);
        expect(calculator.unary('√', 16.0, isDegrees: false), 4.0);
        expect(calculator.unary('√', 25.0, isDegrees: false), 5.0);
        expect(calculator.unary('√', 0.0, isDegrees: false), 0.0);
        expect(calculator.unary('√', 1.0, isDegrees: false), 1.0);
      });

      test('square root of negative numbers returns null', () {
        expect(calculator.unary('√', -9.0, isDegrees: false), isNull);
        expect(calculator.unary('√', -16.0, isDegrees: false), isNull);
      });

      test('square root of decimal numbers', () {
        expect(calculator.unary('√', 0.25, isDegrees: false), closeTo(0.5, 0.001));
        expect(calculator.unary('√', 2.25, isDegrees: false), closeTo(1.5, 0.001));
      });

      test('sine function in degrees', () {
        expect(calculator.unary('sin', 0.0, isDegrees: true), closeTo(0.0, 0.001));
        expect(calculator.unary('sin', 90.0, isDegrees: true), closeTo(1.0, 0.001));
        expect(calculator.unary('sin', 180.0, isDegrees: true), closeTo(0.0, 0.001));
        expect(calculator.unary('sin', 270.0, isDegrees: true), closeTo(-1.0, 0.001));
      });

      test('cosine function in degrees', () {
        expect(calculator.unary('cos', 0.0, isDegrees: true), closeTo(1.0, 0.001));
        expect(calculator.unary('cos', 90.0, isDegrees: true), closeTo(0.0, 0.001));
        expect(calculator.unary('cos', 180.0, isDegrees: true), closeTo(-1.0, 0.001));
        expect(calculator.unary('cos', 270.0, isDegrees: true), closeTo(0.0, 0.001));
      });

      test('tangent function in degrees', () {
        expect(calculator.unary('tan', 0.0, isDegrees: true), closeTo(0.0, 0.001));
        expect(calculator.unary('tan', 45.0, isDegrees: true), closeTo(1.0, 0.01));
      });

      test('logarithm function', () {
        expect(calculator.unary('log', 1.0, isDegrees: false), closeTo(0.0, 0.001));
        expect(calculator.unary('log', 10.0, isDegrees: false), closeTo(1.0, 0.001));
        expect(calculator.unary('log', 100.0, isDegrees: false), closeTo(2.0, 0.001));
        expect(calculator.unary('log', 1000.0, isDegrees: false), closeTo(3.0, 0.001));
      });

      test('logarithm of negative numbers returns null', () {
        expect(calculator.unary('log', -10.0, isDegrees: false), isNull);
        expect(calculator.unary('log', -100.0, isDegrees: false), isNull);
      });

      test('logarithm of zero returns null', () {
        expect(calculator.unary('log', 0.0, isDegrees: false), isNull);
      });

      test('factorial function', () {
        expect(calculator.unary('!', 0.0, isDegrees: false), 1.0);
        expect(calculator.unary('!', 1.0, isDegrees: false), 1.0);
        expect(calculator.unary('!', 5.0, isDegrees: false), 120.0);
        expect(calculator.unary('!', 3.0, isDegrees: false), 6.0);
      });

      test('factorial of negative numbers returns null', () {
        expect(calculator.unary('!', -5.0, isDegrees: false), isNull);
      });

      test('factorial of non-integer returns null', () {
        expect(calculator.unary('!', 5.5, isDegrees: false), isNull);
      });

      test('reciprocal function', () {
        expect(calculator.unary('1/x', 2.0, isDegrees: false), 0.5);
        expect(calculator.unary('1/x', 4.0, isDegrees: false), 0.25);
        expect(calculator.unary('1/x', 10.0, isDegrees: false), 0.1);
        expect(calculator.unary('1/x', 0.5, isDegrees: false), 2.0);
      });

      test('reciprocal of zero returns null', () {
        expect(calculator.unary('1/x', 0.0, isDegrees: false), isNull);
      });

      test('percentage function is not supported', () {
        // Percentage is not a unary operation in this calculator
        expect(calculator.unary('%', 50.0, isDegrees: false), isNull);
      });

      test('negation function is not supported', () {
        // Negation is not a unary operation in this calculator
        expect(calculator.unary('±', 5.0, isDegrees: false), isNull);
      });
    });

    group('Result Formatting', () {
      test('formats integers correctly', () {
        expect(calculator.formatResult(5.0), '5');
        expect(calculator.formatResult(100.0), '100');
        expect(calculator.formatResult(0.0), '0');
      });

      test('formats decimals correctly', () {
        // With 12 decimal places, pi shows more precision
        expect(calculator.formatResult(3.141592653589793), '3.14159265359');
        expect(calculator.formatResult(0.5), '0.5');
        expect(calculator.formatResult(0.123456789), '0.123456789');
      });

      test('formats very large numbers', () {
        expect(calculator.formatResult(1000000.0), '1000000');
        // Handle floating point precision issues with very large numbers
        final result = calculator.formatResult(999999999.99);
        // Should start with the expected value (may have minor precision differences at the end)
        expect(result, startsWith('999999999.99'));
      });

      test('formats very small numbers', () {
        // Numbers >= 1e-6 are formatted normally
        expect(calculator.formatResult(0.000001), '0.000001');
        // Numbers < 1e-6 use scientific notation
        expect(calculator.formatResult(0.0000001), contains('e-'));
      });

      test('formats negative numbers', () {
        expect(calculator.formatResult(-5.0), '-5');
        expect(calculator.formatResult(-3.14), '-3.14');
      });

      test('handles scientific notation for very large numbers', () {
        final result = calculator.formatResult(1e10);
        expect(result, contains('e+'));
        expect(result, isA<String>());
      });

      test('handles scientific notation for very small numbers', () {
        final result = calculator.formatResult(1e-10);
        expect(result, contains('e-'));
        expect(result, isA<String>());
      });

      test('handles NaN', () {
        final result = calculator.formatResult(double.nan);
        expect(result, 'NaN');
      });

      test('handles infinity', () {
        final resultPositive = calculator.formatResult(double.infinity);
        final resultNegative = calculator.formatResult(double.negativeInfinity);
        expect(resultPositive, '∞');
        expect(resultNegative, '-∞');
      });
    });

    group('Edge Cases', () {
      test('handles very large numbers in operations', () {
        expect(calculator.tryCompute(1e10, 1e10, '+'), closeTo(2e10, 1e5));
        expect(calculator.tryCompute(1e10, 1e10, '×'), closeTo(1e20, 1e10));
      });

      test('handles very small numbers in operations', () {
        expect(calculator.tryCompute(1e-10, 1e-10, '+'), closeTo(2e-10, 1e-15));
      });

      test('handles precision loss in floating point', () {
        final result = calculator.tryCompute(0.1, 0.2, '+');
        expect(result, closeTo(0.3, 0.0000001));
      });

      test('handles operations with zero', () {
        expect(calculator.tryCompute(0.0, 5.0, '+'), 5.0);
        expect(calculator.tryCompute(5.0, 0.0, '+'), 5.0);
        expect(calculator.tryCompute(0.0, 5.0, '×'), 0.0);
        expect(calculator.tryCompute(5.0, 0.0, '×'), 0.0);
      });

      test('handles operations with one', () {
        expect(calculator.tryCompute(1.0, 5.0, '×'), 5.0);
        expect(calculator.tryCompute(5.0, 1.0, '×'), 5.0);
        expect(calculator.tryCompute(5.0, 1.0, '÷'), 5.0);
      });
    });

    group('Invalid Operations', () {
      test('returns null for invalid operator', () {
        expect(calculator.tryCompute(5.0, 3.0, 'invalid'), isNull);
        expect(calculator.tryCompute(5.0, 3.0, ''), isNull);
      });

      test('returns null for invalid unary operation', () {
        expect(calculator.unary('invalid', 5.0, isDegrees: false), isNull);
        expect(calculator.unary('', 5.0, isDegrees: false), isNull);
      });
    });
  });
}

