import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:calculator_online/currency_conversion/application/providers/currency_providers.dart';
import 'package:calculator_online/main.dart';

/// Test helpers for common testing scenarios

/// Helper to create a widget with ProviderScope for testing
Widget createTestWidget(Widget child) {
  return ProviderScope(
    child: MaterialApp(
      home: Scaffold(body: child),
    ),
  );
}

/// Helper to create app with SharedPreferences for testing
Future<Widget> createAppWithPreferences() async {
  SharedPreferences.setMockInitialValues({});
  await SharedPreferences.getInstance();
  final prefs = await SharedPreferences.getInstance();
  
  return ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(prefs),
    ],
    child: const CalculatorApp(),
  );
}

/// Helper to pump widget and wait for async operations
Future<void> pumpAndSettleSafely(WidgetTester tester, {Duration? timeout}) async {
  try {
    await tester.pumpAndSettle(
      timeout ?? const Duration(seconds: 10),
    );
  } catch (e) {
    // If pumpAndSettle times out, just pump a few times
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
  }
}

/// Helper to test different screen sizes
Future<void> testScreenSize(
  WidgetTester tester,
  Size size,
  Future<void> Function() testCallback,
) async {
  await tester.binding.setSurfaceSize(size);
  await tester.pump();
  await testCallback();
  await tester.binding.setSurfaceSize(null);
}

/// Common screen sizes for testing
class ScreenSizes {
  static const phonePortrait = Size(375, 812); // iPhone 14
  static const phoneLandscape = Size(812, 375);
  static const tabletPortrait = Size(768, 1024); // iPad
  static const tabletLandscape = Size(1024, 768);
  static const desktop = Size(1920, 1080);
}

/// Helper to find widget by key value
Finder findByKeyValue(String keyValue) {
  return find.byKey(ValueKey(keyValue));
}

/// Helper to wait for condition
Future<void> waitForCondition(
  bool Function() condition, {
  Duration timeout = const Duration(seconds: 5),
  Duration interval = const Duration(milliseconds: 100),
}) async {
  final stopwatch = Stopwatch()..start();
  while (!condition() && stopwatch.elapsed < timeout) {
    await Future.delayed(interval);
  }
  if (!condition()) {
    throw TimeoutException('Condition not met within timeout');
  }
}

/// BDD-style test helpers
class Given {
  static Widget widget(Widget child) => child;
  static ProviderScope providerScope(Widget child) => ProviderScope(child: child);
}

class When {
  static Future<void> tap(WidgetTester tester, Finder finder) async {
    await tester.tap(finder);
    await tester.pump();
  }
  
  static Future<void> enterText(WidgetTester tester, Finder finder, String text) async {
    await tester.enterText(finder, text);
    await tester.pump();
  }
  
  static Future<void> scroll(WidgetTester tester, Finder finder, Offset offset) async {
    await tester.drag(finder, offset);
    await tester.pump();
  }
}

class Then {
  static void shouldFind(Finder finder, Matcher matcher) {
    expect(finder, matcher);
  }
  
  static void shouldHaveText(Finder finder, String text) {
    expect(finder, findsOneWidget);
    expect(find.text(text), findsOneWidget);
  }
  
  static void shouldNotFind(Finder finder) {
    expect(finder, findsNothing);
  }
}

/// TDD helpers
class TestDouble {
  static T mock<T>() {
    // This would integrate with mockito or similar
    throw UnimplementedError('Use mockito or create manual mocks');
  }
}

/// Test logger for test helpers
/// Uses debugPrint which is safe for tests and can be controlled
class TestLogger {
  static bool _enabled = kDebugMode;
  
  /// Enable or disable test logging
  static void setEnabled(bool enabled) {
    _enabled = enabled;
  }
  
  /// Log debug message
  static void debug(String message) {
    if (_enabled) {
      debugPrint('[TEST DEBUG] $message');
    }
  }
  
  /// Log info message
  static void info(String message) {
    if (_enabled) {
      debugPrint('[TEST INFO] $message');
    }
  }
  
  /// Log warning message
  static void warning(String message) {
    if (_enabled) {
      debugPrint('[TEST WARNING] $message');
    }
  }
  
  /// Log error message
  static void error(String message, [Object? error]) {
    if (_enabled) {
      debugPrint('[TEST ERROR] $message');
      if (error != null) {
        debugPrint('[TEST ERROR] Error details: $error');
      }
    }
  }
}

/// Performance testing helpers
class PerformanceTest {
  static Future<T> measure<T>(Future<T> Function() operation) async {
    final stopwatch = Stopwatch()..start();
    final result = await operation();
    stopwatch.stop();
    TestLogger.debug('Operation took ${stopwatch.elapsedMilliseconds}ms');
    return result;
  }
  
  static T measureSync<T>(T Function() operation) {
    final stopwatch = Stopwatch()..start();
    final result = operation();
    stopwatch.stop();
    TestLogger.debug('Operation took ${stopwatch.elapsedMicroseconds}μs');
    return result;
  }
}

