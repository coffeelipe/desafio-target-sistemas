import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'registration_form_state.g.dart';

class RegistrationFormState = _RegistrationFormStateBase
    with _$RegistrationFormState;

abstract class _RegistrationFormStateBase with Store {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  bool isPasswordObscured = true;

  @action
  void togglePasswordVisibility() => isPasswordObscured = !isPasswordObscured;

  @action
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
  }

  // validators
  @action
  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira um nome de usuário';
    } else if (RegExp(r'^(?=.{3,16}$)[A-Za-z](?:[A-Za-z0-9]|[-_](?=[A-Za-z0-9]))*$').hasMatch(value)) {
      return null;
    } else {

    }
  }
}
