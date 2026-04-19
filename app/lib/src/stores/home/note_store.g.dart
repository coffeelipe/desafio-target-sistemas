// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteStore on _NoteStoreBase, Store {
  Computed<int>? _$totalLinesComputed;

  @override
  int get totalLines => (_$totalLinesComputed ??= Computed<int>(
    () => super.totalLines,
    name: '_NoteStoreBase.totalLines',
  )).value;
  Computed<int>? _$totalNotesComputed;

  @override
  int get totalNotes => (_$totalNotesComputed ??= Computed<int>(
    () => super.totalNotes,
    name: '_NoteStoreBase.totalNotes',
  )).value;
  Computed<int>? _$totalWordsComputed;

  @override
  int get totalWords => (_$totalWordsComputed ??= Computed<int>(
    () => super.totalWords,
    name: '_NoteStoreBase.totalWords',
  )).value;
  Computed<int>? _$totalCharactersComputed;

  @override
  int get totalCharacters => (_$totalCharactersComputed ??= Computed<int>(
    () => super.totalCharacters,
    name: '_NoteStoreBase.totalCharacters',
  )).value;
  Computed<int>? _$totalLettersComputed;

  @override
  int get totalLetters => (_$totalLettersComputed ??= Computed<int>(
    () => super.totalLetters,
    name: '_NoteStoreBase.totalLetters',
  )).value;
  Computed<int>? _$totalDigitsComputed;

  @override
  int get totalDigits => (_$totalDigitsComputed ??= Computed<int>(
    () => super.totalDigits,
    name: '_NoteStoreBase.totalDigits',
  )).value;
  Computed<int>? _$totalSpecialCharactersComputed;

  @override
  int get totalSpecialCharacters =>
      (_$totalSpecialCharactersComputed ??= Computed<int>(
        () => super.totalSpecialCharacters,
        name: '_NoteStoreBase.totalSpecialCharacters',
      )).value;
  Computed<int>? _$totalWhitespaceCharactersComputed;

  @override
  int get totalWhitespaceCharacters =>
      (_$totalWhitespaceCharactersComputed ??= Computed<int>(
        () => super.totalWhitespaceCharacters,
        name: '_NoteStoreBase.totalWhitespaceCharacters',
      )).value;
  Computed<int>? _$totalEditsComputed;

  @override
  int get totalEdits => (_$totalEditsComputed ??= Computed<int>(
    () => super.totalEdits,
    name: '_NoteStoreBase.totalEdits',
  )).value;

  late final _$deletionProgressAtom = Atom(
    name: '_NoteStoreBase.deletionProgress',
    context: context,
  );

  @override
  ObservableMap<String, double> get deletionProgress {
    _$deletionProgressAtom.reportRead();
    return super.deletionProgress;
  }

  @override
  set deletionProgress(ObservableMap<String, double> value) {
    _$deletionProgressAtom.reportWrite(value, super.deletionProgress, () {
      super.deletionProgress = value;
    });
  }

  late final _$notesAtom = Atom(name: '_NoteStoreBase.notes', context: context);

  @override
  ObservableList<Note> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(ObservableList<Note> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  late final _$noteEditCountsAtom = Atom(
    name: '_NoteStoreBase.noteEditCounts',
    context: context,
  );

  @override
  ObservableMap<String, int> get noteEditCounts {
    _$noteEditCountsAtom.reportRead();
    return super.noteEditCounts;
  }

  @override
  set noteEditCounts(ObservableMap<String, int> value) {
    _$noteEditCountsAtom.reportWrite(value, super.noteEditCounts, () {
      super.noteEditCounts = value;
    });
  }

  late final _$isFullScreenEditingAtom = Atom(
    name: '_NoteStoreBase.isFullScreenEditing',
    context: context,
  );

  @override
  bool get isFullScreenEditing {
    _$isFullScreenEditingAtom.reportRead();
    return super.isFullScreenEditing;
  }

  @override
  set isFullScreenEditing(bool value) {
    _$isFullScreenEditingAtom.reportWrite(value, super.isFullScreenEditing, () {
      super.isFullScreenEditing = value;
    });
  }

  late final _$markedForDeletionAtom = Atom(
    name: '_NoteStoreBase.markedForDeletion',
    context: context,
  );

  @override
  ObservableList<Note> get markedForDeletion {
    _$markedForDeletionAtom.reportRead();
    return super.markedForDeletion;
  }

  @override
  set markedForDeletion(ObservableList<Note> value) {
    _$markedForDeletionAtom.reportWrite(value, super.markedForDeletion, () {
      super.markedForDeletion = value;
    });
  }

  late final _$deleteNoteAsyncAction = AsyncAction(
    '_NoteStoreBase.deleteNote',
    context: context,
  );

  @override
  Future<void> deleteNote(Note note) {
    return _$deleteNoteAsyncAction.run(() => super.deleteNote(note));
  }

  late final _$showNewNoteDialogAsyncAction = AsyncAction(
    '_NoteStoreBase.showNewNoteDialog',
    context: context,
  );

  @override
  Future<void> showNewNoteDialog(BuildContext context, Note? note) {
    return _$showNewNoteDialogAsyncAction.run(
      () => super.showNewNoteDialog(context, note),
    );
  }

  late final _$_NoteStoreBaseActionController = ActionController(
    name: '_NoteStoreBase',
    context: context,
  );

  @override
  void createNote() {
    final _$actionInfo = _$_NoteStoreBaseActionController.startAction(
      name: '_NoteStoreBase.createNote',
    );
    try {
      return super.createNote();
    } finally {
      _$_NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void undoDelete(Note note) {
    final _$actionInfo = _$_NoteStoreBaseActionController.startAction(
      name: '_NoteStoreBase.undoDelete',
    );
    try {
      return super.undoDelete(note);
    } finally {
      _$_NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateNote(Note note) {
    final _$actionInfo = _$_NoteStoreBaseActionController.startAction(
      name: '_NoteStoreBase.updateNote',
    );
    try {
      return super.updateNote(note);
    } finally {
      _$_NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleFullScreenButtonPress(Note note) {
    final _$actionInfo = _$_NoteStoreBaseActionController.startAction(
      name: '_NoteStoreBase.handleFullScreenButtonPress',
    );
    try {
      return super.handleFullScreenButtonPress(note);
    } finally {
      _$_NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _parseAndSetNoteContent({
    required Note note,
    required String updatedContent,
    String? updatedTitle,
  }) {
    final _$actionInfo = _$_NoteStoreBaseActionController.startAction(
      name: '_NoteStoreBase._parseAndSetNoteContent',
    );
    try {
      return super._parseAndSetNoteContent(
        note: note,
        updatedContent: updatedContent,
        updatedTitle: updatedTitle,
      );
    } finally {
      _$_NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int _getNextAvailableId() {
    final _$actionInfo = _$_NoteStoreBaseActionController.startAction(
      name: '_NoteStoreBase._getNextAvailableId',
    );
    try {
      return super._getNextAvailableId();
    } finally {
      _$_NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_NoteStoreBaseActionController.startAction(
      name: '_NoteStoreBase.dispose',
    );
    try {
      return super.dispose();
    } finally {
      _$_NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
deletionProgress: ${deletionProgress},
notes: ${notes},
noteEditCounts: ${noteEditCounts},
isFullScreenEditing: ${isFullScreenEditing},
markedForDeletion: ${markedForDeletion},
totalLines: ${totalLines},
totalNotes: ${totalNotes},
totalWords: ${totalWords},
totalCharacters: ${totalCharacters},
totalLetters: ${totalLetters},
totalDigits: ${totalDigits},
totalSpecialCharacters: ${totalSpecialCharacters},
totalWhitespaceCharacters: ${totalWhitespaceCharacters},
totalEdits: ${totalEdits}
    ''';
  }
}
