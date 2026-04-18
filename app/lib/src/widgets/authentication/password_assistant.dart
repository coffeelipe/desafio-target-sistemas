import 'package:app/src/core/extensions/mediaquery_extension.dart';
import 'package:app/src/core/theme/app_palette.dart';
import 'package:app/src/stores/authentication/registration_form_state.dart';
import 'package:app/src/widgets/authentication/password_strength_meter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class PasswordAssistant extends StatefulWidget {
  final double passwordStrength;
  const PasswordAssistant({super.key, required this.passwordStrength});

  @override
  State<PasswordAssistant> createState() => _PasswordAssistantState();
}

class _PasswordAssistantState extends State<PasswordAssistant> {
  @override
  Widget build(BuildContext context) {
    final registrationFormStateProvider = Provider.of<RegistrationFormState>(
      context,
    );

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: context.screenHeight * 0.1,
        maxWidth: context.screenWidth * 0.9,
      ),
      child: Observer(
        builder: (context) {
          return Card(
            color: AppPalette.scaffoldColor,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  PasswordStrengthMeter(strength: widget.passwordStrength),
                  const SizedBox(height: 8),
                  _buildInfoText(
                    context,
                    registrationFormStateProvider.isPasswordOverSixCharacters,
                    'Mínimo 6 caracteres',
                  ),
                  _buildInfoText(
                    context,
                    registrationFormStateProvider
                        .passwordContainsOnlyValidCharacters,
                    'Contém apenas letras, números e caracteres especiais !@#\$%^&*',
                  ),
                  _buildInfoText(
                    context,
                    registrationFormStateProvider.passwordContainsNoSpaces,
                    'Não contém espaços',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Row _buildInfoText(
    BuildContext context,
    bool passedRequirement,
    String requirementDescription,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          passedRequirement ? Icons.check_circle : Icons.cancel,
          size: 16,
          color: passedRequirement ? Colors.green : AppPalette.primary,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            requirementDescription,
            style: TextStyle(
              fontSize: 12,
              color: passedRequirement ? Colors.green : AppPalette.primary,
            ),
          ),
        ),
      ],
    );
  }
}
