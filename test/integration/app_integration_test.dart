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
      await tester.pumpAndSettle();

      // Verify we start on calculator page
      expect(find.byType(CalculatorApp), findsOneWidget);

      // Test navigation from Calculator to Converter Modes Page
      final converterButton = find.byIcon(Icons.swap_horiz);
      expect(converterButton, findsOneWidget);
      await tester.tap(converterButton);
      await tester.pumpAndSettle();
      
      // Verify we're on converter modes page
      expect(find.text('Currency'), findsOneWidget);

      // Test navigation from Converter Modes to Calculator (back button)
      await tester.tap(find.byIcon(Icons.arrow_back).first);
      await tester.pumpAndSettle();

      // Verify we're back on calculator
      expect(find.byIcon(Icons.swap_horiz), findsOneWidget);

      // Test navigation from Calculator to Graphing
      final graphingButton = find.byIcon(Icons.show_chart);
      expect(graphingButton, findsOneWidget);
      await tester.tap(graphingButton);
      await tester.pumpAndSettle();

      // Verify we're on graphing page
      expect(find.byIcon(Icons.show_chart), findsOneWidget);

      // Test back navigation from Graphing to Calculator
      await tester.tap(find.byIcon(Icons.arrow_back).first);
      await tester.pumpAndSettle();

      // Verify we're back on calculator
      expect(find.byIcon(Icons.swap_horiz), findsOneWidget);
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

