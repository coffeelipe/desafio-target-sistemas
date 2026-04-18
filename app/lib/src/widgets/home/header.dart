import 'package:app/src/core/extensions/mediaquery_extension.dart';
import 'package:app/src/core/theme/app_palette.dart';
import 'package:app/src/core/theme/app_typography.dart';
import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String greetingMessage;
  const Header({super.key, required this.greetingMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Biblioteca', style: AppTypography.heading1),
        Text(greetingMessage, style: AppTypography.subtitle),
        Divider(
          height: ResponsiveUtils.spacing(SpacingSize.medium),
          thickness: 2,
          radius: BorderRadius.circular(8),
          endIndent: context.screenWidth * 0.5,
          color: AppPalette.primary,
        ),
      ],
    );
  }
}
