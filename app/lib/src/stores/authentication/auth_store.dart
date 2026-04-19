import 'dart:async';

// ignore_for_file: avoid_print

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
  late final StreamSubscription<User?> _authSubscription;

  late final RegistrationFormState formStateStore;
  late final LoginFormState loginFormState;

  _AuthStoreBase({required this.root}) : _authService = AuthService() {
    formStateStore = RegistrationFormState(authStore: this as AuthStore);
    loginFormState = LoginFormState(authStore: this as AuthStore);
    _authSubscription = FirebaseAuth.instance.authStateChanges().listen(
      _onAuthStateChanged,
    );
  }

  @observable
  bool isInitializing = true;

  @observable
  bool isLoading = false;

  @observable
  UserCredential? credential;

  @observable
  bool isLoggedInServerSide = false;

  @observable
  String? authErrorMessage;

  @action
  void clearAuthError() {
    authErrorMessage = null;
  }

  String _mapAuthErrorToMessage(Object error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'invalid-credential':
        case 'wrong-password':
        case 'user-not-found':
          return 'Credenciais inválidas. Verifique email e senha.';
        case 'invalid-email':
          return 'Email inválido.';
        case 'email-already-in-use':
          return 'Este email já está em uso.';
        case 'weak-password':
          return 'Senha fraca. Use uma senha mais forte.';
        case 'network-request-failed':
          return 'Sem conexão. Verifique sua internet e tente novamente.';
        default:
          return error.message ?? 'Não foi possível concluir a autenticação.';
      }
    }

    return 'Não foi possível concluir a autenticação.';
  }

  @action
  Future<void> createNewUser(
    String email,
    String password,
    String displayName,
  ) async {
    isLoading = true;
    clearAuthError();

    try {
      credential = await _authService.registerUser(
        email,
        password,
        displayName,
      );

      if (credential == null) {
        authErrorMessage = 'Não foi possível criar sua conta. Tente novamente.';
        return;
      }

      User? user = await _authService.getCurrentUser();
      if (user == null && credential != null) {

        credential = await _authService.loginWithEmailAndPassword(
          email,
          password,
        );
        user = await _authService.getCurrentUser();
      }

      if (user != null) {
        root.userProfileStore.setUser(user);
        isLoggedInServerSide = true;
      } else {
        authErrorMessage =
            'Conta criada, mas não foi possível autenticar automaticamente.';
      }
    } on FirebaseAuthException catch (e) {
      authErrorMessage = _mapAuthErrorToMessage(e);
      print(e);
    } catch (e) {
      authErrorMessage = _mapAuthErrorToMessage(e);
      print(e);
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    isLoading = true;
    clearAuthError();

    try {
      final User? user;

      credential = await _authService.loginWithEmailAndPassword(
        email,
        password,
      );

      if (credential == null) {
        authErrorMessage =
            'Não foi possível entrar. Verifique suas credenciais e tente novamente.';
        return;
      }

      user = await _authService.getCurrentUser();
      if (user != null) {
        root.userProfileStore.setUser(user);
        isLoggedInServerSide = true;
      } else {
        authErrorMessage =
            'Login realizado, mas não foi possível carregar o usuário.';
      }
    } on FirebaseAuthException catch (e) {
      authErrorMessage = _mapAuthErrorToMessage(e);
      print(e);
    } catch (e) {
      authErrorMessage = _mapAuthErrorToMessage(e);
      print(e);
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> signOut() async {
    isLoading = true;

    try {
      await _authService.signOut();
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<bool> updateDisplayName(String newName) async {
    isLoading = true;

    try {
      final bool didUpdate = await _authService.updateUserDisplayName(newName);
      if (!didUpdate) {
        return false;
      }

      final User? user = await _authService.getCurrentUser();
      if (user != null) {
        root.userProfileStore.setUser(user);
      }

      return true;
    } catch (e) {
      print(e);
      return false;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<bool> deleteAccountWithPassword(String password) async {
    isLoading = true;

    try {
      final User? user = await _authService.getCurrentUser();
      final String? email = user?.email;
      if (email == null) {
        return false;
      }

      final bool didReauthenticate = await _authService
          .reauthenticateWithPassword(email: email, password: password);
      if (!didReauthenticate) {
        return false;
      }

      final bool didDelete = await _authService.deleteCurrentUser();
      return didDelete;
    } catch (e) {
      print(e);
      return false;
    } finally {
      isLoading = false;
    }
  }

  @action
  void _onAuthStateChanged(User? user) {
    isLoggedInServerSide = user != null;
    if (user == null) {
      root.userProfileStore.clearUser();
    } else {
      root.userProfileStore.setUser(user);
    }
    root.firestorageStore.onAuthChanged(user);
    isInitializing = false;
  }

  void dispose() {
    _authSubscription.cancel();
  }
}
