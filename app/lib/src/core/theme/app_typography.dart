import 'package:app/src/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class AppTypography {
  static const TextStyle heading1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle heading2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle bodyText = TextStyle(fontSize: 16);
  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    color: AppPalette.primaryVariant,
  );
  static const TextStyle caption = TextStyle(fontSize: 12, color: Colors.grey);
}
