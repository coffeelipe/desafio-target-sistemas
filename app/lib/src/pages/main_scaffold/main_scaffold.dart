import 'package:app/src/core/extensions/mediaquery_extension.dart';
import 'package:app/src/pages/dashboard/dashboard.dart';
import 'package:app/src/pages/home/home_page.dart';
import 'package:app/src/stores/main_scaffold/pageview_state.dart';
import 'package:app/src/widgets/main_scaffold/custom_nav_bar.dart';
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
          body: Stack(
            children: [
              PageView(
                controller: _pageController,
                onPageChanged: (value) => _pageviewState.setIndex(value),
                children: const [HomePage(), Dashboard()],
              ),
              Positioned(
                bottom: context.safeBottom + 32,
                left: 0,
                right: 0,
                child: CustomNavBar(
                  pageController: _pageController,
                  onDestinationSelected: (value) {
                    _pageviewState.setIndex(value);
                    _pageController.animateToPage(
                      _pageviewState.pageIndex,
                      duration: Durations.short3,
                      curve: Curves.easeInOut,
                    );
                  },
                  selectedIndex: pageIndex,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
