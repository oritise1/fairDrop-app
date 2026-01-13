import 'package:flutter/material.dart';

class FairDropColors {
  // Core Brand Palette
  static const Color primaryOrange = Color(0xFFFF6B00);
  static const Color secondaryGreen = Color(0xFF2A9D8F);
  static const Color deepCharcoal = Color(0xFF264653);
  static const Color creamBackground = Color(0xFFFEFAE0);

  // Semantic Colors
  static const Color errorRed = Color(0xFFD90429);
  static const Color warningAmber = Color(0xFFFFC300);
  static const Color surfaceWhite = Colors.white;
}

class FairDropTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: FairDropColors.primaryOrange,
      scaffoldBackgroundColor: FairDropColors.creamBackground,
      colorScheme: ColorScheme.fromSeed(
        seedColor: FairDropColors.primaryOrange,
        primary: FairDropColors.primaryOrange,
        secondary: FairDropColors.secondaryGreen,
        error: FairDropColors.errorRed,
        surface: FairDropColors.surfaceWhite,
      ),
      // Consistent branding for Cards
      cardTheme: CardThemeData(
        color: FairDropColors.surfaceWhite,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: FairDropColors.primaryOrange,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: FairDropColors.primaryOrange,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}