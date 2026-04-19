import 'dart:async';

import 'package:app/src/core/extensions/mediaquery_extension.dart';
import 'package:app/src/models/note.dart';
import 'package:app/src/stores/main/root_store.dart';
import 'package:app/src/widgets/home/note/note_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'note_store.g.dart';

// ignore: library_private_types_in_public_api
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

  final Map<String, Timer> _deletionTimers = {};

  @observable
  ObservableMap<String, double> deletionProgress = ObservableMap();

  @observable
  ObservableList<Note> notes = ObservableList();

  @observable
  bool isFullScreenEditing = false;

  @observable
  ObservableList<Note> markedForDeletion = ObservableList();

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
      print('created note with id: ${notes.last.id}');
    }
  }

  @action
  Future<void> deleteNote(Note note) async {
    markedForDeletion.add(note);

    const duration = Duration(seconds: 10);
    const tickDuration = Duration(milliseconds: 100);
    final totalTicks = duration.inMilliseconds / tickDuration.inMilliseconds;
    int ticks = 0;

    deletionProgress[note.id] = 0.0;

    _deletionTimers[note.id] = Timer.periodic(tickDuration, (timer) {
      runInAction(() {
        ticks++;
        deletionProgress[note.id] = ticks / totalTicks;

        if (ticks >= totalTicks) {
          timer.cancel();
          _deletionTimers.remove(note.id);
          if (markedForDeletion.any((n) => n.id == note.id)) {
            notes.removeWhere((n) => n.id == note.id);
            markedForDeletion.removeWhere((n) => n.id == note.id);
            deletionProgress.remove(note.id);
          }
        }
      });
    });
  }

  @action
  void undoDelete(Note note) {
    _deletionTimers[note.id]?.cancel();
    _deletionTimers.remove(note.id);
    markedForDeletion.removeWhere((n) => n.id == note.id);
    deletionProgress.remove(note.id);
  }

  @action
  void updateNote(Note note) {
    final index = notes.indexWhere((n) => n.id == note.id);
    if (index != -1) {
      notes[index] = note;
    }
    dialogContentController.clear();
    dialogTitleController.clear();
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
                      ? () {
                          createNote();
                          Navigator.of(context).pop();
                        }
                      : () {
                          _parseAndSetNoteContent(
                            note: note,
                            updatedContent: dialogContentController.text,
                            updatedTitle:
                                dialogTitleController.text.trim().isEmpty
                                ? null
                                : dialogTitleController.text.trim(),
                          );
                          Navigator.of(context).pop();
                        },
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

  @action
  void handleFullScreenButtonPress(Note note) {
    isFullScreenEditing = !isFullScreenEditing;
    if (isFullScreenEditing) {
      if (note.content != fullScreenContentController.text) {
        _parseAndSetNoteContent(
          note: note,
          updatedContent: fullScreenContentController.text,
          updatedTitle: fullScreenTitleController.text.trim().isEmpty
              ? null
              : fullScreenTitleController.text.trim(),
        );
      }
    } else {
      fullScreenContentController.text = note.content;
      fullScreenTitleController.text = note.title ?? 'Sem título';
      fullScreenContentFocusNode.requestFocus();
    }
  }

  @action
  void _parseAndSetNoteContent({
    required Note note,
    required String updatedContent,
    String? updatedTitle,
  }) {
    final updatedNote = Note.fromContent(
      id: note.id,
      title: updatedTitle,
      content: updatedContent,
    );
    updateNote(updatedNote);
  }

  @action
  int _getNextAvailableId() {
    if (notes.isEmpty) return 1;
    return notes
            .map((note) => int.tryParse(note.id) ?? 0)
            .reduce((prev, curr) => curr > prev ? curr : prev) +
        1;
  }

  @action
  void dispose() {
    dialogTitleController.dispose();
    dialogContentController.dispose();
    fullScreenTitleController.dispose();
    fullScreenContentController.dispose();
    fullScreenContentFocusNode.dispose();
    fullScreenScrollController.dispose();
  }
}
