import 'package:app/src/core/theme/app_typography.dart';
import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:app/src/widgets/global/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final IconData icon;
  final String message;
  final String ctaText;
  final VoidCallback onCtaPressed;

  const EmptyState({
    super.key,
    this.icon = Icons.inbox_rounded,
    required this.message,
    required this.ctaText,
    required this.onCtaPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 560),
        child: Padding(
          padding: EdgeInsets.all(ResponsiveUtils.spacing(SpacingSize.medium)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 48, color: Theme.of(context).hintColor),
              SizedBox(height: ResponsiveUtils.spacing(SpacingSize.small)),
              Text(
                message,
                style: AppTypography.heading2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ResponsiveUtils.spacing(SpacingSize.medium)),
              GradientButton(
                onPressed: onCtaPressed,
                child: Text(
                  ctaText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
