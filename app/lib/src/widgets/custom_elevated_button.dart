import 'package:app/src/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  const GradientButton({super.key, this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: const LinearGradient(
          colors: [AppPalette.primaryVariant, AppPalette.primary],
          stops: [0.0, 0.5],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          splashFactory: InkRipple.splashFactory,
          borderRadius: BorderRadius.circular(20),
          child: Center(child: child),
        ),
      ),
    );
  }
}
