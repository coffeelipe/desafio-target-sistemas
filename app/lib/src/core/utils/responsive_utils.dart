import 'package:flutter/material.dart';

class ResponsiveUtils {
  MediaQueryData mediaQuery(BuildContext context) => MediaQuery.of(context);

  // breakpoint for tablet layout
  bool isTablet(BuildContext context) => mediaQuery(context).size.width >= 600;

  static double spacing(SpacingSize size) {
    switch (size) {
      case SpacingSize.small:
        return 16.0;
      case SpacingSize.medium:
        return 24.0;
      case SpacingSize.large:
        return 32.0;
      case SpacingSize.extraLarge:
        return 48.0;
    }
  }
}

enum SpacingSize { small, medium, large, extraLarge }
