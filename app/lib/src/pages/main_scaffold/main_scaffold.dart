import 'package:app/src/core/extensions/mediaquery_extension.dart';
import 'package:app/src/pages/dashboard/dashboard.dart';
import 'package:app/src/pages/home/home_page.dart';
import 'package:app/src/pages/profile/profile.dart';
import 'package:app/src/stores/main_scaffold/main_scaffold_store.dart';
import 'package:app/src/widgets/main_scaffold/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  final MainScaffoldStore _mainScaffoldStore = MainScaffoldStore();

  @override
  void dispose() {
    super.dispose();
    _mainScaffoldStore.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final int pageIndex = _mainScaffoldStore.pageViewState.pageIndex;
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                PageView(
                  controller: _mainScaffoldStore.pageViewState.controller,
                  onPageChanged: _mainScaffoldStore.pageViewState.onPageChanged,
                  children: [
                    Provider.value(
                      value: _mainScaffoldStore.homeStore,
                      child: const HomePage(),
                    ),
                    const Dashboard(),
                    const Profile(),
                  ],
                ),
                Positioned(
                  bottom: context.safeBottom + 32,
                  left: 0,
                  right: 0,
                  child: CustomNavBar(
                    pageController: _mainScaffoldStore.pageViewState.controller,
                    onDestinationSelected: _mainScaffoldStore.pageViewState
                        .onDestinationSelected(pageIndex),
                    selectedIndex: pageIndex,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
