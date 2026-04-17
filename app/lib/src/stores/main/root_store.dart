import 'package:app/src/stores/authentication/auth_store.dart';
import 'package:app/src/stores/authentication/user_profile_store.dart';
import 'package:mobx/mobx.dart';
part 'root_store.g.dart';

// ignore: library_private_types_in_public_api
class RootStore = _RootStoreBase with _$RootStore;

abstract class _RootStoreBase with Store {
  late final UserProfileStore userProfileStore;
  late final AuthStore authStore;

  _RootStoreBase() {
    userProfileStore = UserProfileStore(root: this as RootStore);
    authStore = AuthStore(root: this as RootStore);
  }

  void dispose() {

  }
}
