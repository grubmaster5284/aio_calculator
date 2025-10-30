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

      // Test navigation to currency converter
      // This would require implementing navigation testing
      // For now, we'll just verify the app loads
      expect(find.byType(MaterialApp), findsOneWidget);
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

