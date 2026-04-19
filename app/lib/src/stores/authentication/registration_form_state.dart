import 'package:app/src/core/error/validation_errors.dart';
import 'package:app/src/core/error/validation_patterns.dart';
import 'package:app/src/core/utils/validation_utils.dart';
import 'package:app/src/stores/authentication/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'registration_form_state.g.dart';

// ignore: library_private_types_in_public_api
class RegistrationFormState = _RegistrationFormStateBase
    with _$RegistrationFormState;

abstract class _RegistrationFormStateBase with Store {
  final AuthStore authStore;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();
  final GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();
  final FocusNode passwordFocusNode = FocusNode();

  TextEditingController get usernameController => _usernameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get passwordConfirmationController =>
      _passwordConfirmationController;

  _RegistrationFormStateBase({required this.authStore}) {
    passwordFocusNode.addListener(handleFocusChange);
  }

  // password field related observables
  @observable
  bool isPasswordObscured = true;
  @observable
  bool isPasswordFieldFocused = false;
  @observable
  bool isPasswordOverSixCharacters = false;
  @observable
  bool passwordContainsNoSpaces = false;
  @observable
  bool passwordContainsOnlyValidCharacters = false;

  @action
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    passwordFocusNode.dispose();
    passwordFocusNode.removeListener(handleFocusChange);
  }

  @action
  void togglePasswordVisibility() => isPasswordObscured = !isPasswordObscured;

  @action
  void handleFocusChange() =>
      isPasswordFieldFocused = passwordFocusNode.hasFocus;

  @action
  void setPasswordValidationFlags(String password) {
    if (password.isEmpty) {
      isPasswordOverSixCharacters = false;
      passwordContainsNoSpaces = false;
      passwordContainsOnlyValidCharacters = false;
      return;
    }

    isPasswordOverSixCharacters = password.length >= 6;
    passwordContainsNoSpaces = !RegExp(r'\s').hasMatch(password);
    passwordContainsOnlyValidCharacters = !RegExp(
      r'[^a-zA-Z0-9!@#$%^&*]',
    ).hasMatch(password);
  }

  @action
  void submitForm() {
    if (authStore.isLoading) return;
    if (registrationFormKey.currentState!.validate()) {
      authStore.createNewUser(
        _emailController.text,
        _passwordController.text,
        _usernameController.text,
      );
    }
  }

  // validators
  @action
  String? validateField(String? value, FieldType fieldType) {
    RegExp validationPattern;
    switch (fieldType) {
      case FieldType.username:
        validationPattern = ValidationPatterns.usernameRegex;
      case FieldType.email:
        validationPattern = ValidationPatterns.emailRegex;
      case FieldType.password:
        validationPattern = ValidationPatterns.passwordRegex;
    }

    if (value == null || value.isEmpty || !validationPattern.hasMatch(value)) {
      return ValidationUtils.computeErrorMessage(fieldType, value);
    }
    return null;
  }

  @action
  String? validatePasswordConfirmation(String? value) {
    if (value == null || value.isEmpty) {
      return GlobalValidationError.emptyFieldErrorMessage;
    } else if (value != _passwordController.text) {
      return RegistrationValidationError
          .passwordErrorMessages[PasswordValidationErrors
          .notMatchingConfirmation];
    }
    return null;
  }
}
