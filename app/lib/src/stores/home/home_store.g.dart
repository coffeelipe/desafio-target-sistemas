// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  Computed<String>? _$greetingMessageComputed;

  @override
  String get greetingMessage => (_$greetingMessageComputed ??= Computed<String>(
    () => super.greetingMessage,
    name: '_HomeStoreBase.greetingMessage',
  )).value;

  late final _$timeOfDayGreetingAtom = Atom(
    name: '_HomeStoreBase.timeOfDayGreeting',
    context: context,
  );

  @override
  String get timeOfDayGreeting {
    _$timeOfDayGreetingAtom.reportRead();
    return super.timeOfDayGreeting;
  }

  @override
  set timeOfDayGreeting(String value) {
    _$timeOfDayGreetingAtom.reportWrite(value, super.timeOfDayGreeting, () {
      super.timeOfDayGreeting = value;
    });
  }

  late final _$greetingDisplayNameAtom = Atom(
    name: '_HomeStoreBase.greetingDisplayName',
    context: context,
  );

  @override
  String get greetingDisplayName {
    _$greetingDisplayNameAtom.reportRead();
    return super.greetingDisplayName;
  }

  @override
  set greetingDisplayName(String value) {
    _$greetingDisplayNameAtom.reportWrite(value, super.greetingDisplayName, () {
      super.greetingDisplayName = value;
    });
  }

  late final _$_HomeStoreBaseActionController = ActionController(
    name: '_HomeStoreBase',
    context: context,
  );

  @override
  bool Function(ScrollNotification) onScrollNotification() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
      name: '_HomeStoreBase.onScrollNotification',
    );
    try {
      return super.onScrollNotification();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setTimeOfDayGreeting() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
      name: '_HomeStoreBase._setTimeOfDayGreeting',
    );
    try {
      return super._setTimeOfDayGreeting();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGreetingDisplayName(String username) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
      name: '_HomeStoreBase.setGreetingDisplayName',
    );
    try {
      return super.setGreetingDisplayName(username);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _init() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
      name: '_HomeStoreBase._init',
    );
    try {
      return super._init();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
      name: '_HomeStoreBase.dispose',
    );
    try {
      return super.dispose();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
timeOfDayGreeting: ${timeOfDayGreeting},
greetingDisplayName: ${greetingDisplayName},
greetingMessage: ${greetingMessage}
    ''';
  }
}
