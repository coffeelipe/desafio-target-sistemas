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

  // validators
  

  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
  }
}
