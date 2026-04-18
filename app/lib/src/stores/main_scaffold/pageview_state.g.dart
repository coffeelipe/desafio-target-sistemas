// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageview_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PageViewState on _PageViewStateBase, Store {
  late final _$pageIndexAtom = Atom(
    name: '_PageViewStateBase.pageIndex',
    context: context,
  );

  @override
  int get pageIndex {
    _$pageIndexAtom.reportRead();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.reportWrite(value, super.pageIndex, () {
      super.pageIndex = value;
    });
  }

  late final _$_PageViewStateBaseActionController = ActionController(
    name: '_PageViewStateBase',
    context: context,
  );

  @override
  ValueChanged<int> onDestinationSelected() {
    final _$actionInfo = _$_PageViewStateBaseActionController.startAction(
      name: '_PageViewStateBase.onDestinationSelected',
    );
    try {
      return super.onDestinationSelected();
    } finally {
      _$_PageViewStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  ValueChanged<int> onPageChanged() {
    final _$actionInfo = _$_PageViewStateBaseActionController.startAction(
      name: '_PageViewStateBase.onPageChanged',
    );
    try {
      return super.onPageChanged();
    } finally {
      _$_PageViewStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIndex(int index) {
    final _$actionInfo = _$_PageViewStateBaseActionController.startAction(
      name: '_PageViewStateBase.setIndex',
    );
    try {
      return super.setIndex(index);
    } finally {
      _$_PageViewStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _resetNavBarVisibility() {
    final _$actionInfo = _$_PageViewStateBaseActionController.startAction(
      name: '_PageViewStateBase._resetNavBarVisibility',
    );
    try {
      return super._resetNavBarVisibility();
    } finally {
      _$_PageViewStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_PageViewStateBaseActionController.startAction(
      name: '_PageViewStateBase.dispose',
    );
    try {
      return super.dispose();
    } finally {
      _$_PageViewStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageIndex: ${pageIndex}
    ''';
  }
}
