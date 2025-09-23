import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'calculator/presentation/pages/calculator_page.dart';
import 'converters/presentation/pages/converter_modes_page.dart';
import 'core/constants/k_sizes.dart';

void main() {
  runApp(
    const ProviderScope(
      child: CalculatorApp(),
    ),
  );
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator Online',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: KColors.primary,
        scaffoldBackgroundColor: KColors.backgroundDark,
        colorScheme: const ColorScheme.dark(
          primary: KColors.primary,
          secondary: KColors.primary,
          surface: KColors.backgroundMedium,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const CalculatorPage(),
        '/converter': (context) => const ConverterModesPage(),
      },
    );
  }
}


