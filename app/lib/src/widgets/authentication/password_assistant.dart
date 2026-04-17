import 'package:app/src/widgets/authentication/password_strength_meter.dart';
import 'package:flutter/material.dart';

class PasswordAssistant extends StatelessWidget {
  final double passwordStrength;
  const PasswordAssistant({super.key, required this.passwordStrength});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(),
      child: Card(
        child: Column(
          children: [PasswordStrengthMeter(strength: passwordStrength)],
        ),
      ),
    );
  }
}
