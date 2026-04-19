import 'package:app/src/stores/home/home_store.dart';
import 'package:app/src/stores/main/root_store.dart';
import 'package:app/src/stores/main_scaffold/dashboard_store.dart';
import 'package:app/src/stores/main_scaffold/pageview_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'main_scaffold_store.g.dart';

// ignore: library_private_types_in_public_api
class MainScaffoldStore = _MainScaffoldStoreBase with _$MainScaffoldStore;

abstract class _MainScaffoldStoreBase with Store {
  late final PageViewState pageViewState;
  late final HomeStore homeStore;
  late final DashboardStore dashboardStore;

  _MainScaffoldStoreBase() {
    pageViewState = PageViewState(mainScaffoldStore: this as MainScaffoldStore);
    homeStore = HomeStore(mainScaffoldStore: this as MainScaffoldStore);
    dashboardStore = DashboardStore(
      mainScaffoldStore: this as MainScaffoldStore,
    );
  }

  @observable
  bool isNavBarVisible = true;

  @computed
  bool get isFABVisible => isNavBarVisible && pageViewState.pageIndex == 0;

  @action
  void setNavBarVisibility(bool value) {
    if (isNavBarVisible == value) return;
    isNavBarVisible = value;
  }

  @action
  void onFabPressed(BuildContext context) {
    context.read<RootStore>().noteStore.showNewNoteDialog(context, null);
  }

  @action
  void dispose() {
    pageViewState.dispose();
    homeStore.dispose();
  }
}
