import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calculator_online/graphing/application/notifier/graphing_notifier.dart';
import 'package:calculator_online/graphing/application/state/graphing_state.dart';
import 'package:calculator_online/graphing/data/constants/graphing_api_keys.dart';
import 'package:calculator_online/graphing/data/sources/graphing_widget_builder.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';

final graphingNotifierProvider =
    StateNotifierProvider<GraphingNotifier, GraphingState>((ref) {
  return GraphingNotifier();
});

/// Data builder provider for graphing HTML
final graphingWidgetBuilderProvider = Provider<GraphingWidgetBuilder>((ref) {
  return const GraphingWidgetBuilder();
});

/// Provides the Desmos API key from environment (.env) with a safe fallback
final desmosApiKeyProvider = Provider<String>((ref) {
  final key = dotenv.env['DESMOS_API_KEY'] ?? GraphingApiKeys.desmosApiKey;
  debugPrint('[graphing] desmosApiKeyProvider resolved key length: ${key.length}');
  return key;
});

/// Exposes the current HTML content for the graphing widget based on app state
final graphingHtmlProvider = Provider<String>((ref) {
  final state = ref.watch(graphingNotifierProvider);
  final builder = ref.watch(graphingWidgetBuilderProvider);
  final apiKey = ref.watch(desmosApiKeyProvider);
  final html = builder.buildDesmosHtml(
    apiKey: apiKey,
    showExpressions: state.showExpressions,
    initialLatex: state.currentExpression,
  );
  debugPrint('[graphing] HTML length: ${html.length}, showExpressions: ${state.showExpressions}, expr: ${state.currentExpression}');
  return html;
});


