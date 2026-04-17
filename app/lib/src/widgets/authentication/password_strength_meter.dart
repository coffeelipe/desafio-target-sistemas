import 'package:flutter/material.dart';

class PasswordStrengthMeter extends StatelessWidget {
  final double strength;
  const PasswordStrengthMeter({super.key, this.strength = 0});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Senha ${_computePasswordStrengthString(strength)}",
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 4),
        TweenAnimationBuilder(
          tween: Tween(end: strength),
          duration: Durations.medium1,
          curve: Curves.easeInOut,
          builder: (context, animatedStrength, _) {
            return LinearProgressIndicator(
              value: animatedStrength,
              backgroundColor: Colors.black12,
              borderRadius: BorderRadius.circular(20),
              minHeight: 6,
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
      return 'muito fraca';
    } else if (strength < 0.4) {
      return 'fraca';
    } else if (strength < 0.7) {
      return 'moderada';
    } else if (strength < 0.9) {
      return 'forte';
    } else {
      return 'muito forte';
    }
  }

  Color _computePasswordStrengthColor(double strength) {
    if (strength <= 0.2) {
      return Colors.red;
    } else if (strength < 0.4) {
      return Colors.orange;
    } else if (strength < 0.7) {
      return Colors.amber;
    } else if (strength < 0.9) {
      return Colors.lightGreen;
    } else {
      return Colors.green;
    }
  }
}
