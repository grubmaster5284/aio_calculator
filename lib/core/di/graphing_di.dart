import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:calculator_online/graphing/data/constants/graphing_api_keys.dart';
import 'package:calculator_online/graphing/data/sources/graphing_widget_builder.dart';
import 'package:calculator_online/graphing/data/repositories/graphing_repository_impl.dart';
import 'package:calculator_online/graphing/domain/repositories/i_graphing_repository.dart';
import 'package:calculator_online/core/logging/logger.dart';

/// Dependency injection container for the graphing module
/// This isolates data layer dependencies from the application layer
class GraphingDI {
  /// Provides the Desmos API key from environment (.env) with a safe fallback
  static final desmosApiKeyProvider = Provider<String>((ref) {
    final key = dotenv.env['DESMOS_API_KEY'] ?? GraphingApiKeys.desmosApiKey;
    AppLogger.graphing('desmosApiKeyProvider resolved key length: ${key.length}');
    return key;
  });

  /// Data builder provider for graphing HTML
  static final graphingWidgetBuilderProvider = Provider<GraphingWidgetBuilder>((ref) {
    return const GraphingWidgetBuilder();
  });

  /// Repository provider adhering to domain contract
  static final graphingRepositoryProvider = Provider<IGraphingRepository>((ref) {
    return GraphingRepositoryImpl(
      builder: ref.watch(graphingWidgetBuilderProvider),
      desmosApiKey: ref.watch(desmosApiKeyProvider),
    );
  });
}

