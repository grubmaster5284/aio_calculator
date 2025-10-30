import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calculator_online/calculator/presentation/pages/calculator_page.dart';

void main() {
  group('Calculator UI Tests', () {
    testWidgets('Calculator page displays correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: CalculatorPage(),
          ),
        ),
      );

      // Verify calculator display is present
      expect(find.byType(CalculatorPage), findsOneWidget);
      
      // Verify keypad buttons are present
      expect(find.text('0'), findsWidgets);
      expect(find.text('1'), findsWidgets);
      expect(find.text('+'), findsWidgets);
      expect(find.text('='), findsWidgets);
    });

    testWidgets('Calculator handles button presses', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: CalculatorPage(),
          ),
        ),
      );

      // Test number input
      await tester.tap(find.text('1'));
      await tester.pump();
      
      await tester.tap(find.text('2'));
      await tester.pump();
      
      await tester.tap(find.text('3'));
      await tester.pump();

      // Test operator
      await tester.tap(find.text('+'));
      await tester.pump();
      
      await tester.tap(find.text('4'));
      await tester.pump();
      
      await tester.tap(find.text('5'));
      await tester.pump();
      
      await tester.tap(find.text('6'));
      await tester.pump();

      // Test equals
      await tester.tap(find.text('='));
      await tester.pump();
    });

    testWidgets('Calculator clears on AC button', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: CalculatorPage(),
          ),
        ),
      );

      // Input some numbers
      await tester.tap(find.text('1'));
      await tester.pump();
      await tester.tap(find.text('2'));
      await tester.pump();
      
      // Clear
      await tester.tap(find.text('AC'));
      await tester.pump();
    });
  });
}

