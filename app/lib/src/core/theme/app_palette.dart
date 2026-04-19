import 'package:flutter/material.dart';

class AppPalette {
  AppPalette._();

  static const scaffoldColor = Color(0xFFFEF5E6);
  static const primary = Color(0xFFD84214);
  static const primaryVariant = Color(0xFFAD362D);
  static const secondary = Color(0xFFBA5C41);
  static const caption = Color(0xFF5E1703);
  static const tertiary = Color(0xFF8A4A9D);
  static const blackShade = Color(0xFF343026);

  static final edgeToEdgeGradient = LinearGradient(
    colors: [scaffoldColor, scaffoldColor.withAlpha(0)],
    stops: const [0.2, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
