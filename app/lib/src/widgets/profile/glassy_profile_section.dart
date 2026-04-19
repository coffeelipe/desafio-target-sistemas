import 'package:app/src/core/theme/app_palette.dart';
import 'package:app/src/core/theme/app_typography.dart';
import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class GlassyProfileSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Widget child;

  const GlassyProfileSection({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final tileColor = Colors.white70;
    final tileShadowColor = AppPalette.blackShade.withValues(alpha: 0.06);

    final iconGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        iconColor.withValues(alpha: 0.30),
        iconColor.withValues(alpha: 0.10),
      ],
      stops: const [0.0, 1.0],
    );

    return Container(
      padding: EdgeInsets.all(ResponsiveUtils.spacing(SpacingSize.small)),
      decoration: BoxDecoration(
        color: tileColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: tileShadowColor,
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  gradient: iconGradient,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: iconColor.withValues(alpha: 0.18),
                      blurRadius: 14,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 6,
                      left: 7,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: AppPalette.scaffoldColor.withValues(
                            alpha: 0.5,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Icon(icon, color: iconColor, size: 18),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(child: Text(title, style: AppTypography.heading2)),
            ],
          ),
          SizedBox(height: ResponsiveUtils.spacing(SpacingSize.small)),
          child,
        ],
      ),
    );
  }
}
