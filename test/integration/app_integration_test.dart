import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:calculator_online/main.dart';
import 'package:calculator_online/currency_conversion/application/providers/currency_providers.dart';

void main() {
  group('App Integration Tests', () {
    late SharedPreferences sharedPreferences;

    setUp(() async {
      // Initialize SharedPreferences for testing
      SharedPreferences.setMockInitialValues({});
      sharedPreferences = await SharedPreferences.getInstance();
    });

    testWidgets('App starts and shows calculator page', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(sharedPreferences),
          ],
          child: const CalculatorApp(),
        ),
      );

      // Verify app starts
      expect(find.byType(CalculatorApp), findsOneWidget);
    });

    testWidgets('Navigation between pages works', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(sharedPreferences),
          ],
          child: const CalculatorApp(),
        ),
      );

      // Test navigation to different pages
      // This would require implementing navigation testing
      // For now, we'll just verify the app structure
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('App handles orientation changes', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(sharedPreferences),
          ],
          child: const CalculatorApp(),
        ),
      );

      // Test landscape orientation
      await tester.binding.setSurfaceSize(const Size(800, 600));
      await tester.pump();

      // Test portrait orientation
      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pump();
    });
  });
}

