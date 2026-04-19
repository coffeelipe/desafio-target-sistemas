import 'package:flutter/material.dart';

class AnimatedTile extends StatelessWidget {
  final String noteId;
  final double left;
  final double top;
  final double tileWidth;
  final double tileHeight;
  final Widget child;
  const AnimatedTile({
    super.key,
    required this.noteId,
    required this.child,
    required this.left,
    required this.top,
    required this.tileWidth,
    required this.tileHeight,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Durations.short4,
      curve: Curves.easeInOut,
      left: left,
      top: top,
      width: tileWidth,
      height: tileHeight,
      child: child,
    );
  }
}
