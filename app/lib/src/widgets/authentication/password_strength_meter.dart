import 'package:app/src/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class PasswordStrengthMeter extends StatelessWidget {
  final double strength;
  const PasswordStrengthMeter({super.key, this.strength = 0});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Força da senha: ${_computePasswordStrengthString(strength)}'),
        const SizedBox(height: 4),
        TweenAnimationBuilder(
          tween: Tween(end: strength),
          duration: Durations.medium1,
          curve: Curves.easeInOut,
          builder: (context, animatedStrength, _) {
            return LinearProgressIndicator(
              value: animatedStrength,
              backgroundColor: AppPalette.scaffoldColor,
              valueColor: AlwaysStoppedAnimation(
                _computePasswordStrengthColor(animatedStrength),
              ),
            );
          },
        ),
      ],
    );
  }

  String _computePasswordStrengthString(double strength) {
    if (strength <= 0.2) {
      return 'Muito fraca';
    } else if (strength < 0.4) {
      return 'Fraca';
    } else if (strength < 0.7) {
      return 'Média';
    } else if (strength < 0.9) {
      return 'Forte';
    } else {
      return 'Muito forte';
    }
  }

  Color _computePasswordStrengthColor(double strength) {
    if (strength <= 0.2) {
      return Colors.red;
    } else if (strength < 0.4) {
      return Colors.orange;
    } else if (strength < 0.7) {
      return Colors.yellow;
    } else if (strength < 0.9) {
      return Colors.lightGreen;
    } else {
      return Colors.green;
    }
  }
}
