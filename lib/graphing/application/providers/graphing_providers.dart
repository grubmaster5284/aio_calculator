import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calculator_online/graphing/application/state/graphing_notifier.dart';
import 'package:calculator_online/graphing/application/state/graphing_state.dart';
import 'package:calculator_online/graphing/domain/entities/graph_config_model.dart';
import 'package:calculator_online/graphing/domain/entities/graph_embed_model.dart';
import 'package:calculator_online/graphing/domain/value_objects/graph_expression_vo.dart';
import 'package:calculator_online/core/di/graphing_di.dart';
import 'package:calculator_online/core/logging/logger.dart';

final graphingNotifierProvider =
    StateNotifierProvider<GraphingNotifier, GraphingState>((ref) {
  return GraphingNotifier();
});

/// Data builder provider for graphing HTML
final graphingWidgetBuilderProvider = GraphingDI.graphingWidgetBuilderProvider;

/// Provides the Desmos API key from environment (.env) with a safe fallback
final desmosApiKeyProvider = GraphingDI.desmosApiKeyProvider;

/// Repository provider adhering to domain contract
final graphingRepositoryProvider = GraphingDI.graphingRepositoryProvider;

/// Exposes the current embed for the graphing widget based on app state
final graphingEmbedProvider = FutureProvider<GraphEmbed>((ref) async {
  final state = ref.watch(graphingNotifierProvider);
  final repository = ref.watch(graphingRepositoryProvider);

  final config = GraphConfig(
    expression: GraphExpression(state.currentExpression),
    showExpressionsPanel: state.showExpressions,
  );

  final result = await repository.buildEmbed(config);
  if (result.isSuccess) {
    final embed = result.requireValue;
    AppLogger.graphing('Embed HTML length: ${embed.html.length}');
    return embed;
  }

  // Surface error to UI via async error
  throw result.requireError;
});


