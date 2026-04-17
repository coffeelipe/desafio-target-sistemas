import 'package:app/src/stores/authentication/registration_form_state.dart';
import 'package:app/src/widgets/authentication/password_assistant.dart';
import 'package:app/src/widgets/authentication/toggle_password_visibility_button.dart';
import 'package:app/src/widgets/global/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssistedPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool showAssistant;
  final bool isObscured;
  final double passwordStrength;
  final void Function(String)? onChanged;
  final String? Function(String? value)? validator;

  const AssistedPasswordField({
    super.key,
    required this.controller,
    this.focusNode,
    this.showAssistant = false,
    required this.isObscured,
    required this.passwordStrength,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final registrationFormStateProvider = Provider.of<RegistrationFormState>(
      context,
    );
    return Column(
      children: [
        AnimatedSize(
          duration: Durations.short3,
          child: showAssistant
              ? PasswordAssistant(passwordStrength: passwordStrength)
              : const SizedBox(width: double.infinity, height: 0),
        ),
        const SizedBox(height: 8),
        CustomTextFormField(
          controller: controller,
          focusNode: focusNode,
          label: registrationFormStateProvider.isPasswordFieldFocused
              ? null
              : 'Senha*',
          hintText: 'Senha',
          obscureText: isObscured,
          suffixIcon: TogglePasswordVisibilityButton(
            isPasswordObscured: isObscured,
            onPressed: registrationFormStateProvider.togglePasswordVisibility,
          ),
          keyboardType: TextInputType.visiblePassword,
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }
}
