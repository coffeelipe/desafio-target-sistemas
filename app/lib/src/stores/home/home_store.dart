import 'package:app/src/stores/main_scaffold/main_scaffold_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

// ignore: library_private_types_in_public_api
class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final MainScaffoldStore mainScaffoldStore;
  _HomeStoreBase({required this.mainScaffoldStore}) {
    _init();
  }

  final ScrollController scrollController = ScrollController();

  @observable
  String timeOfDayGreeting = '';

  @observable
  String greetingDisplayName = '';

  @computed
  String get greetingMessage {
    final String name = greetingDisplayName.trim();
    final String greeting = name.isEmpty
        ? '$timeOfDayGreeting!'
        : '$timeOfDayGreeting, $name!';
    return '$greeting\nQue ideias temos para hoje?';
  }

  @action
  bool Function(ScrollNotification) onScrollNotification() {
    return (ScrollNotification notification) {
      if (notification is UserScrollNotification) {
        if (notification.direction == ScrollDirection.reverse) {
          mainScaffoldStore.setNavBarVisibility(false);
        } else if (notification.direction == ScrollDirection.forward) {
          mainScaffoldStore.setNavBarVisibility(true);
        }
      }
      return false;
    };
  }

  @action
  void _setTimeOfDayGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      timeOfDayGreeting = 'Bom dia';
    } else if (hour < 18) {
      timeOfDayGreeting = 'Boa tarde';
    } else {
      timeOfDayGreeting = 'Boa noite';
    }
  }

  @action
  void setGreetingDisplayName(String username) =>
      greetingDisplayName = username;

  @action
  void _init() {
    _setTimeOfDayGreeting();
  }

  @action
  void dispose() {
    scrollController.dispose();
  }
}
