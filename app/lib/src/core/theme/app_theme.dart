import 'package:app/src/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const OutlineInputBorder _inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide.none,
  );
  static const OutlineInputBorder _errorInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: AppPalette.primary),
  );

  static final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPalette.scaffoldColor,
    textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Poppins'),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppPalette.primaryVariant,
      selectionColor: AppPalette.primaryVariant.withValues(alpha: 0.5),
      selectionHandleColor: AppPalette.primaryVariant,
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: _inputBorder,
      enabledBorder: _inputBorder,
      errorBorder: _errorInputBorder,
      focusedErrorBorder: _inputBorder,
      filled: true,
      fillColor: AppPalette.scaffoldColor,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintStyle: TextStyle(color: AppPalette.caption.withValues(alpha: 0.5)),
    ),
  );

  static final darkTheme = ThemeData.dark().copyWith();
}
