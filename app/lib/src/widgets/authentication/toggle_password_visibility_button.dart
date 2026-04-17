import 'package:app/src/core/theme/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class TogglePasswordVisibilityButton extends StatelessWidget {
  final bool isPasswordObscured;
  final VoidCallback onPressed;
  const TogglePasswordVisibilityButton({
    super.key,
    required this.isPasswordObscured,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Icon icon = Icon(
      isPasswordObscured ? RemixIcons.eye_close_fill : RemixIcons.eye_2_fill,
      size: 18,
      color: AppPalette.blackShade,
    );

    return IconButton(onPressed: onPressed, icon: icon);
  }
}
