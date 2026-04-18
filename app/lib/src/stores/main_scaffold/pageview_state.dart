import 'package:app/src/stores/main_scaffold/main_scaffold_store.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'pageview_state.g.dart';

// ignore: library_private_types_in_public_api
class PageViewState = _PageViewStateBase with _$PageViewState;

abstract class _PageViewStateBase with Store {
  final MainScaffoldStore mainScaffoldStore;
  _PageViewStateBase({required this.mainScaffoldStore});

  final PageController controller = PageController(initialPage: 0);

  @observable
  int pageIndex = 0;

  @action
  ValueChanged<int> onDestinationSelected() {
    return (value) {
      if (pageIndex != value) _resetNavBarVisibility();
      setIndex(value);
      controller.animateToPage(
        pageIndex,
        duration: Durations.short4,
        curve: Curves.fastEaseInToSlowEaseOut,
      );
    };
  }

  @action
  ValueChanged<int> onPageChanged() {
    return (value) {
      if (pageIndex != value) _resetNavBarVisibility();
      setIndex(value);
    };
  }

  @action
  void setIndex(int index) => pageIndex = index;

  @action
  void _resetNavBarVisibility() => mainScaffoldStore.setNavBarVisibility(true);

  @action
  void dispose() => controller.dispose();
}
