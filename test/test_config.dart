import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Test configuration and utilities
class TestConfig {
  /// Initialize mock SharedPreferences for testing
  static Future<SharedPreferences> initMockSharedPreferences() async {
    SharedPreferences.setMockInitialValues({});
    return await SharedPreferences.getInstance();
  }

  /// Common test setup
  static void setUp() {
    // Add any common test setup here
  }

  /// Common test teardown
  static void tearDown() {
    // Add any common test teardown here
  }
}

/// Test utilities for widget testing
class TestUtils {
  /// Wait for all animations to complete
  static Future<void> waitForAnimations(WidgetTester tester) async {
    await tester.pumpAndSettle();
  }

  /// Tap and wait for animations
  static Future<void> tapAndWait(WidgetTester tester, Finder finder) async {
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  /// Enter text and wait for animations
  static Future<void> enterTextAndWait(WidgetTester tester, Finder finder, String text) async {
    await tester.enterText(finder, text);
    await tester.pumpAndSettle();
  }
}

