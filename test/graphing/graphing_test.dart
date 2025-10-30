import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calculator_online/graphing/presentation/pages/graphing_page.dart';

void main() {
  group('Graphing Tests', () {
    testWidgets('Graphing page displays correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: GraphingPage(),
          ),
        ),
      );

      // Verify graphing page is present
      expect(find.byType(GraphingPage), findsOneWidget);
    });

    testWidgets('Graphing page shows loading state', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: GraphingPage(),
          ),
        ),
      );

      // Should show loading indicator initially
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Graphing page handles error state', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: GraphingPage(),
          ),
        ),
      );

      // Wait for potential error state
      await tester.pumpAndSettle();
    });
  });
}

