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
  void setIndex(int value) => pageIndex = value;

  @action
  void dispose() => controller.dispose();
}
