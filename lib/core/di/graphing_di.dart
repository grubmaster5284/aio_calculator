import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:calculator_online/graphing/data/sources/graphing_widget_builder.dart';
import 'package:calculator_online/graphing/data/repositories/graphing_repository_impl.dart';
import 'package:calculator_online/graphing/domain/repositories/i_graphing_repository.dart';
import 'package:calculator_online/graphing/data/constants/graphing_api_keys.dart';

/// Dependency injection container for graphing feature
class GraphingDI {
  GraphingDI._(); // Private constructor

  /// Graphing widget builder provider
  static final graphingWidgetBuilderProvider = Provider<GraphingWidgetBuilder>((ref) {
    return const GraphingWidgetBuilder();
  });

  /// Desmos API key provider from environment
  static final desmosApiKeyProvider = Provider<String>((ref) {
    // Try to get from .env file, fallback to placeholder
    final apiKey = dotenv.env['DESMOS_API_KEY'] ?? GraphingApiKeys.desmosApiKey;
    return apiKey;
  });

  /// Graphing repository provider
  static final graphingRepositoryProvider = Provider<IGraphingRepository>((ref) {
    final builder = ref.watch(graphingWidgetBuilderProvider);
    final apiKey = ref.watch(desmosApiKeyProvider);
    return GraphingRepositoryImpl(
      builder: builder,
      desmosApiKey: apiKey,
    );
  });
}

