import 'package:calculator_online/core/result.dart';
import 'package:calculator_online/graphing/domain/entities/graph_config_model.dart';
import 'package:calculator_online/graphing/domain/entities/graph_embed_model.dart';
import 'package:calculator_online/graphing/domain/errors/graphing_error.dart';
import 'package:calculator_online/graphing/domain/repositories/i_graphing_repository.dart';
import 'package:calculator_online/graphing/domain/value_objects/graph_expression_vo.dart';

/// Use case for creating graphs.
/// This is the only use case needed - it orchestrates the repository call
/// and lets the external service handle validation and error processing.
class CreateGraphUseCase {
  final IGraphingRepository repository;

  const CreateGraphUseCase(this.repository);

  /// Creates a graph from user input.
  /// The external service handles all validation and error processing.
  Future<Result<GraphEmbed, GraphingError>> call({
    required String expression,
    bool showExpressionsPanel = true,
  }) async {
    final config = GraphConfig(
      expression: GraphExpression(expression),
      showExpressionsPanel: showExpressionsPanel,
    );

    // Let the repository and external service handle everything
    return repository.buildEmbed(config);
  }
}
