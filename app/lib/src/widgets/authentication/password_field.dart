import 'package:app/src/widgets/authentication/toggle_password_visibility_button.dart';
import 'package:app/src/widgets/global/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final bool obscureText;
  final VoidCallback onTogglePressed;
  final String? Function(String? value)? validator;
  const PasswordField({
    super.key,
    required this.controller,
    this.label = 'Senha',
    this.hintText = 'Senha',
    this.obscureText = true,
    required this.onTogglePressed,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      label: label,
      hintText: hintText,
      obscureText: obscureText,
      suffixIcon: TogglePasswordVisibilityButton(
        isPasswordObscured: obscureText,
        onPressed: onTogglePressed,
      ),
      keyboardType: TextInputType.visiblePassword,
      validator: validator,
    );
  }
}
