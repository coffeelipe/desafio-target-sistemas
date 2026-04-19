import 'package:app/src/core/error/validation_patterns.dart';
import 'package:app/src/core/utils/validation_utils.dart';
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

  final GlobalKey<FormState> usernameFormKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final FocusNode usernameFocusNode = FocusNode();

  bool _didPrefillUsername = false;

  _ProfileStoreBase({required this.root});

  @observable
  String usernameInput = '';

  @computed
  bool get hasUsernameInput => usernameInput.trim().isNotEmpty;

  @computed
  bool get isBusy => root.authStore.isLoading;

  @computed
  bool get canSubmitUsername => validateUsername(usernameInput) == null && !isBusy;

  String? validateUsername(String? value) {
    final String nextValue = value ?? '';
    final RegExp validationPattern = ValidationPatterns.usernameRegex;

    if (nextValue.isEmpty || !validationPattern.hasMatch(nextValue)) {
      return ValidationUtils.computeErrorMessage(FieldType.username, nextValue);
    }
    return null;
  }

  @action
  void prefillUsernameIfNeeded() {
    if (_didPrefillUsername) {
      return;
    }

    final String initialName = (root.userProfileStore.displayName ?? '').trim();
    if (initialName.isNotEmpty) {
      usernameController.text = initialName;
      usernameInput = initialName;
    }

    _didPrefillUsername = true;
  }

  @action
  void onUsernameChanged(String value) {
    usernameInput = value;
  }

  @action
  Future<ProfileActionResult> updateUsername() async {
    usernameFormKey.currentState?.validate();

    final String newName = usernameController.text;

    usernameFocusNode.unfocus();

    final String? validationError = validateUsername(newName);
    if (validationError != null) {
      return ProfileActionResult.failure(validationError);
    }

    final bool didUpdate = await root.authStore.updateDisplayName(newName.trim());

    if (didUpdate) {
      usernameController.clear();
      usernameInput = '';
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
