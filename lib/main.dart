import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'calculator/presentation/pages/calculator_page.dart';
import 'converters/presentation/pages/converter_modes_page.dart';
import 'core/constants/k_sizes.dart';
import 'graphing/presentation/pages/graphing_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  // Debug logging to verify .env is loaded
  final hasKey = dotenv.env['DESMOS_API_KEY'] != null && dotenv.env['DESMOS_API_KEY']!.isNotEmpty;
  debugPrint('[dotenv] loaded: DESMOS_API_KEY present: $hasKey');
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
        '/graphing': (context) => const GraphingPage(),
      },
    );
  }
}


