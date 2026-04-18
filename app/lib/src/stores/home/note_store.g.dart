// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteStore on _NoteStoreBase, Store {
  late final _$notesAtom = Atom(name: '_NoteStoreBase.notes', context: context);

  @override
  List<Note> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(List<Note> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  late final _$showNewNoteDialogAsyncAction = AsyncAction(
    '_NoteStoreBase.showNewNoteDialog',
    context: context,
  );

  @override
  Future<void> showNewNoteDialog(BuildContext context) {
    return _$showNewNoteDialogAsyncAction.run(
      () => super.showNewNoteDialog(context),
    );
  }

  late final _$_NoteStoreBaseActionController = ActionController(
    name: '_NoteStoreBase',
    context: context,
  );

  @override
  void openNote() {
    final _$actionInfo = _$_NoteStoreBaseActionController.startAction(
      name: '_NoteStoreBase.openNote',
    );
    try {
      return super.openNote();
    } finally {
      _$_NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
  void deleteNote() {
    final _$actionInfo = _$_NoteStoreBaseActionController.startAction(
      name: '_NoteStoreBase.deleteNote',
    );
    try {
      return super.deleteNote();
    } finally {
      _$_NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateNote() {
    final _$actionInfo = _$_NoteStoreBaseActionController.startAction(
      name: '_NoteStoreBase.updateNote',
    );
    try {
      return super.updateNote();
    } finally {
      _$_NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notes: ${notes}
    ''';
  }
}
