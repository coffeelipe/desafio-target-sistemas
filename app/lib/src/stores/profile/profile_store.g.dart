// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileStore on _ProfileStoreBase, Store {
  Computed<bool>? _$isBusyComputed;

  @override
  bool get isBusy => (_$isBusyComputed ??= Computed<bool>(
    () => super.isBusy,
    name: '_ProfileStoreBase.isBusy',
  )).value;
  Computed<bool>? _$canSubmitUsernameComputed;

  @override
  bool get canSubmitUsername => (_$canSubmitUsernameComputed ??= Computed<bool>(
    () => super.canSubmitUsername,
    name: '_ProfileStoreBase.canSubmitUsername',
  )).value;

  late final _$hasUsernameInputAtom = Atom(
    name: '_ProfileStoreBase.hasUsernameInput',
    context: context,
  );

  @override
  bool get hasUsernameInput {
    _$hasUsernameInputAtom.reportRead();
    return super.hasUsernameInput;
  }

  @override
  set hasUsernameInput(bool value) {
    _$hasUsernameInputAtom.reportWrite(value, super.hasUsernameInput, () {
      super.hasUsernameInput = value;
    });
  }

  late final _$updateUsernameAsyncAction = AsyncAction(
    '_ProfileStoreBase.updateUsername',
    context: context,
  );

  @override
  Future<ProfileActionResult> updateUsername() {
    return _$updateUsernameAsyncAction.run(() => super.updateUsername());
  }

  late final _$deleteAccountWithPasswordAsyncAction = AsyncAction(
    '_ProfileStoreBase.deleteAccountWithPassword',
    context: context,
  );

  @override
  Future<ProfileActionResult> deleteAccountWithPassword(String password) {
    return _$deleteAccountWithPasswordAsyncAction.run(
      () => super.deleteAccountWithPassword(password),
    );
  }

  late final _$_ProfileStoreBaseActionController = ActionController(
    name: '_ProfileStoreBase',
    context: context,
  );

  @override
  void prefillUsernameIfNeeded() {
    final _$actionInfo = _$_ProfileStoreBaseActionController.startAction(
      name: '_ProfileStoreBase.prefillUsernameIfNeeded',
    );
    try {
      return super.prefillUsernameIfNeeded();
    } finally {
      _$_ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onUsernameChanged(String value) {
    final _$actionInfo = _$_ProfileStoreBaseActionController.startAction(
      name: '_ProfileStoreBase.onUsernameChanged',
    );
    try {
      return super.onUsernameChanged(value);
    } finally {
      _$_ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_ProfileStoreBaseActionController.startAction(
      name: '_ProfileStoreBase.dispose',
    );
    try {
      return super.dispose();
    } finally {
      _$_ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasUsernameInput: ${hasUsernameInput},
isBusy: ${isBusy},
canSubmitUsername: ${canSubmitUsername}
    ''';
  }
}
