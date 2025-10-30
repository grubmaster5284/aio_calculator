import 'package:calculator_online/core/result.dart';
import '../entities/graph_config_model.dart';
import '../entities/graph_embed_model.dart';
import '../errors/graphing_error.dart';

/// Repository contract for creating embeddable graph content from domain config.
abstract class IGraphingRepository {
  /// Builds an embeddable graph using the provided configuration.
  /// Returns HTML wrapped in [GraphEmbed] or a [GraphingError] on failure.
  Future<Result<GraphEmbed, GraphingError>> buildEmbed(GraphConfig config);
}