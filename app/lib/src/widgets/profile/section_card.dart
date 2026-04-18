import 'package:app/src/core/theme/app_typography.dart';
import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Widget child;

  const SectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: EdgeInsets.all(ResponsiveUtils.spacing(SpacingSize.small)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: iconColor),
                const SizedBox(width: 12),
                Text(title, style: AppTypography.heading2),
              ],
            ),
            SizedBox(height: ResponsiveUtils.spacing(SpacingSize.small)),
            child,
          ],
        ),
      ),
    );
  }
}
