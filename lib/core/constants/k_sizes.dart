import 'package:flutter/material.dart';

/// App-wide sizing constants using semantic scaling
class KSize {
  // Margins and Paddings
  static const double margin1x = 4.0;
  static const double margin2x = 8.0;
  static const double margin3x = 12.0;
  static const double margin4x = 16.0;
  static const double margin5x = 20.0;
  static const double margin6x = 24.0;
  static const double margin8x = 32.0;

  // Button Heights
  static const double buttonHeightSmall = 48.0;
  static const double buttonHeightMedium = 56.0;
  static const double buttonHeightLarge = 64.0;
  static const double buttonHeightCalculator = 60.0;
  static const double buttonHeightCalculatorExpanded = 50.0;

  // Border Radius
  static const double radiusSmall = 8.0;
  static const double radiusDefault = 12.0;
  static const double radiusMedium = 16.0;
  static const double radiusLarge = 20.0;
  static const double radiusCircular = 999.0;

  // Icon Sizes
  static const double iconSmall = 18.0;
  static const double iconMedium = 24.0;
  static const double iconLarge = 32.0;

  // Font Sizes
  static const double fontSmall = 12.0;
  static const double fontMedium = 14.0;
  static const double fontDefault = 16.0;
  static const double fontLarge = 18.0;
  static const double fontXLarge = 24.0;
  static const double fontXXLarge = 32.0;
  static const double fontDisplay = 48.0;

  // Typography micro spacings
  static const double superscriptPaddingBottom = 8.0;
  static const double subscriptPaddingTop = 8.0;

  // Specific to Calculator
  static const double calculatorDisplayHeight = 120.0;
  static const double toolbarHeight = 56.0;
  static const double buttonSpacing = 8.0;
  static const double expandedButtonSpacing = 6.0;

  // Toolbar Icon Button
  static const double toolbarIconContainerSize = 32.0;
  static const double toolbarIconDot = 3.0;
  static const double toolbarIconGap = 3.0;
  static const double toolbarIconGridSize = 16.0;
  static const double toolbarIconCornerRadius = 6.0;
}

/// App color scheme
class KColors {
  // Primary Colors
  static const Color primary = Color(0xFFFF6B35);  // Orange
  static const Color primaryDark = Color(0xFFE55A2B);
  static const Color primaryLight = Color(0xFFFF8C5C);

  // Background Colors
  static const Color backgroundDark = Color(0xFF1C1C1C);
  static const Color backgroundMedium = Color(0xFF2A2A2A);
  static const Color backgroundLight = Color(0xFF3A3A3A);

  // Button Colors
  static const Color buttonNumber = Color(0xFF3A3A3A);
  static const Color buttonOperator = Color(0xFFFF6B35);
  static const Color buttonFunction = Color(0xFF505050);
  static const Color buttonClear = Color(0xFF505050);

  // Text Colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B0B0);
  static const Color textOrange = Color(0xFFFF6B35);

  // Display Colors
  static const Color displayBackground = Color(0xFF1C1C1C);
  static const Color displayText = Color(0xFFFFFFFF);
  static const Color displayTextSecondary = Color(0xFF808080);
}
