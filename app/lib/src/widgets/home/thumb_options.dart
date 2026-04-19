import 'package:app/src/core/theme/app_palette.dart';
import 'package:app/src/models/note.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class ThumbOptions extends StatelessWidget {
  final Note note;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final bool isMarkedForDeletion;
  final double? progress;
  const ThumbOptions({
    super.key,
    required this.note,
    this.onEdit,
    this.onDelete,
    this.isMarkedForDeletion = false,
    this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildActionButton(onPressed: onEdit, icon: RemixIcons.pencil_line),
        SizedBox.square(
          dimension: 32,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (onDelete != null && progress != null)
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: CircularProgressIndicator(
                      value: progress!.clamp(0, 1),
                      color: AppPalette.primary,
                      strokeWidth: 2,
                    ),
                  ),
                ),
              _buildActionButton(
                onPressed: onDelete,
                icon: isMarkedForDeletion
                    ? RemixIcons.arrow_go_back_line
                    : RemixIcons.delete_bin_line,
                color: AppPalette.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }

  IconButton _buildActionButton({
    required VoidCallback? onPressed,
    required IconData icon,
    Color? color,
  }) {
    return IconButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
      splashRadius: 18,
      iconSize: 20,
      icon: Icon(icon, color: color),
    );
  }
}
