import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:app/src/stores/authentication/registration_form_state.dart';
import 'package:app/src/widgets/global/custom_elevated_button.dart';
import 'package:app/src/widgets/global/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:remixicon/remixicon.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final RegistrationFormState _registrationFormState = RegistrationFormState();

  @override
  void dispose() {
    super.dispose();
    _registrationFormState.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        bool isPasswordObscured = _registrationFormState.isPasswordObscured;
        IconData passwordVisibilityIcon = isPasswordObscured
            ? RemixIcons.eye_close_fill
            : RemixIcons.eye_2_fill;

        return Form(
          key: _registrationFormState.registrationFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: _registrationFormState.usernameController,
                label: 'Usuário',
                hintText: 'seu_usuário',
                maxLength: 16,
                validator: (value) =>
                    _registrationFormState.validateUsername(value),
              ),
              SizedBox(height: ResponsiveUtils.spacing(SpacingSize.small)),
              CustomTextFormField(
                controller: _registrationFormState.emailController,
                label: 'Email',
                hintText: 'email@exemplo.com',
              ),
              SizedBox(height: ResponsiveUtils.spacing(SpacingSize.small)),
              CustomTextFormField(
                controller: _registrationFormState.passwordController,
                label: 'Senha',
                hintText: 'Senha',
                obscureText: isPasswordObscured,
                suffixIcon: _buildToggleVisibilityButton(
                  passwordVisibilityIcon,
                ),
              ),
              SizedBox(height: ResponsiveUtils.spacing(SpacingSize.small)),
              CustomTextFormField(
                controller:
                    _registrationFormState.passwordConfirmationController,
                label: 'Confirmar Senha',
                hintText: 'Confirmar Senha',
                obscureText: isPasswordObscured,
                suffixIcon: _buildToggleVisibilityButton(
                  passwordVisibilityIcon,
                ),
              ),
              SizedBox(height: ResponsiveUtils.spacing(SpacingSize.large)),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveUtils.spacing(SpacingSize.small),
                ),
                child: GradientButton(
                  onPressed: () {
                    if (_registrationFormState.registrationFormKey.currentState!
                        .validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('FORMULARIO VALIDADO')),
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

  IconButton _buildToggleVisibilityButton(IconData passwordVisibilityIcon) {
    return IconButton(
      onPressed: _registrationFormState.togglePasswordVisibility,
      icon: Icon(passwordVisibilityIcon, size: 18),
    );
  }
}
