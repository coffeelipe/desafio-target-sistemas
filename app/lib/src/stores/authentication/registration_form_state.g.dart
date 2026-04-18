// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_form_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegistrationFormState on _RegistrationFormStateBase, Store {
  late final _$isPasswordObscuredAtom = Atom(
    name: '_RegistrationFormStateBase.isPasswordObscured',
    context: context,
  );

  @override
  bool get isPasswordObscured {
    _$isPasswordObscuredAtom.reportRead();
    return super.isPasswordObscured;
  }

  @override
  set isPasswordObscured(bool value) {
    _$isPasswordObscuredAtom.reportWrite(value, super.isPasswordObscured, () {
      super.isPasswordObscured = value;
    });
  }

  late final _$isPasswordFieldFocusedAtom = Atom(
    name: '_RegistrationFormStateBase.isPasswordFieldFocused',
    context: context,
  );

  @override
  bool get isPasswordFieldFocused {
    _$isPasswordFieldFocusedAtom.reportRead();
    return super.isPasswordFieldFocused;
  }

  @override
  set isPasswordFieldFocused(bool value) {
    _$isPasswordFieldFocusedAtom.reportWrite(
      value,
      super.isPasswordFieldFocused,
      () {
        super.isPasswordFieldFocused = value;
      },
    );
  }

  late final _$isPasswordOverSixCharactersAtom = Atom(
    name: '_RegistrationFormStateBase.isPasswordOverSixCharacters',
    context: context,
  );

  @override
  bool get isPasswordOverSixCharacters {
    _$isPasswordOverSixCharactersAtom.reportRead();
    return super.isPasswordOverSixCharacters;
  }

  @override
  set isPasswordOverSixCharacters(bool value) {
    _$isPasswordOverSixCharactersAtom.reportWrite(
      value,
      super.isPasswordOverSixCharacters,
      () {
        super.isPasswordOverSixCharacters = value;
      },
    );
  }

  late final _$passwordContainsNoSpacesAtom = Atom(
    name: '_RegistrationFormStateBase.passwordContainsNoSpaces',
    context: context,
  );

  @override
  bool get passwordContainsNoSpaces {
    _$passwordContainsNoSpacesAtom.reportRead();
    return super.passwordContainsNoSpaces;
  }

  @override
  set passwordContainsNoSpaces(bool value) {
    _$passwordContainsNoSpacesAtom.reportWrite(
      value,
      super.passwordContainsNoSpaces,
      () {
        super.passwordContainsNoSpaces = value;
      },
    );
  }

  late final _$passwordContainsOnlyValidCharactersAtom = Atom(
    name: '_RegistrationFormStateBase.passwordContainsOnlyValidCharacters',
    context: context,
  );

  @override
  bool get passwordContainsOnlyValidCharacters {
    _$passwordContainsOnlyValidCharactersAtom.reportRead();
    return super.passwordContainsOnlyValidCharacters;
  }

  @override
  set passwordContainsOnlyValidCharacters(bool value) {
    _$passwordContainsOnlyValidCharactersAtom.reportWrite(
      value,
      super.passwordContainsOnlyValidCharacters,
      () {
        super.passwordContainsOnlyValidCharacters = value;
      },
    );
  }

  late final _$_RegistrationFormStateBaseActionController = ActionController(
    name: '_RegistrationFormStateBase',
    context: context,
  );

  @override
  void dispose() {
    final _$actionInfo = _$_RegistrationFormStateBaseActionController
        .startAction(name: '_RegistrationFormStateBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_RegistrationFormStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePasswordVisibility() {
    final _$actionInfo = _$_RegistrationFormStateBaseActionController
        .startAction(
          name: '_RegistrationFormStateBase.togglePasswordVisibility',
        );
    try {
      return super.togglePasswordVisibility();
    } finally {
      _$_RegistrationFormStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleFocusChange() {
    final _$actionInfo = _$_RegistrationFormStateBaseActionController
        .startAction(name: '_RegistrationFormStateBase.handleFocusChange');
    try {
      return super.handleFocusChange();
    } finally {
      _$_RegistrationFormStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPasswordValidationFlags(String password) {
    final _$actionInfo = _$_RegistrationFormStateBaseActionController
        .startAction(
          name: '_RegistrationFormStateBase.setPasswordValidationFlags',
        );
    try {
      return super.setPasswordValidationFlags(password);
    } finally {
      _$_RegistrationFormStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void submitForm() {
    final _$actionInfo = _$_RegistrationFormStateBaseActionController
        .startAction(name: '_RegistrationFormStateBase.submitForm');
    try {
      return super.submitForm();
    } finally {
      _$_RegistrationFormStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateField(String? value, FieldType fieldType) {
    final _$actionInfo = _$_RegistrationFormStateBaseActionController
        .startAction(name: '_RegistrationFormStateBase.validateField');
    try {
      return super.validateField(value, fieldType);
    } finally {
      _$_RegistrationFormStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validatePasswordConfirmation(String? value) {
    final _$actionInfo = _$_RegistrationFormStateBaseActionController
        .startAction(
          name: '_RegistrationFormStateBase.validatePasswordConfirmation',
        );
    try {
      return super.validatePasswordConfirmation(value);
    } finally {
      _$_RegistrationFormStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPasswordObscured: ${isPasswordObscured},
isPasswordFieldFocused: ${isPasswordFieldFocused},
isPasswordOverSixCharacters: ${isPasswordOverSixCharacters},
passwordContainsNoSpaces: ${passwordContainsNoSpaces},
passwordContainsOnlyValidCharacters: ${passwordContainsOnlyValidCharacters}
    ''';
  }
}
