import 'package:app/src/pages/dashboard/dashboard.dart';
import 'package:app/src/pages/home/home_page.dart';
import 'package:app/src/pages/main_scaffold/stores/pageview_state.dart';
import 'package:app/src/pages/main_scaffold/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  late final PageController _pageController;
  final _pageviewState = PageViewState();

  @override
  void initState() {
    super.initState();
    _pageController = _pageviewState.controller;
  }

  @override
  void dispose() {
    super.dispose();
    _pageviewState.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final int pageIndex = _pageviewState.pageIndex;
        return Scaffold(
          bottomNavigationBar: CustomNavBar(
            pageController: _pageController,
            index: pageIndex,
            onDestinationSelected: (value) {
              _pageviewState.setIndex(value);
              _pageController.animateToPage(
                value,
                duration: Durations.short3,
                curve: Curves.easeInOut,
              );
            },
          ),
          body: PageView(
            controller: _pageController,
            onPageChanged: (value) => _pageviewState.setIndex(value),
            children: const [HomePage(), Dashboard()],
          ),
        );
      },
    );
  }
}
