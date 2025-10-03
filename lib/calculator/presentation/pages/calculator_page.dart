import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/k_sizes.dart';
import '../../../core/widgets/top_nav_bar.dart';
import '../widgets/calculator_display.dart';
import '../widgets/calculator_keypad.dart';
import '../widgets/calculator_history.dart';
import '../controllers/calculator_ui_provider.dart';
import 'package:calculator_online/calculator/application/providers/calculation_providers.dart';

class CalculatorPage extends ConsumerWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Set system UI overlay style for dark theme
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: KColors.backgroundDark,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    final isHistoryOnly = ref.watch(isHistoryOnlyModeProvider);

    return Scaffold(
      backgroundColor: KColors.backgroundDark,
      body: SafeArea(
        child: isHistoryOnly
            ? Column(
                children: [
                  TopNavBar(
                    isCalculatorScreen: true,
                    showHistoryButton: true,
                    onHistoryTap: () {
                      ref.read(isHistoryOnlyModeProvider.notifier).state = false;
                    },
                  ),
                  // Full history with Clear All button
                  Expanded(
                    child: Stack(
                      children: [
                        const CalculatorHistory(),
                        Positioned(
                          right: 8,
                          top: 8,
                          child: TextButton(
                            onPressed: () {
                              ref.read(calculatorUiStateNotifierProvider.notifier).clearHistory();
                              // Also perform AC to reset calculator state
                              ref.read(calculatorUiStateNotifierProvider.notifier).press('AC');
                            },
                            child: const Text('Clear all'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : LayoutBuilder(
                builder: (context, constraints) {
                  final isLandscape = constraints.maxWidth > constraints.maxHeight;
                  
                  if (isLandscape) {
                    // Landscape layout: side-by-side
                    return Row(
                      children: [
                        // Left side: Display and History
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              TopNavBar(
                                isCalculatorScreen: true,
                                showHistoryButton: true,
                                onHistoryTap: () {
                                  final current = ref.read(isHistoryOnlyModeProvider);
                                  ref.read(isHistoryOnlyModeProvider.notifier).state = !current;
                                },
                              ),
                              const CalculatorDisplay(),
                              Expanded(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        color: KColors.backgroundMedium,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  child: const CalculatorHistory(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Right side: Keypad
                        Expanded(
                          flex: 3,
                          child: const CalculatorKeypad(),
                        ),
                      ],
                    );
                  } else {
                    // Portrait layout: vertical stack
                    return Column(
                      children: [
                        // Unified Navigation Bar
                        TopNavBar(
                          isCalculatorScreen: true,
                          showHistoryButton: true,
                          onHistoryTap: () {
                            final current = ref.read(isHistoryOnlyModeProvider);
                            ref.read(isHistoryOnlyModeProvider.notifier).state = !current;
                          },
                        ),
                        // Display at the top of operations
                        const CalculatorDisplay(),
                        // Preview history (max 3 rows) with flexible height
                        const Flexible(
                          flex: 1,
                          child: CalculatorHistory(),
                        ),
                        // Divider and keypad at bottom
                        Container(height: 1, color: KColors.backgroundMedium),
                        const CalculatorKeypad(),
                      ],
                    );
                  }
                },
              ),
      ),
    );
  }
}
