import 'package:app/src/core/extensions/mediaquery_extension.dart';
import 'package:app/src/core/theme/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class CustomNavBar extends StatelessWidget {
  final PageController pageController;
  final ValueChanged<int> onDestinationSelected;
  final Function(BuildContext) onFabPressed;
  final int selectedIndex;
  final bool isFABVisible;
  const CustomNavBar({
    super.key,
    required this.pageController,
    required this.onDestinationSelected,
    required this.onFabPressed,
    required this.selectedIndex,
    required this.isFABVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        height: context.screenHeight * 0.3,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
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
                      _buildNavButton(
                        onPressed: onDestinationSelected,
                        index: 0,
                      ),
                      _buildNavButton(
                        onPressed: onDestinationSelected,
                        index: 1,
                      ),
                      _buildNavButton(
                        onPressed: onDestinationSelected,
                        index: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: -15,
              bottom: 70,
              child: AnimatedRotation(
                turns: isFABVisible ? 0 : -0.25,
                duration: Durations.short3,
                child: AnimatedScale(
                  duration: Durations.short4,
                  scale: isFABVisible ? 1 : 0,
                  child: FloatingActionButton(
                    onPressed: isFABVisible
                        ? () => onFabPressed(context)
                        : null,
                    shape: const CircleBorder(),
                    backgroundColor: AppPalette.primary,
                    child: const Icon(
                      Icons.add_rounded,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
        : index == 1
        ? RemixIcons.pie_chart_fill
        : RemixIcons.user_settings_fill;

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
