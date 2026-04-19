// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestorage_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FirestorageStore on _FirestorageStoreBase, Store {
  late final _$isSyncingAtom = Atom(
    name: '_FirestorageStoreBase.isSyncing',
    context: context,
  );

  @override
  bool get isSyncing {
    _$isSyncingAtom.reportRead();
    return super.isSyncing;
  }

  @override
  set isSyncing(bool value) {
    _$isSyncingAtom.reportWrite(value, super.isSyncing, () {
      super.isSyncing = value;
    });
  }

  @override
  String toString() {
    return '''
isSyncing: ${isSyncing}
    ''';
  }
}
