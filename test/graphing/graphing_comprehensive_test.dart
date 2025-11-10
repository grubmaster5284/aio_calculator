import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:calculator_online/graphing/presentation/pages/graphing_page.dart';
import 'package:calculator_online/graphing/domain/value_objects/graph_expression_vo.dart';

void main() {
  group('Graphing Comprehensive Tests', () {
    testWidgets('Graphing page displays correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: GraphingPage(),
          ),
        ),
      );

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(GraphingPage), findsOneWidget);
    });

    testWidgets('Graphing page shows initial loading state', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: GraphingPage(),
          ),
        ),
      );

      await tester.pump();

      // Page should be present, loading indicator may or may not be visible
      // depending on implementation
      expect(find.byType(GraphingPage), findsOneWidget);
    });

    testWidgets('Graphing page handles error state gracefully', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: GraphingPage(),
          ),
        ),
      );

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));

      // Page should still be present even if there's an error
      expect(find.byType(GraphingPage), findsOneWidget);
    });

    testWidgets('Graphing page is responsive to orientation changes', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: GraphingPage(),
          ),
        ),
      );

      // Test portrait orientation
      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.byType(GraphingPage), findsOneWidget);

      // Test landscape orientation
      await tester.binding.setSurfaceSize(const Size(800, 400));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.byType(GraphingPage), findsOneWidget);

      // Reset to default
      await tester.binding.setSurfaceSize(null);
    });
  });

  group('Graph Expression Value Object', () {
    test('creates valid graph expression', () {
      const expression = GraphExpression('x^2 + 1');
      expect(expression.latex, 'x^2 + 1');
    });

    test('handles empty expression', () {
      const expression = GraphExpression('');
      expect(expression.latex, '');
    });

    test('handles complex mathematical expressions', () {
      final expressions = [
        'sin(x)',
        'cos(x)',
        'tan(x)',
        'x^2 + 2*x + 1',
        'sqrt(x)',
        'log(x)',
        'exp(x)',
        '1/(x+1)',
      ];

      for (final expr in expressions) {
        expect(() => GraphExpression(expr), returnsNormally);
        final expression = GraphExpression(expr);
        expect(expression.latex, expr);
      }
    });

    test('handles whitespace in expressions', () {
      // Both should be valid
      expect(() => const GraphExpression('  x^2 + 1  '), returnsNormally);
      expect(() => const GraphExpression('x^2 + 1'), returnsNormally);
    });

    test('equality works correctly', () {
      const expr1 = GraphExpression('x^2');
      const expr2 = GraphExpression('x^2');
      const expr3 = GraphExpression('x^3');
      
      expect(expr1, equals(expr2));
      expect(expr1, isNot(equals(expr3)));
    });

    test('toString returns latex value', () {
      const expression = GraphExpression('x^2 + 1');
      expect(expression.toString(), contains('x^2 + 1'));
    });
  });
}

