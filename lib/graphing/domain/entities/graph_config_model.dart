import '../value_objects/graph_expression_vo.dart';

/// Domain configuration for rendering a graph embed.
class GraphConfig {
  final GraphExpression expression;
  final bool showExpressionsPanel;

  const GraphConfig({
    required this.expression,
    required this.showExpressionsPanel,
  });

  GraphConfig copyWith({GraphExpression? expression, bool? showExpressionsPanel}) {
    return GraphConfig(
      expression: expression ?? this.expression,
      showExpressionsPanel: showExpressionsPanel ?? this.showExpressionsPanel,
    );
  }
}


