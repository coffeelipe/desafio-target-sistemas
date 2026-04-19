import 'package:app/src/core/theme/app_palette.dart';
import 'package:app/src/models/note.dart';
import 'package:app/src/widgets/home/thumb_options.dart';
import 'package:flutter/material.dart';

class NoteThumbnail extends StatelessWidget {
  final Note note;
  final int index;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  const NoteThumbnail({
    super.key,
    required this.note,
    required this.index,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: (index % 4 == 0 || index % 4 == 3)
              ? Colors.white
              : Colors.yellow[200],
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        // padding: EdgeInsets.all(ResponsiveUtils.spacing(SpacingSize.small)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ThumbOptions(note: note, onEdit: onEdit, onDelete: onDelete),
            if (note.title != null && note.title!.trim().isNotEmpty) ...[
              Text(
                note.title ?? '',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppPalette.primaryVariant,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            Expanded(
              child: Text(
                note.content,
                style: const TextStyle(fontSize: 12),
                maxLines: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
