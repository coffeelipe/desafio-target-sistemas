import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:app/src/core/utils/validation_utils.dart';
import 'package:app/src/stores/authentication/password_assistant_state.dart';
import 'package:app/src/stores/authentication/registration_form_state.dart';
import 'package:app/src/widgets/authentication/assisted_password_field.dart';
import 'package:app/src/widgets/authentication/password_field.dart';
import 'package:app/src/widgets/global/custom_elevated_button.dart';
import 'package:app/src/widgets/global/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

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

        return Form(
          key: registrationFormState.registrationFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: registrationFormState.usernameController,
                label: 'Usuário*',
                hintText: 'Nome de usuário',
                maxLength: 16,
                keyboardType: TextInputType.name,
                validator: (value) => registrationFormState.validateField(
                  value,
                  FieldType.username,
                ),
              ),
              SizedBox(height: ResponsiveUtils.spacing(SpacingSize.small)),
              CustomTextFormField(
                controller: registrationFormState.emailController,
                label: 'Email*',
                hintText: 'email@exemplo.com',
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                    registrationFormState.validateField(value, FieldType.email),
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
                validator: (value) => registrationFormState.validateField(
                  value,
                  FieldType.password,
                ),
              ),
              SizedBox(height: ResponsiveUtils.spacing(SpacingSize.small)),
              PasswordField(
                controller:
                    registrationFormState.passwordConfirmationController,
                label: 'Confirmar senha*',
                hintText: 'Confirmar senha',
                obscureText: isPasswordObscured,
                onTogglePressed: registrationFormState.togglePasswordVisibility,
                validator: (value) =>
                    registrationFormState.validatePasswordConfirmation(value),
              ),
              SizedBox(height: ResponsiveUtils.spacing(SpacingSize.large)),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveUtils.spacing(SpacingSize.small),
                ),
                child: GradientButton(
                  onPressed: registrationFormState.submitForm,
                  child: registrationFormState.authStore.isLoading
                      ? const SpinKitThreeBounce(color: Colors.white, size: 20)
                      : const Text(
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
}
