import 'package:app/src/stores/main/root_store.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

// ignore: library_private_types_in_public_api
class ProfileStore = _ProfileStoreBase with _$ProfileStore;

class ProfileActionResult {
  final bool success;
  final String message;

  const ProfileActionResult._({required this.success, required this.message});

  const ProfileActionResult.success(String message)
    : this._(success: true, message: message);

  const ProfileActionResult.failure(String message)
    : this._(success: false, message: message);
}

abstract class _ProfileStoreBase with Store {
  final RootStore root;

  final TextEditingController usernameController = TextEditingController();
  final FocusNode usernameFocusNode = FocusNode();

  bool _didPrefillUsername = false;

  _ProfileStoreBase({required this.root});

  @observable
  bool hasUsernameInput = false;

  @computed
  bool get isBusy => root.authStore.isLoading;

  @computed
  bool get canSubmitUsername => hasUsernameInput && !isBusy;

  @action
  void prefillUsernameIfNeeded() {
    if (_didPrefillUsername) {
      return;
    }

    final String initialName = (root.userProfileStore.displayName ?? '').trim();
    if (initialName.isNotEmpty) {
      usernameController.text = initialName;
      hasUsernameInput = true;
    }

    _didPrefillUsername = true;
  }

  @action
  void onUsernameChanged(String value) {
    final bool nextHasInput = value.trim().isNotEmpty;
    if (nextHasInput == hasUsernameInput) {
      return;
    }
    hasUsernameInput = nextHasInput;
  }

  @action
  Future<ProfileActionResult> updateUsername() async {
    final String newName = usernameController.text.trim();

    usernameFocusNode.unfocus();

    if (newName.isEmpty) {
      return const ProfileActionResult.failure('Informe um nome de usuário.');
    }

    final bool didUpdate = await root.authStore.updateDisplayName(newName);

    if (didUpdate) {
      usernameController.clear();
      hasUsernameInput = false;
      return const ProfileActionResult.success('Nome de usuário atualizado.');
    }

    return const ProfileActionResult.failure(
      'Não foi possível atualizar seu usuário.',
    );
  }

  @action
  Future<ProfileActionResult> deleteAccountWithPassword(String password) async {
    final String trimmedPassword = password.trim();

    if (trimmedPassword.isEmpty) {
      return const ProfileActionResult.failure('Informe sua senha.');
    }

    final bool didDelete = await root.authStore.deleteAccountWithPassword(
      trimmedPassword,
    );

    if (didDelete) {
      return const ProfileActionResult.success('Conta excluída.');
    }

    return const ProfileActionResult.failure(
      'Não foi possível excluir a conta. Verifique sua senha.',
    );
  }

  @action
  void dispose() {
    usernameController.dispose();
    usernameFocusNode.dispose();
  }
}
