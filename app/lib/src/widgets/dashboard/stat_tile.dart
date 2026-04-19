import 'package:app/src/core/theme/app_palette.dart';
import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class StatTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color accentColor;

  const StatTile({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    final labelColor = AppPalette.caption.withValues(alpha: 0.8);

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 150),
      child: Container(
        padding: EdgeInsets.all(ResponsiveUtils.spacing(SpacingSize.small)),
        decoration: BoxDecoration(
          color: AppPalette.scaffoldColor.withValues(alpha: 0.55),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppPalette.caption.withValues(alpha: 0.12),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: accentColor, size: 18),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppPalette.blackShade,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    label,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: labelColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
