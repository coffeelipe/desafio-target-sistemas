import 'package:app/src/stores/main_scaffold/main_scaffold_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobx/mobx.dart';
part 'dashboard_store.g.dart';

// ignore: library_private_types_in_public_api
class DashboardStore = _DashboardStoreBase with _$DashboardStore;

abstract class _DashboardStoreBase with Store {
  final MainScaffoldStore mainScaffoldStore;
  _DashboardStoreBase({required this.mainScaffoldStore});

  final ScrollController scrollController = ScrollController();

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
  void dispose() {
    scrollController.dispose();
  }
}
