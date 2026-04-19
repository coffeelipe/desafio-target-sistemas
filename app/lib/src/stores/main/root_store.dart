import 'package:app/src/stores/authentication/auth_store.dart';
import 'package:app/src/stores/authentication/user_profile_store.dart';
import 'package:app/src/stores/firestorage/firestorage_store.dart';
import 'package:app/src/stores/home/note_store.dart';
import 'package:app/src/stores/profile/profile_store.dart';
import 'package:mobx/mobx.dart';
part 'root_store.g.dart';

// ignore: library_private_types_in_public_api
class RootStore = _RootStoreBase with _$RootStore;

abstract class _RootStoreBase with Store {
  late final NoteStore noteStore;
  late final UserProfileStore userProfileStore;
  late final AuthStore authStore;
  late final ProfileStore profileStore;
  late final FirestorageStore firestorageStore;

  _RootStoreBase() {
    noteStore = NoteStore(root: this as RootStore);
    userProfileStore = UserProfileStore(root: this as RootStore);
    firestorageStore = FirestorageStore(root: this as RootStore);
    authStore = AuthStore(root: this as RootStore);
    profileStore = ProfileStore(root: this as RootStore);
  }

  void dispose() {
    authStore.dispose();
    profileStore.dispose();
    firestorageStore.dispose();
  }
}
