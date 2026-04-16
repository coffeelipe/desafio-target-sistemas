import 'package:app/src/core/error/validation_errors.dart';
import 'package:app/src/core/error/validation_patterns.dart';
import 'package:app/src/core/utils/validation_utils.dart';
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
  final GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();

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
      return RegistrationValidationError
          .usernameErrorMessages[UsernameValidationErrors.emptyField];
    } else if (ValidationPatterns.usernameRegex.hasMatch(value)) {
      return null;
    } else {
      return ValidationUtils.computeErrorMessage(FieldType.username, value);
    }
  }
}
