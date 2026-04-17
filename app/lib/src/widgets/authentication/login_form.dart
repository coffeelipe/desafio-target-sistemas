import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:app/src/core/utils/validation_utils.dart';
import 'package:app/src/stores/authentication/login_form_state.dart';
import 'package:app/src/widgets/authentication/password_field.dart';
import 'package:app/src/widgets/global/custom_elevated_button.dart';
import 'package:app/src/widgets/global/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginFormStateProvider = Provider.of<LoginFormState>(context);

    return Observer(
      builder: (context) {
        final String emailInput = loginFormStateProvider.emailController.text;
        final String passwordInput =
            loginFormStateProvider.passwordController.text;

        return Form(
          key: loginFormStateProvider.loginFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: TextEditingController(),
                label: 'Email',
                hintText: 'email@exemplo.com',
                validator: (value) => loginFormStateProvider
                    .validateLoginFields(value, passwordInput)[FieldType.email],
              ),
              SizedBox(height: ResponsiveUtils.spacing(SpacingSize.small)),
              PasswordField(
                controller: loginFormStateProvider.passwordController,
                obscureText: loginFormStateProvider.isPasswordObscured,
                onTogglePressed:
                    loginFormStateProvider.togglePasswordVisibility,
                validator: (value) => loginFormStateProvider
                    .validateLoginFields(emailInput, value)[FieldType.password],
              ),
              SizedBox(height: ResponsiveUtils.spacing(SpacingSize.large)),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveUtils.spacing(SpacingSize.small),
                ),
                child: GradientButton(
                  onPressed: () {
                    if (loginFormStateProvider.loginFormKey.currentState!
                        .validate()) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/',
                        (route) => false,
                      );
                    }
                  },
                  child: const Text(
                    'Entrar',
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
