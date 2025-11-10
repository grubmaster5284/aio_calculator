import 'package:freezed_annotation/freezed_annotation.dart';

part 'graph_expression_vo.freezed.dart';

/// Strongly-typed LaTeX expression for graphing.
@freezed
abstract class GraphExpression with _$GraphExpression {
  const factory GraphExpression(String latex) = _GraphExpression;
}


