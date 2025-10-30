import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'calculator/presentation/pages/calculator_page.dart';
import 'converters/presentation/pages/converter_modes_page.dart';
import 'core/constants/k_sizes.dart';
import 'graphing/presentation/pages/graphing_page.dart';
import 'currency_conversion/presentation/pages/currency_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'currency_conversion/application/providers/currency_providers.dart';
import 'core/logging/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Load .env file
  try {
    await dotenv.load(fileName: '.env');
    AppLogger.init('.env loaded successfully');
    AppLogger.init('CURRENCY_SERVICE_PROVIDER: ${dotenv.env['CURRENCY_SERVICE_PROVIDER']}');
  } catch (e) {
    AppLogger.error('Error loading .env: $e');
    // ignore if .env is missing; app can still run with defaults
  }
  // Initialize SharedPreferences before starting the app
  final sharedPrefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPrefs),
      ],
      child: const CalculatorApp(),
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
        '/converter/currency': (context) => const CurrencyPage(),
      },
    );
  }
}


