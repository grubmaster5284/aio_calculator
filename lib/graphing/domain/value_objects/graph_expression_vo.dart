import 'package:freezed_annotation/freezed_annotation.dart';

part 'graph_expression_vo.freezed.dart';

/// Strongly-typed LaTeX expression for graphing.
@freezed
abstract class GraphExpression with _$GraphExpression {
  @Assert("latex.trim().isNotEmpty || latex.isEmpty", "Graph expression cannot be only whitespace")
  factory GraphExpression(String latex) = _GraphExpression;
}


