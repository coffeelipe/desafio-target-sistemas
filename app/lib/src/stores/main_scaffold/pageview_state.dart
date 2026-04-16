import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'pageview_state.g.dart';

class PageViewState = _PageViewStateBase with _$PageViewState;

abstract class _PageViewStateBase with Store {
  final PageController controller = PageController(initialPage: 0);

  @observable
  int pageIndex = 0;

  @action
  void setIndex(int value) => pageIndex = value;

  @action
  void dispose() => controller.dispose();
}
