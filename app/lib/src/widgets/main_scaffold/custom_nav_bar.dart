import 'package:app/src/core/theme/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class CustomNavBar extends StatelessWidget {
  final PageController pageController;
  final ValueChanged<int> onDestinationSelected;
  final int selectedIndex;
  const CustomNavBar({
    super.key,
    required this.pageController,
    required this.onDestinationSelected,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 5),
                  color: Colors.black26,
                  blurRadius: 8,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavButton(onPressed: onDestinationSelected, index: 0),
                  _buildNavButton(onPressed: onDestinationSelected, index: 1),
                ],
              ),
            ),
          ),
          Positioned(
            right: -15,
            bottom: 70,
            child: FloatingActionButton(
              onPressed: () {},
              shape: const CircleBorder(),
              backgroundColor: AppPalette.primary,
              child: const Icon(
                Icons.add_rounded,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconButton _buildNavButton({
    required ValueChanged<int> onPressed,
    required int index,
  }) {
    final bool isSelected = index == selectedIndex;
    final IconData iconData = index == 0
        ? RemixIcons.archive_stack_fill
        : RemixIcons.pie_chart_fill;

    return IconButton(
      onPressed: () => onPressed(index),
      icon: AnimatedCrossFade(
        duration: Durations.short3,
        crossFadeState: isSelected
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        firstChild: Icon(iconData, color: AppPalette.primary),
        secondChild: Icon(iconData, color: Colors.black26),
      ),
    );
  }
}
