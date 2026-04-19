import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:app/src/models/note.dart';
import 'package:app/src/widgets/home/animated_tile.dart';
import 'package:flutter/material.dart';

class AnimatedGridLayoutBuilder extends StatelessWidget {
  final List<Note> notes;
  final Widget Function(BuildContext context, Note note, int index) itemBuilder;
  const AnimatedGridLayoutBuilder({
    super.key,
    required this.notes,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const crossAxisCount = 2;
        final mainAxisSpacing = ResponsiveUtils.spacing(SpacingSize.small);
        final crossAxisSpacing = ResponsiveUtils.spacing(SpacingSize.small);
        const childAspectRatio = 0.75;

        final tileWidth =
            (constraints.maxWidth - (crossAxisCount - 1) * crossAxisSpacing) /
            crossAxisCount;
        final tileHeight = tileWidth / childAspectRatio;

        final rowCount = (notes.length / crossAxisCount).ceil();
        final totalHeight =
            rowCount * tileHeight + (rowCount - 1) * mainAxisSpacing;

        return SizedBox(
          height: totalHeight,
          child: Stack(
            children: [
              for (int index = 0; index < notes.length; index++)
                AnimatedTile(
                  key: ValueKey('note-${notes[index].id}'),
                  noteId: notes[index].id,
                  left:
                      (index % crossAxisCount) *
                      (tileWidth + crossAxisSpacing),
                  top:
                      (index ~/ crossAxisCount) *
                      (tileHeight + mainAxisSpacing),
                  tileWidth: tileWidth,
                  tileHeight: tileHeight,
                  child: itemBuilder(context, notes[index], index),
                ),
            ],
          ),
        );
      },
    );
  }
}
