// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteStore on _NoteStoreBase, Store {
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
  void deleteNote(Note note) {
    final _$actionInfo = _$_NoteStoreBaseActionController.startAction(
      name: '_NoteStoreBase.deleteNote',
    );
    try {
      return super.deleteNote(note);
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
notes: ${notes},
isFullScreenEditing: ${isFullScreenEditing}
    ''';
  }
}
