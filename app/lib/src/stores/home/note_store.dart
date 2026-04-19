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
