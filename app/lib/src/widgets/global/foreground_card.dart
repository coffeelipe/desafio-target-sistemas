import 'package:app/src/core/extensions/mediaquery_extension.dart';
import 'package:flutter/material.dart';

class ForegroundCard extends Card {
  const ForegroundCard({
    super.key,
    super.child,
    super.color,
    super.elevation,
    super.shadowColor,
    super.surfaceTintColor,
    super.borderOnForeground = true,
    super.clipBehavior = Clip.none,
    super.margin = const EdgeInsets.all(8.0),
    super.semanticContainer = true,
    super.shape,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: context.screenHeight * 0.85,
        maxWidth: context.screenWidth * 0.9,
        minWidth: context.screenWidth * 0.9,
      ),
      child: Card(
        borderOnForeground: borderOnForeground,
        clipBehavior: clipBehavior,
        color: const Color(0xFFFFFFFF),
        elevation: 0,
        margin: margin,
        semanticContainer: semanticContainer,
        shadowColor: shadowColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        surfaceTintColor: surfaceTintColor,
        child: child,
      ),
    );
  }
}
