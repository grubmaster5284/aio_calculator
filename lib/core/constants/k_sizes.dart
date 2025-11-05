import 'package:flutter/material.dart';

/// Color constants for the app
class KColors {
  KColors._(); // Private constructor to prevent instantiation

  // Primary colors
  static const Color primary = Color(0xFF6200EE);
  
  // Background colors
  static const Color backgroundDark = Color(0xFF121212);
  static const Color backgroundMedium = Color(0xFF1E1E1E);
  static const Color backgroundLight = Color(0xFF2C2C2C);
  
  // Display colors
  static const Color displayBackground = Color(0xFF000000);
  static const Color displayText = Color(0xFFFFFFFF);
  static const Color displayTextSecondary = Color(0xFFB0B0B0);
  
  // Text colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B0B0);
  
  // Button colors
  static const Color buttonOperator = Color(0xFF3700B3);
  static const Color buttonNumber = Color(0xFF1E1E1E);
  static const Color buttonFunction = Color(0xFF03DAC6);
  static const Color buttonClear = Color(0xFFB00020);
  static const Color buttonEquals = Color(0xFF6200EE);
}

/// Size constants for the app
class KSize {
  KSize._(); // Private constructor to prevent instantiation

  // Margins and padding
  static const double margin1x = 4.0;
  static const double margin2x = 8.0;
  static const double margin3x = 12.0;
  static const double margin4x = 16.0;
  static const double margin6x = 24.0;
  
  // Border radius
  static const double radiusSmall = 4.0;
  static const double radiusDefault = 8.0;
  static const double radiusCircular = 50.0;
  
  // Font sizes
  static const double fontSmall = 12.0;
  static const double fontDefault = 14.0;
  static const double fontMedium = 16.0;
  static const double fontLarge = 18.0;
  static const double fontXLarge = 20.0;
  static const double fontDisplay = 48.0;
  
  // Button sizes
  static const double buttonSpacing = 8.0;
  static const double expandedButtonSpacing = 4.0;
  static const double buttonHeightCalculator = 60.0;
  static const double buttonHeightCalculatorExpanded = 50.0;
  static const double buttonHeightMedium = 48.0;
  
  // Icon sizes
  static const double iconSmall = 16.0;
  static const double iconMedium = 24.0;
  static const double iconLarge = 32.0;
  
  // Display sizes
  static const double calculatorDisplayHeight = 200.0;
  
  // Superscript/subscript spacing
  static const double superscriptPaddingBottom = 8.0;
  static const double subscriptPaddingTop = 8.0;
}

