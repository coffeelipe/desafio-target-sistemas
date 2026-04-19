import 'package:app/src/core/extensions/mediaquery_extension.dart';
import 'package:app/src/core/theme/app_palette.dart';
import 'package:app/src/core/theme/app_typography.dart';
import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final String subtitle;
  const Header({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTypography.heading1),
        Text(
          subtitle,
          style: TextStyle(
            color: AppPalette.caption.withValues(alpha: 0.8),
            fontSize: 16,
          ),
        ),
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
