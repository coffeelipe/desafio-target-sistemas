import 'package:app/src/core/extensions/mediaquery_extension.dart';
import 'package:app/src/core/theme/app_palette.dart';
import 'package:app/src/core/theme/app_typography.dart';
import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:app/src/stores/authentication/auth_store.dart';
import 'package:app/src/stores/main/root_store.dart';
import 'package:app/src/stores/profile/profile_store.dart';
import 'package:app/src/widgets/global/custom_elevated_button.dart';
import 'package:app/src/widgets/global/custom_text_form_field.dart';
import 'package:app/src/widgets/profile/delete_account_dialog.dart';
import 'package:app/src/widgets/profile/glassy_profile_section.dart';
import 'package:app/src/widgets/profile/logout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

// TODO: Refatorar para usar state management
// TODO: Adicionar integração com backend (atualizar usuário, excluir conta)
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ProfileStore _profileStore;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _profileStore = context.read<RootStore>().profileStore;
    _profileStore.prefillUsernameIfNeeded();
  }

  @override
  Widget build(BuildContext context) {
    final RootStore rootStore = context.read<RootStore>();
    final AuthStore authStore = rootStore.authStore;
    final ProfileStore profileStore = rootStore.profileStore;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        ResponsiveUtils.spacing(SpacingSize.medium),
        ResponsiveUtils.spacing(SpacingSize.medium),
        ResponsiveUtils.spacing(SpacingSize.medium),
        context.safeBottom + 140,
      ),
      child: ListView(
        children: [
          const Text('Configurações', style: AppTypography.heading1),
          const SizedBox(height: 8),
          Text(
            'Ajuste seus dados do perfil.',
            style: TextStyle(
              color: AppPalette.caption.withValues(alpha: 0.8),
              fontSize: 16,
            ),
          ),
          SizedBox(height: ResponsiveUtils.spacing(SpacingSize.medium)),
          GlassyProfileSection(
            title: 'Nome de usuário',
            icon: Icons.person_outline_rounded,
            iconColor: AppPalette.primary,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: profileStore.usernameController,
                  focusNode: profileStore.usernameFocusNode,
                  label: 'Usuário',
                  hintText: 'Seu novo nome de usuário',
                  maxLength: 16,
                  keyboardType: TextInputType.name,
                  onChanged: profileStore.onUsernameChanged,
                ),
                SizedBox(height: ResponsiveUtils.spacing(SpacingSize.small)),
                Observer(
                  builder: (_) {
                    final bool isBusy = profileStore.isBusy;
                    final bool canSubmit = profileStore.canSubmitUsername;

                    return Opacity(
                      opacity: canSubmit ? 1 : 0.45,
                      child: IgnorePointer(
                        ignoring: !canSubmit,
                        child: GradientButton(
                          onPressed: () => _handleUpdateUsername(profileStore),
                          child: isBusy
                              ? const Center(child: CircularProgressIndicator())
                              : const Text(
                                  'Atualizar usuário',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: ResponsiveUtils.spacing(SpacingSize.medium)),
          GlassyProfileSection(
            title: 'Sessão',
            icon: Icons.logout_rounded,
            iconColor: AppPalette.caption,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Encerre sua sessão neste dispositivo.',
                  style: TextStyle(
                    color: AppPalette.caption.withValues(alpha: 0.8),
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: ResponsiveUtils.spacing(SpacingSize.small)),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: Observer(
                    builder: (_) {
                      final bool isBusy = authStore.isLoading;
                      return OutlinedButton.icon(
                        onPressed: isBusy
                            ? null
                            : () => _openLogoutDialog(authStore),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppPalette.caption,
                          side: BorderSide(
                            color: AppPalette.caption.withValues(alpha: 0.6),
                          ),
                          shape: const StadiumBorder(),
                        ),
                        icon: isBusy
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(Icons.logout_rounded),
                        label: const Text(
                          'Sair',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: ResponsiveUtils.spacing(SpacingSize.medium)),
          GlassyProfileSection(
            title: 'Excluir conta',
            icon: Icons.delete_outline_rounded,
            iconColor: Theme.of(context).colorScheme.error,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Essa ação é permanente e remove seus dados da conta.',
                  style: TextStyle(
                    color: AppPalette.caption.withValues(alpha: 0.8),
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: ResponsiveUtils.spacing(SpacingSize.small)),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: Observer(
                    builder: (_) {
                      final bool isBusy = authStore.isLoading;
                      final Color errorColor = Theme.of(
                        context,
                      ).colorScheme.error;

                      return OutlinedButton.icon(
                        onPressed: isBusy
                            ? null
                            : () => _openDeleteAccountDialog(),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: errorColor,
                          side: BorderSide(color: errorColor),
                          shape: const StadiumBorder(),
                        ),
                        icon: isBusy
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(Icons.delete_forever_rounded),
                        label: const Text(
                          'Excluir conta',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleUpdateUsername(ProfileStore profileStore) async {
    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);

    final ProfileActionResult result = await profileStore.updateUsername();
    if (!mounted) {
      return;
    }

    messenger
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(result.message),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  Future<void> _openLogoutDialog(AuthStore authStore) async {
    final bool didConfirm = await LogoutDialog.show(context);
    if (!didConfirm || !mounted) {
      return;
    }

    final NavigatorState rootNavigator = Navigator.of(context);
    await authStore.signOut();
    if (!mounted) {
      return;
    }

    rootNavigator.pushNamedAndRemoveUntil('/login', (route) => false);
  }

  Future<void> _openDeleteAccountDialog() async {
    final Color errorColor = Theme.of(context).colorScheme.error;
    await showDialog<void>(
      context: context,
      builder: (_) => DeleteAccountDialog(
        profileStore: _profileStore,
        errorColor: errorColor,
      ),
    );
  }
}
