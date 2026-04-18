import 'package:app/src/stores/main/root_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'user_profile_store.g.dart';

// ignore: library_private_types_in_public_api
class UserProfileStore = _UserProfileStoreBase with _$UserProfileStore;

abstract class _UserProfileStoreBase with Store {
  final RootStore root;

  _UserProfileStoreBase({required this.root});

  @observable
  bool isLoggedIn = false;

  @observable
  String? uid;

  @observable
  String? displayName;

  @observable
  String? email;

  @action
  void setUser(User user) {
    uid = user.uid;
    displayName = user.displayName;
    email = user.email;
    isLoggedIn = true;
  }

  @action
  void clearUser() {
    uid = null;
    displayName = null;
    email = null;
    isLoggedIn = false;
  }
}
