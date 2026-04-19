import 'package:app/src/core/extensions/mediaquery_extension.dart';
import 'package:app/src/core/theme/app_palette.dart';
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
    _mainScaffoldStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final int selectedIndex = _mainScaffoldStore.pageViewState.pageIndex;
        return Scaffold(
          body: Stack(
            clipBehavior: Clip.none,
            children: [
              PageView(
                controller: _mainScaffoldStore.pageViewState.controller,
                onPageChanged: _mainScaffoldStore.pageViewState.onPageChanged(),
                children: [
                  Provider.value(
                    value: _mainScaffoldStore.homeStore,
                    child: const HomePage(),
                  ),
                  Provider.value(
                    value: _mainScaffoldStore.dashboardStore,
                    child: const Dashboard(),
                  ),
                  const Profile(),
                ],
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: context.mediaQuery.padding.top + context.safeTop,
                  decoration: BoxDecoration(
                    gradient: AppPalette.edgeToEdgeGradient,
                  ),
                ),
              ),
              Positioned(
                bottom: context.safeBottom + 32,
                left: 0,
                right: 0,
                child: AnimatedSlide(
                  duration: Durations.medium3,
                  curve: Curves.fastEaseInToSlowEaseOut,
                  offset: _mainScaffoldStore.isNavBarVisible
                      ? Offset.zero
                      : const Offset(0, 0.7),
                  child: AnimatedOpacity(
                    opacity: _mainScaffoldStore.isNavBarVisible ? 1.0 : 0.0,
                    duration: Durations.short4,
                    curve: Curves.fastEaseInToSlowEaseOut,
                    child: CustomNavBar(
                      pageController:
                          _mainScaffoldStore.pageViewState.controller,
                      onDestinationSelected: _mainScaffoldStore.pageViewState
                          .onDestinationSelected(),
                      onFabPressed: _mainScaffoldStore.onFabPressed,
                      selectedIndex: selectedIndex,
                      isFABVisible: _mainScaffoldStore.isFABVisible,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
