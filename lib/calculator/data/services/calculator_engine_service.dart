import 'dart:math' as dm;

class CalculatorEngineService {
  const CalculatorEngineService();

  double? tryCompute(double storedValue, double currentValue, String operator) {
    switch (operator) {
      case '+':
        return storedValue + currentValue;
      case '-':
        return storedValue - currentValue;
      case '×':
        return storedValue * currentValue;
      case '÷':
        if (currentValue == 0) return null;
        return storedValue / currentValue;
      case '^':
        return powSafe(storedValue, currentValue);
      default:
        return null;
    }
  }

  String formatResult(double value) {
    String resultString = value.toStringAsFixed(10);
    resultString = resultString.replaceAll(RegExp(r'([.]*0+)(?!.*\d)'), '');
    return resultString;
  }

  double? unary(String op, double x, {required bool isDegrees}) {
    switch (op) {
      case 'sin':
        return _Math.sin(_toRadiansIfNeeded(x, isDegrees));
      case 'cos':
        return _Math.cos(_toRadiansIfNeeded(x, isDegrees));
      case 'tan':
        return _Math.tan(_toRadiansIfNeeded(x, isDegrees));
      case 'asin':
        final v = _Math.asin(x);
        return isDegrees ? _toDegrees(v) : v;
      case 'acos':
        final v = _Math.acos(x);
        return isDegrees ? _toDegrees(v) : v;
      case 'atan':
        final v = _Math.atan(x);
        return isDegrees ? _toDegrees(v) : v;
      case 'log':
        if (x <= 0) return null;
        return _Math.log10(x);
      case 'ln':
        if (x <= 0) return null;
        return _Math.ln(x);
      case '√':
        if (x < 0) return null;
        return _Math.sqrt(x);
      case '1/x':
        if (x == 0) return null;
        return 1 / x;
      case '!':
        if (x < 0) return null;
        if (x % 1 != 0) return null;
        return _factorial(x.toInt());
      default:
        return null;
    }
  }

  double _toRadiansIfNeeded(double degreesValue, bool isDegrees) =>
      isDegrees ? degreesValue * _Math.pi / 180.0 : degreesValue;
  double _toDegrees(double radiansValue) => radiansValue * 180.0 / _Math.pi;

  double? powSafe(double a, double b) {
    try {
      return _Math.pow(a, b);
    } catch (_) {
      return null;
    }
  }

  double _factorial(int n) {
    double result = 1.0;
    for (int i = 2; i <= n; i++) {
      result *= i;
    }
    return result;
  }
}

class _Math {
  static const double pi = 3.1415926535897932;
  static double sin(double x) => dm.sin(x);
  static double cos(double x) => dm.cos(x);
  static double tan(double x) => dm.tan(x);
  static double asin(double x) => dm.asin(x);
  static double acos(double x) => dm.acos(x);
  static double atan(double x) => dm.atan(x);
  static double ln(double x) => dm.log(x);
  static double log10(double x) => dm.log(x) / dm.ln10;
  static double sqrt(double x) => dm.sqrt(x);
  static double pow(double a, double b) => dm.pow(a, b).toDouble();
}
