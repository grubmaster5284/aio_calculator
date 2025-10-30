import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:calculator_online/currency_conversion/application/providers/currency_providers.dart';
import 'package:calculator_online/currency_conversion/presentation/pages/currency_page.dart';
import 'package:calculator_online/currency_conversion/domain/entities/currency_model.dart';

void main() {
  group('Currency Conversion Tests', () {
    late SharedPreferences sharedPreferences;

    setUp(() async {
      // Initialize SharedPreferences for testing
      SharedPreferences.setMockInitialValues({});
      sharedPreferences = await SharedPreferences.getInstance();
    });

    testWidgets('Currency page displays correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(sharedPreferences),
          ],
          child: const MaterialApp(
            home: CurrencyPage(),
          ),
        ),
      );

      // Verify currency page elements are present
      expect(find.byType(CurrencyPage), findsOneWidget);
      expect(find.text('Convert'), findsOneWidget);
    });

    testWidgets('Currency selection works', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(sharedPreferences),
          ],
          child: const MaterialApp(
            home: CurrencyPage(),
          ),
        ),
      );

      // Wait for initialization
      await tester.pumpAndSettle();

      // Test currency picker interaction
      final currencyPickers = find.byType(DropdownButton<CurrencyModel>);
      if (currencyPickers.evaluate().isNotEmpty) {
        await tester.tap(currencyPickers.first);
        await tester.pumpAndSettle();
      }
    });

    testWidgets('Amount input works', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(sharedPreferences),
          ],
          child: const MaterialApp(
            home: CurrencyPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Find amount input field
      final amountField = find.byType(TextField);
      if (amountField.evaluate().isNotEmpty) {
        await tester.enterText(amountField.first, '100');
        await tester.pump();
      }
    });
  });
}

