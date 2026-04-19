import 'package:app/src/core/extensions/mediaquery_extension.dart';
import 'package:app/src/models/note.dart';
import 'package:app/src/stores/main/root_store.dart';
import 'package:app/src/widgets/home/note/note_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'note_store.g.dart';

class NoteStore = _NoteStoreBase with _$NoteStore;

abstract class _NoteStoreBase with Store {
  late final RootStore root;
  _NoteStoreBase({required this.root});

  final TextEditingController dialogTitleController = TextEditingController();
  final TextEditingController dialogContentController = TextEditingController();

  final TextEditingController fullScreenTitleController =
      TextEditingController();
  final TextEditingController fullScreenContentController =
      TextEditingController();
  final FocusNode fullScreenContentFocusNode = FocusNode();
  final ScrollController fullScreenScrollController = ScrollController();

  @observable
  List<Note> notes = [];

  @observable
  bool isFullScreenEditing = false;

  @action
  void createNote() {
    if (dialogContentController.text.trim().isNotEmpty) {
      notes.add(
        Note.fromContent(
          id: _getNextAvailableId().toString(),
          title: dialogTitleController.text.trim().isEmpty
              ? null
              : dialogTitleController.text.trim(),
          content: dialogContentController.text,
        ),
      );
      dialogTitleController.clear();
      dialogContentController.clear();
      root.navigatorKey.currentState?.pop();
    }
  }

  @action
  void deleteNote(Note note) {
    notes.removeWhere((n) => n.id == note.id);
  }

  @action
  void updateNote(Note note) {
    final index = notes.indexWhere((n) => n.id == note.id);
    if (index != -1) {
      notes[index] = note;
    }
    dialogContentController.clear();
    dialogTitleController.clear();
    root.navigatorKey.currentState?.pop();
  }

  @action
  Future<void> showNewNoteDialog(BuildContext context, Note? note) async {
    await showDialog(
      context: context,
      builder: (_) {
        final bottomInset = context.mediaQuery.viewInsets.bottom;
        return TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 1),
          duration: Durations.short4,
          curve: Curves.easeOutBack,
          builder: (context, value, child) =>
              Transform.scale(scale: value, child: child),
          child: AnimatedPadding(
            duration: Durations.short4,
            padding: EdgeInsets.only(bottom: bottomInset),
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: NoteDialog(
                  onPrimaryPressed: note == null
                      ? createNote
                      : () => _parseAndSetNoteContent(
                          note: note,
                          updatedContent: dialogContentController.text,
                          updatedTitle:
                              dialogTitleController.text.trim().isEmpty
                              ? null
                              : dialogTitleController.text.trim(),
                        ),
                  dialogTitle: note == null ? 'Nova nota' : 'Editar nota',
                  initialTitle: note?.title,
                  initialContent: note?.content,
                  titleController: dialogTitleController,
                  contentController: dialogContentController,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
