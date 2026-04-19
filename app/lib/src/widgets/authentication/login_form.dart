import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:app/src/core/utils/validation_utils.dart';
import 'package:app/src/stores/authentication/login_form_state.dart';
import 'package:app/src/widgets/authentication/password_field.dart';
import 'package:app/src/widgets/global/custom_elevated_button.dart';
import 'package:app/src/widgets/global/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final loginFormStateProvider = Provider.of<LoginFormState>(context);

    return Observer(
      builder: (context) {
        return Form(
          key: loginFormStateProvider.loginFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: loginFormStateProvider.emailController,
                label: 'Email',
                hintText: 'email@exemplo.com',
                validator: (value) =>
                    loginFormStateProvider.validateLoginFields(
                      value,
                      loginFormStateProvider.passwordController.text,
                    )[FieldType.email],
              ),
              SizedBox(height: ResponsiveUtils.spacing(SpacingSize.small)),
              PasswordField(
                controller: loginFormStateProvider.passwordController,
                obscureText: loginFormStateProvider.isPasswordObscured,
                onTogglePressed:
                    loginFormStateProvider.togglePasswordVisibility,
                validator: (value) =>
                    loginFormStateProvider.validateLoginFields(
                      loginFormStateProvider.emailController.text,
                      value,
                    )[FieldType.password],
              ),
              SizedBox(height: ResponsiveUtils.spacing(SpacingSize.large)),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveUtils.spacing(SpacingSize.small),
                ),
                child: GradientButton(
                  onPressed: loginFormStateProvider.submitForm,
                  child: loginFormStateProvider.authStore.isLoading
                      ? const SpinKitThreeBounce(color: Colors.white, size: 20)
                      : const Text(
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
