     import 'package:calculator_online/core/result.dart';
import 'package:calculator_online/graphing/data/sources/graphing_widget_builder.dart';
import 'package:calculator_online/graphing/domain/entities/graph_config_model.dart';
import 'package:calculator_online/graphing/domain/entities/graph_embed_model.dart';
import 'package:calculator_online/graphing/domain/errors/graphing_error.dart';
import 'package:calculator_online/graphing/domain/repositories/i_graphing_repository.dart';

/// Concrete repository that builds embeddable HTML for graphing providers.
class GraphingRepositoryImpl implements IGraphingRepository {
  final GraphingWidgetBuilder _builder;
  final String _desmosApiKey;

  const GraphingRepositoryImpl({
    required GraphingWidgetBuilder builder,
    required String desmosApiKey,
  })  : _builder = builder,
        _desmosApiKey = desmosApiKey;

  @override
  Future<Result<GraphEmbed, GraphingError>> buildEmbed(GraphConfig config) async {
    try {
      final html = _builder.buildDesmosHtml(
        apiKey: _desmosApiKey,
        showExpressions: config.showExpressionsPanel,
        initialLatex: config.expression.latex,
      );
      return Result.success(GraphEmbed(html: html));
    } catch (e) {
      return Result.failure(UnknownGraphingError(e.toString()));
    }
  }
}


