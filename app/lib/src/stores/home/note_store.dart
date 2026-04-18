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

  @observable
  List<Note> notes = [];

  @action
  void openNote() {
    // open the note dialog with the content of the selected note thumbnail
  }

  @action
  void createNote() {
    // create a new note and add it to the list of note thumbnails
  }

  @action
  void deleteNote() {
    // delete the selected note and remove it from the list of note thumbnails
  }

  @action
  void updateNote() {
    // update the content of the selected note and update the corresponding note thumbnail
  }

  @action
  Future<void> showNewNoteDialog(BuildContext context) async {
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
            child: const Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: NoteDialog(),
              ),
            ),
          ),
        );
      },
    );
  }
}
