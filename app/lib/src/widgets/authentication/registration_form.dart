import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:app/src/core/utils/validation_utils.dart';
import 'package:app/src/stores/authentication/password_assistant_state.dart';
import 'package:app/src/stores/authentication/registration_form_state.dart';
import 'package:app/src/widgets/authentication/assisted_password_field.dart';
import 'package:app/src/widgets/global/custom_elevated_button.dart';
import 'package:app/src/widgets/global/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:remixicon/remixicon.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final PasswordAssistantState _passwordAssistantState =
      PasswordAssistantState();

  @override
  Widget build(BuildContext context) {
    final registrationFormState = Provider.of<RegistrationFormState>(context);
    return Observer(
      builder: (_) {
        bool isPasswordObscured = registrationFormState.isPasswordObscured;
        bool isPasswordFieldFocused =
            registrationFormState.isPasswordFieldFocused;
        IconData passwordVisibilityIcon = isPasswordObscured
            ? RemixIcons.eye_close_fill
            : RemixIcons.eye_2_fill;

        return Form(
          key: registrationFormState.registrationFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: registrationFormState.usernameController,
                label: 'Usuário',
                hintText: 'seu_usuário',
                maxLength: 16,
                validator: (value) => registrationFormState.validateField(
                  value,
                  FieldType.username,
                ),
              ),
              SizedBox(height: ResponsiveUtils.spacing(SpacingSize.small)),
              CustomTextFormField(
                controller: registrationFormState.emailController,
                label: 'Email',
                hintText: 'email@exemplo.com',
              ),
              SizedBox(height: ResponsiveUtils.spacing(SpacingSize.small)),
              AssistedPasswordField(
                controller: registrationFormState.passwordController,
                focusNode: registrationFormState.passwordFocusNode,
                showAssistant: isPasswordFieldFocused,
                isObscured: isPasswordObscured,
                passwordStrength: _passwordAssistantState.passwordStrength,
                onChanged: (value) {
                  _passwordAssistantState.evaluatePasswordStrength(
                    value,
                    registrationFormState.usernameController.text,
                    registrationFormState.emailController.text,
                  );
                  registrationFormState.setPasswordValidationFlags(value);
                },
                suffixIcon: _buildToggleVisibilityButton(
                  passwordVisibilityIcon,
                  registrationFormState,
                ),
                validator: (value) => registrationFormState.validateField(
                  value,
                  FieldType.password,
                ),
              ),
              SizedBox(height: ResponsiveUtils.spacing(SpacingSize.small)),
              CustomTextFormField(
                controller:
                    registrationFormState.passwordConfirmationController,
                label: 'Confirmar Senha',
                hintText: 'Confirmar Senha',
                obscureText: isPasswordObscured,
                suffixIcon: _buildToggleVisibilityButton(
                  passwordVisibilityIcon,
                  registrationFormState,
                ),
              ),
              SizedBox(height: ResponsiveUtils.spacing(SpacingSize.large)),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveUtils.spacing(SpacingSize.small),
                ),
                child: GradientButton(
                  onPressed: () {
                    if (registrationFormState.registrationFormKey.currentState!
                        .validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('FORMULARIO VALIDADO')),
                      );
                    }
                  },
                  child: const Text(
                    'Criar Conta',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  IconButton _buildToggleVisibilityButton(
    IconData passwordVisibilityIcon,
    RegistrationFormState registrationFormState,
  ) {
    return IconButton(
      onPressed: registrationFormState.togglePasswordVisibility,
      icon: Icon(passwordVisibilityIcon, size: 18),
    );
  }
}
