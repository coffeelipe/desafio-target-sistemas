import 'package:app/src/models/note.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class ThumbOptions extends StatelessWidget {
  final Note note;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  const ThumbOptions({
    super.key,
    required this.note,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildActionButton(onPressed: onEdit, icon: RemixIcons.pencil_line),
        _buildActionButton(
          onPressed: onDelete,
          icon: RemixIcons.delete_bin_line,
        ),
      ],
    );
  }

  IconButton _buildActionButton({
    required VoidCallback? onPressed,
    required IconData icon,
  }) {
    return IconButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
      splashRadius: 18,
      icon: Icon(icon, size: 20),
    );
  }
}
