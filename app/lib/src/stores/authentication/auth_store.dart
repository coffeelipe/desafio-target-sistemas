import 'package:app/src/services/authentication/auth_service.dart';
import 'package:app/src/stores/authentication/login_form_state.dart';
import 'package:app/src/stores/authentication/registration_form_state.dart';
import 'package:app/src/stores/main/root_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

// ignore: library_private_types_in_public_api
class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final RootStore root;
  final AuthService _authService;

  late final RegistrationFormState formStateStore;
  late final LoginFormState loginFormState;

  _AuthStoreBase({required this.root}) : _authService = AuthService() {
    formStateStore = RegistrationFormState(authStore: this as AuthStore);
    loginFormState = LoginFormState(authStore: this as AuthStore);
    _init();
  }

  @observable
  bool isInitializing = true;

  @observable
  bool isLoading = false;

  @observable
  UserCredential? credential;

  @observable
  bool isLoggedInServerSide = false;

  @action
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

  @action
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    isLoading = true;

    try {
      final User? user;

      credential = await _authService.loginWithEmailAndPassword(
        email,
        password,
      );

      user = await _authService.getCurrentUser();
      if (user != null) {
        root.userProfileStore.setUser(user);
        isLoggedInServerSide = true;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> setLoggedInStatus() async {
    try {
      final User? user = await _authService.getCurrentUser();
      isLoggedInServerSide = user != null;
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> _init() async {
    await setLoggedInStatus();
    isInitializing = false;
  }
}
