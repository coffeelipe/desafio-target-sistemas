// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserProfileStore on _UserProfileStoreBase, Store {
  late final _$isLoggedInAtom = Atom(
    name: '_UserProfileStoreBase.isLoggedIn',
    context: context,
  );

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  late final _$uidAtom = Atom(
    name: '_UserProfileStoreBase.uid',
    context: context,
  );

  @override
  String? get uid {
    _$uidAtom.reportRead();
    return super.uid;
  }

  @override
  set uid(String? value) {
    _$uidAtom.reportWrite(value, super.uid, () {
      super.uid = value;
    });
  }

  late final _$displayNameAtom = Atom(
    name: '_UserProfileStoreBase.displayName',
    context: context,
  );

  @override
  String? get displayName {
    _$displayNameAtom.reportRead();
    return super.displayName;
  }

  @override
  set displayName(String? value) {
    _$displayNameAtom.reportWrite(value, super.displayName, () {
      super.displayName = value;
    });
  }

  late final _$emailAtom = Atom(
    name: '_UserProfileStoreBase.email',
    context: context,
  );

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  @override
  String toString() {
    return '''
isLoggedIn: ${isLoggedIn},
uid: ${uid},
displayName: ${displayName},
email: ${email}
    ''';
  }
}
