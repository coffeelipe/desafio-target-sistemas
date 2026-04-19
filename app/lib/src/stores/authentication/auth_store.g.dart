// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStoreBase, Store {
  late final _$isInitializingAtom = Atom(
    name: '_AuthStoreBase.isInitializing',
    context: context,
  );

  @override
  bool get isInitializing {
    _$isInitializingAtom.reportRead();
    return super.isInitializing;
  }

  @override
  set isInitializing(bool value) {
    _$isInitializingAtom.reportWrite(value, super.isInitializing, () {
      super.isInitializing = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_AuthStoreBase.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$credentialAtom = Atom(
    name: '_AuthStoreBase.credential',
    context: context,
  );

  @override
  UserCredential? get credential {
    _$credentialAtom.reportRead();
    return super.credential;
  }

  @override
  set credential(UserCredential? value) {
    _$credentialAtom.reportWrite(value, super.credential, () {
      super.credential = value;
    });
  }

  late final _$isLoggedInServerSideAtom = Atom(
    name: '_AuthStoreBase.isLoggedInServerSide',
    context: context,
  );

  @override
  bool get isLoggedInServerSide {
    _$isLoggedInServerSideAtom.reportRead();
    return super.isLoggedInServerSide;
  }

  @override
  set isLoggedInServerSide(bool value) {
    _$isLoggedInServerSideAtom.reportWrite(
      value,
      super.isLoggedInServerSide,
      () {
        super.isLoggedInServerSide = value;
      },
    );
  }

  late final _$authErrorMessageAtom = Atom(
    name: '_AuthStoreBase.authErrorMessage',
    context: context,
  );

  @override
  String? get authErrorMessage {
    _$authErrorMessageAtom.reportRead();
    return super.authErrorMessage;
  }

  @override
  set authErrorMessage(String? value) {
    _$authErrorMessageAtom.reportWrite(value, super.authErrorMessage, () {
      super.authErrorMessage = value;
    });
  }

  late final _$createNewUserAsyncAction = AsyncAction(
    '_AuthStoreBase.createNewUser',
    context: context,
  );

  @override
  Future<void> createNewUser(
    String email,
    String password,
    String displayName,
  ) {
    return _$createNewUserAsyncAction.run(
      () => super.createNewUser(email, password, displayName),
    );
  }

  late final _$loginWithEmailAndPasswordAsyncAction = AsyncAction(
    '_AuthStoreBase.loginWithEmailAndPassword',
    context: context,
  );

  @override
  Future<void> loginWithEmailAndPassword(String email, String password) {
    return _$loginWithEmailAndPasswordAsyncAction.run(
      () => super.loginWithEmailAndPassword(email, password),
    );
  }

  late final _$signOutAsyncAction = AsyncAction(
    '_AuthStoreBase.signOut',
    context: context,
  );

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  late final _$updateDisplayNameAsyncAction = AsyncAction(
    '_AuthStoreBase.updateDisplayName',
    context: context,
  );

  @override
  Future<bool> updateDisplayName(String newName) {
    return _$updateDisplayNameAsyncAction.run(
      () => super.updateDisplayName(newName),
    );
  }

  late final _$deleteAccountWithPasswordAsyncAction = AsyncAction(
    '_AuthStoreBase.deleteAccountWithPassword',
    context: context,
  );

  @override
  Future<bool> deleteAccountWithPassword(String password) {
    return _$deleteAccountWithPasswordAsyncAction.run(
      () => super.deleteAccountWithPassword(password),
    );
  }

  late final _$_AuthStoreBaseActionController = ActionController(
    name: '_AuthStoreBase',
    context: context,
  );

  @override
  void clearAuthError() {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
      name: '_AuthStoreBase.clearAuthError',
    );
    try {
      return super.clearAuthError();
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _onAuthStateChanged(User? user) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
      name: '_AuthStoreBase._onAuthStateChanged',
    );
    try {
      return super._onAuthStateChanged(user);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isInitializing: ${isInitializing},
isLoading: ${isLoading},
credential: ${credential},
isLoggedInServerSide: ${isLoggedInServerSide},
authErrorMessage: ${authErrorMessage}
    ''';
  }
}
