import 'dart:async';

import 'package:app/src/models/note.dart';
import 'package:app/src/services/firestorage.dart';
import 'package:app/src/stores/main/root_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'firestorage_store.g.dart';

// ignore: library_private_types_in_public_api
class FirestorageStore = _FirestorageStoreBase with _$FirestorageStore;

abstract class _FirestorageStoreBase with Store {
  final RootStore root;
  final FirestorageService _service;

  String? _activeUid;
  bool _didHydrateForActiveUid = false;

  _FirestorageStoreBase({required this.root}) : _service = FirestorageService();

  @observable
  bool isSyncing = false;

  void onAuthChanged(User? user) {
    if (user == null) {
      _activeUid = null;
      _didHydrateForActiveUid = false;
      root.noteStore.clearAll();
      return;
    }

    final String nextUid = user.uid;
    final bool isSameUser = _activeUid == nextUid;

    _activeUid = nextUid;

    if (isSameUser && _didHydrateForActiveUid) {
      return;
    }

    _didHydrateForActiveUid = true;
    unawaited(_hydrateForUser(user));
  }

  Future<void> upsertNote(Note note) async {
    final String? uid = _activeUid;
    if (uid == null) return;
    await _service.upsertNote(uid, note);
  }

  Future<void> deleteNote(String noteId) async {
    final String? uid = _activeUid;
    if (uid == null) return;
    await _service.deleteNote(uid, noteId);
  }

  Future<void> _hydrateForUser(User user) async {
    runInAction(() => isSyncing = true);

    try {
      await _service.ensureUserDoc(user);
      final notes = await _service.fetchNotes(user.uid);
      root.noteStore.hydrateFromRemote(notes);
    } finally {
      runInAction(() => isSyncing = false);
    }
  }

  void dispose() {
    // no-op for now
  }
}
