import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/k_sizes.dart';
import '../../../core/widgets/top_nav_bar.dart';
import '../widgets/webview_embed_widget.dart';
import 'package:calculator_online/graphing/application/providers/graphing_providers.dart';

/// Graphing feature main page (presentation-only, dummy data)
/// Hosts an embeddable WebView container via a modular `WebViewEmbedWidget`.
class GraphingPage extends ConsumerWidget {
  const GraphingPage({super.key});

  /// Optional route name to be wired at app level later.
  static const String routeName = '/graphing';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Set system UI overlay style for dark theme (consistent with calculator page)
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: KColors.backgroundDark,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    final embedAsync = ref.watch(graphingEmbedProvider);

    return Scaffold(
      backgroundColor: KColors.backgroundDark,
      body: SafeArea(
        child: Column(
          children: [
            const TopNavBar(isCalculatorScreen: false, isGraphingScreen: true),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isLandscape = constraints.maxWidth > constraints.maxHeight;
                  
                  return Padding(
                    padding: EdgeInsets.all(isLandscape ? KSize.margin2x : KSize.margin4x),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(KSize.radiusDefault),
                      child: embedAsync.when(
                        data: (embed) => WebViewEmbedWidget(htmlContent: embed.html),
                        loading: () => const Center(child: CircularProgressIndicator()),
                        error: (e, _) => Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Failed to load graph'),
                              const SizedBox(height: 8),
                              Text('$e', style: const TextStyle(fontSize: 12)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


