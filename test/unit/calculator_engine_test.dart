import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_online/calculator/data/services/calculator_engine_service.dart';

void main() {
  group('Calculator Engine Unit Tests', () {
    late CalculatorEngineService calculatorEngine;

    setUp(() {
      calculatorEngine = const CalculatorEngineService();
    });

    test('should handle basic addition', () {
      final result = calculatorEngine.tryCompute(1.0, 2.0, '+');
      expect(result, 3.0);
    });

    test('should handle basic subtraction', () {
      final result = calculatorEngine.tryCompute(5.0, 3.0, '-');
      expect(result, 2.0);
    });

    test('should handle basic multiplication', () {
      final result = calculatorEngine.tryCompute(4.0, 3.0, '×');
      expect(result, 12.0);
    });

    test('should handle basic division', () {
      final result = calculatorEngine.tryCompute(8.0, 2.0, '÷');
      expect(result, 4.0);
    });

    test('should handle division by zero', () {
      final result = calculatorEngine.tryCompute(8.0, 0.0, '÷');
      expect(result, null);
    });

    test('should handle power operations', () {
      final result = calculatorEngine.tryCompute(2.0, 3.0, '^');
      expect(result, 8.0);
    });

    test('should format results correctly', () {
      final formatted = calculatorEngine.formatResult(3.0);
      expect(formatted, '3');
      
      final formattedDecimal = calculatorEngine.formatResult(3.141592653589793);
      expect(formattedDecimal, '3.1415926536');
    });

    test('should handle square root', () {
      final result = calculatorEngine.unary('√', 9.0, isDegrees: false);
      expect(result, 3.0);
    });

    test('should handle square root of negative number', () {
      final result = calculatorEngine.unary('√', -9.0, isDegrees: false);
      expect(result, null);
    });

    test('should handle sine function', () {
      final result = calculatorEngine.unary('sin', 90.0, isDegrees: true);
      expect(result, closeTo(1.0, 0.001));
    });

    test('should handle cosine function', () {
      final result = calculatorEngine.unary('cos', 0.0, isDegrees: true);
      expect(result, closeTo(1.0, 0.001));
    });

    test('should handle logarithm', () {
      final result = calculatorEngine.unary('log', 100.0, isDegrees: false);
      expect(result, closeTo(2.0, 0.001));
    });

    test('should handle logarithm of negative number', () {
      final result = calculatorEngine.unary('log', -100.0, isDegrees: false);
      expect(result, null);
    });

    test('should handle factorial', () {
      final result = calculatorEngine.unary('!', 5.0, isDegrees: false);
      expect(result, 120.0);
    });

    test('should handle factorial of negative number', () {
      final result = calculatorEngine.unary('!', -5.0, isDegrees: false);
      expect(result, null);
    });

    test('should handle reciprocal', () {
      final result = calculatorEngine.unary('1/x', 4.0, isDegrees: false);
      expect(result, 0.25);
    });

    test('should handle reciprocal of zero', () {
      final result = calculatorEngine.unary('1/x', 0.0, isDegrees: false);
      expect(result, null);
    });
  });
}