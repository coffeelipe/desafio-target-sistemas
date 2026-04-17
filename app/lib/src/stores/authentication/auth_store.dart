import 'package:app/src/services/authentication/auth_service.dart';
import 'package:app/src/stores/authentication/registration_form_state.dart';
import 'package:app/src/stores/main/root_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final RootStore root;
  final AuthService _authService;

  late final RegistrationFormState formStateStore;

  _AuthStoreBase({required this.root}) : _authService = AuthService() {
    formStateStore = RegistrationFormState(authStore: this as AuthStore);
  }

  @observable
  bool isLoading = false;

  @observable
  UserCredential? credential;

  Future<void> createNewUser(
    String email,
    String password,
    String displayName,
  ) async {
    isLoading = true;

    try {
      credential = await _authService.registerUser(
        email,
        password,
        displayName,
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    } finally {
      isLoading = false;
    }
  }
}
