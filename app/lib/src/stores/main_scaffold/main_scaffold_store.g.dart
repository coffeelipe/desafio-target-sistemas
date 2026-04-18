// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_scaffold_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainScaffoldStore on _MainScaffoldStoreBase, Store {
  Computed<bool>? _$isFABVisibleComputed;

  @override
  bool get isFABVisible => (_$isFABVisibleComputed ??= Computed<bool>(
    () => super.isFABVisible,
    name: '_MainScaffoldStoreBase.isFABVisible',
  )).value;

  late final _$isNavBarVisibleAtom = Atom(
    name: '_MainScaffoldStoreBase.isNavBarVisible',
    context: context,
  );

  @override
  bool get isNavBarVisible {
    _$isNavBarVisibleAtom.reportRead();
    return super.isNavBarVisible;
  }

  @override
  set isNavBarVisible(bool value) {
    _$isNavBarVisibleAtom.reportWrite(value, super.isNavBarVisible, () {
      super.isNavBarVisible = value;
    });
  }

  late final _$_MainScaffoldStoreBaseActionController = ActionController(
    name: '_MainScaffoldStoreBase',
    context: context,
  );

  @override
  void setNavBarVisibility(bool value) {
    final _$actionInfo = _$_MainScaffoldStoreBaseActionController.startAction(
      name: '_MainScaffoldStoreBase.setNavBarVisibility',
    );
    try {
      return super.setNavBarVisibility(value);
    } finally {
      _$_MainScaffoldStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onFabPressed(BuildContext context) {
    final _$actionInfo = _$_MainScaffoldStoreBaseActionController.startAction(
      name: '_MainScaffoldStoreBase.onFabPressed',
    );
    try {
      return super.onFabPressed(context);
    } finally {
      _$_MainScaffoldStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_MainScaffoldStoreBaseActionController.startAction(
      name: '_MainScaffoldStoreBase.dispose',
    );
    try {
      return super.dispose();
    } finally {
      _$_MainScaffoldStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isNavBarVisible: ${isNavBarVisible},
isFABVisible: ${isFABVisible}
    ''';
  }
}
