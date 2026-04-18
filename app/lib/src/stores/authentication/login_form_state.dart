import 'package:app/src/core/error/validation_errors.dart';
import 'package:app/src/core/utils/validation_utils.dart';
import 'package:app/src/stores/authentication/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'login_form_state.g.dart';

// ignore: library_private_types_in_public_api
class LoginFormState = _LoginFormStateBase with _$LoginFormState;

abstract class _LoginFormStateBase with Store {
  final AuthStore authStore;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  _LoginFormStateBase({required this.authStore});

  @action
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
  }

  @observable
  bool isPasswordObscured = true;

  @action
  void togglePasswordVisibility() => isPasswordObscured = !isPasswordObscured;

  @action
  void submitForm() {
    if (loginFormKey.currentState!.validate()) {
      authStore.loginWithEmailAndPassword(
        _emailController.text,
        _passwordController.text,
      );
    }
  }

  // validator
  @action
  Map<FieldType, String?> validateLoginFields(String? email, String? password) {
    return {
      FieldType.email: (email == null || email.isEmpty)
          ? GlobalValidationError.emptyFieldErrorMessage
          : null,
      FieldType.password: (password == null || password.isEmpty)
          ? GlobalValidationError.emptyFieldErrorMessage
          : null,
    };
  }
}
