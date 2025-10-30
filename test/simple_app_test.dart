import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Simple test to verify basic Flutter functionality
/// This test doesn't require complex dependencies and can help verify the testing setup

void main() {
  group('Simple App Tests', () {
    testWidgets('Basic Flutter widget test', (WidgetTester tester) async {
      // Create a simple widget tree
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                const Text('Calculator Online'),
                const Text('0'),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('1'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('+'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('='),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

      // Verify basic elements are present
      expect(find.text('Calculator Online'), findsOneWidget);
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsOneWidget);
      expect(find.text('+'), findsOneWidget);
      expect(find.text('='), findsOneWidget);
    });

    testWidgets('Button interaction test', (WidgetTester tester) async {
      String displayText = '0';
      
      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) {
            return MaterialApp(
              home: Scaffold(
                body: Column(
                  children: [
                    Text(displayText),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          displayText = '1';
                        });
                      },
                      child: const Text('1'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );

      // Test button press
      await tester.tap(find.text('1'));
      await tester.pump();

      // Verify state change
      expect(find.text('1'), findsOneWidget);
    });

    test('Basic arithmetic test', () {
      // Test basic mathematical operations
      expect(1 + 1, equals(2));
      expect(5 - 3, equals(2));
      expect(4 * 3, equals(12));
      expect(8 / 2, equals(4));
    });

    test('String manipulation test', () {
      // Test string operations that might be used in calculator
      String display = '0';
      
      // Simulate number input
      display = display == '0' ? '1' : '${display}1';
      expect(display, equals('1'));
      
      display = '${display}2';
      expect(display, equals('12'));
      
      // Simulate clear
      display = '0';
      expect(display, equals('0'));
    });
  });
}

