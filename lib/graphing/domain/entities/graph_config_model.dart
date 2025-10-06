import 'package:freezed_annotation/freezed_annotation.dart';
import '../value_objects/graph_expression_vo.dart';

part 'graph_config_model.freezed.dart';

/// Domain configuration for rendering a graph embed.
@freezed
abstract class GraphConfig with _$GraphConfig {
  const factory GraphConfig({
    required GraphExpression expression,
    required bool showExpressionsPanel,
  }) = _GraphConfig;
}


