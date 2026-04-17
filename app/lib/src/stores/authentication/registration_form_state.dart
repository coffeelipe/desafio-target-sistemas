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
  final FocusNode passwordFocusNode = FocusNode();

  _RegistrationFormStateBase() {
    passwordFocusNode.addListener(handleFocusChange);
  }

  @observable
  bool isPasswordObscured = true;

  @observable
  bool isPasswordFieldFocused = false;

  @action
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    passwordFocusNode.dispose();
    passwordFocusNode.removeListener(handleFocusChange);
  }

  @action
  void togglePasswordVisibility() => isPasswordObscured = !isPasswordObscured;

  @action
  void handleFocusChange() =>
      isPasswordFieldFocused = passwordFocusNode.hasFocus;

  // validators
  @action
  String? validateField(String? value, FieldType fieldType) {
    RegExp validationPattern;
    switch (fieldType) {
      case FieldType.username:
        validationPattern = ValidationPatterns.usernameRegex;
      case FieldType.password:
        validationPattern = ValidationPatterns.passwordRegex;
      default:
        throw Exception("Failed to define a validation pattern");
    }

    if (value == null || value.isEmpty || !validationPattern.hasMatch(value)) {
      return ValidationUtils.computeErrorMessage(fieldType, value);
    }
    return null;
  }
}
