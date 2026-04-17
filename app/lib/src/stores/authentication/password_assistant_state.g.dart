// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_assistant_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PasswordAssistantState on _PasswordAssistantStateBase, Store {
  late final _$passwordStrengthAtom = Atom(
    name: '_PasswordAssistantStateBase.passwordStrength',
    context: context,
  );

  @override
  double get passwordStrength {
    _$passwordStrengthAtom.reportRead();
    return super.passwordStrength;
  }

  @override
  set passwordStrength(double value) {
    _$passwordStrengthAtom.reportWrite(value, super.passwordStrength, () {
      super.passwordStrength = value;
    });
  }

  late final _$_PasswordAssistantStateBaseActionController = ActionController(
    name: '_PasswordAssistantStateBase',
    context: context,
  );

  @override
  void evaluatePasswordStrength(
    String password,
    String username,
    String email,
  ) {
    final _$actionInfo = _$_PasswordAssistantStateBaseActionController
        .startAction(
          name: '_PasswordAssistantStateBase.evaluatePasswordStrength',
        );
    try {
      return super.evaluatePasswordStrength(password, username, email);
    } finally {
      _$_PasswordAssistantStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
passwordStrength: ${passwordStrength}
    ''';
  }
}
