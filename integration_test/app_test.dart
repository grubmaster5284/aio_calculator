import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:calculator_online/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Calculator App Integration Tests', () {
    testWidgets('Complete calculator workflow', (WidgetTester tester) async {
      // Start the app
      app.main();
      await tester.pumpAndSettle();

      // Test basic calculation
      await tester.tap(find.text('1'));
      await tester.pumpAndSettle();
      
      await tester.tap(find.text('+'));
      await tester.pumpAndSettle();
      
      await tester.tap(find.text('2'));
      await tester.pumpAndSettle();
      
      await tester.tap(find.text('='));
      await tester.pumpAndSettle();

      // Verify result
      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('Navigation between features', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify we start on calculator page
      expect(find.byType(MaterialApp), findsOneWidget);

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
      app.main();
      await tester.pumpAndSettle();

      // Test landscape orientation
      await tester.binding.setSurfaceSize(const Size(800, 600));
      await tester.pumpAndSettle();

      // Test portrait orientation
      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pumpAndSettle();
    });
  });
}

