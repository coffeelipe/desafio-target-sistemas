// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_form_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginFormState on _LoginFormStateBase, Store {
  late final _$isPasswordObscuredAtom = Atom(
    name: '_LoginFormStateBase.isPasswordObscured',
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

  late final _$_LoginFormStateBaseActionController = ActionController(
    name: '_LoginFormStateBase',
    context: context,
  );

  @override
  void dispose() {
    final _$actionInfo = _$_LoginFormStateBaseActionController.startAction(
      name: '_LoginFormStateBase.dispose',
    );
    try {
      return super.dispose();
    } finally {
      _$_LoginFormStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePasswordVisibility() {
    final _$actionInfo = _$_LoginFormStateBaseActionController.startAction(
      name: '_LoginFormStateBase.togglePasswordVisibility',
    );
    try {
      return super.togglePasswordVisibility();
    } finally {
      _$_LoginFormStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void submitForm() {
    final _$actionInfo = _$_LoginFormStateBaseActionController.startAction(
      name: '_LoginFormStateBase.submitForm',
    );
    try {
      return super.submitForm();
    } finally {
      _$_LoginFormStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Map<FieldType, String?> validateLoginFields(String? email, String? password) {
    final _$actionInfo = _$_LoginFormStateBaseActionController.startAction(
      name: '_LoginFormStateBase.validateLoginFields',
    );
    try {
      return super.validateLoginFields(email, password);
    } finally {
      _$_LoginFormStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPasswordObscured: ${isPasswordObscured}
    ''';
  }
}
