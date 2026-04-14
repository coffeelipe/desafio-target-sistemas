import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
	MediaQueryData get mediaQuery => MediaQuery.of(this);

	Size get screenSize => mediaQuery.size;

	double get screenWidth => screenSize.width;

	double get screenHeight => screenSize.height;

	EdgeInsets get safeInsets => mediaQuery.padding;

	double get safeTop => safeInsets.top;

	double get safeBottom => safeInsets.bottom;

	double get safeLeft => safeInsets.left;

	double get safeRight => safeInsets.right;
}
