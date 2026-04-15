import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class CustomNavBar extends StatelessWidget {
  final PageController pageController;
  final ValueChanged onDestinationSelected;
  final int index;
  const CustomNavBar({
    super.key,
    required this.pageController,
    required this.onDestinationSelected,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(
          icon: Icon(RemixIcons.book_shelf_fill),
          label: 'Biblioteca',
        ),
        NavigationDestination(
          icon: Icon(RemixIcons.pie_chart_fill),
          label: 'Dashboard',
        ),
      ],
      onDestinationSelected: onDestinationSelected,
      selectedIndex: index,
    );
  }
}
