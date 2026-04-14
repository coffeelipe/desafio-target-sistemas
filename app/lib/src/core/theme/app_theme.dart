import 'package:app/src/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPalette.scaffoldColor,
    textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Poppins'),
  );

  static final darkTheme = ThemeData.dark().copyWith();
}
