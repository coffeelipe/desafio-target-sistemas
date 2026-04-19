import 'package:app/src/stores/profile/profile_store.dart';
import 'package:app/src/widgets/authentication/password_field.dart';
import 'package:app/src/core/theme/app_palette.dart';
import 'package:app/src/core/theme/app_typography.dart';
import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DeleteAccountDialog extends StatefulWidget {
  final ProfileStore profileStore;
  final Color errorColor;

  const DeleteAccountDialog({
    super.key,
    required this.profileStore,
    required this.errorColor,
  });

  @override
  State<DeleteAccountDialog> createState() => _DeleteAccountDialogState();
}

class _DeleteAccountDialogState extends State<DeleteAccountDialog> {
  late final TextEditingController _passwordController;
  bool _isPasswordObscured = true;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 560),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(
              ResponsiveUtils.spacing(SpacingSize.medium),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.delete_forever_rounded,
                      color: widget.errorColor,
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Excluir conta?',
                        style: AppTypography.heading2,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close_rounded),
                    ),
                  ],
                ),
                SizedBox(height: ResponsiveUtils.spacing(SpacingSize.medium)),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Tem certeza? Esta ação não pode ser desfeita.',
                    style: AppTypography.bodyText,
                  ),
                ),
                const SizedBox(height: 12),
                PasswordField(
                  controller: _passwordController,
                  label: 'Confirme sua senha',
                  hintText: 'Senha',
                  obscureText: _isPasswordObscured,
                  onTogglePressed: () => setState(
                    () => _isPasswordObscured = !_isPasswordObscured,
                  ),
                ),
                SizedBox(height: ResponsiveUtils.spacing(SpacingSize.large)),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: OutlinedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: OutlinedButton.styleFrom(
                            shape: const StadiumBorder(),
                            foregroundColor: AppPalette.primaryVariant,
                            side: BorderSide(
                              color: AppPalette.primaryVariant.withValues(
                                alpha: 0.35,
                              ),
                            ),
                          ),
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: Observer(
                          builder: (_) {
                            final bool isBusy = widget.profileStore.isBusy;

                            return FilledButton(
                              onPressed: isBusy ? null : _handleDeletePressed,
                              style: FilledButton.styleFrom(
                                backgroundColor: widget.errorColor,
                                shape: const StadiumBorder(),
                              ),
                              child: isBusy
                                  ? const SpinKitThreeBounce(
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  : const Text(
                                      'Excluir',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleDeletePressed() async {
    FocusScope.of(context).unfocus();
    final ScaffoldMessengerState? messenger = ScaffoldMessenger.maybeOf(
      context,
    );

    final ProfileActionResult result = await widget.profileStore
        .deleteAccountWithPassword(_passwordController.text);

    if (!mounted) {
      return;
    }

    if (result.success) {
      Navigator.of(context).pop();

      messenger
        ?..clearSnackBars()
        ..showSnackBar(
          SnackBar(
            content: Text(result.message),
            behavior: SnackBarBehavior.floating,
          ),
        );

      Navigator.of(
        context,
        rootNavigator: true,
      ).pushNamedAndRemoveUntil('/login', (route) => false);
    } else {
      messenger
        ?..clearSnackBars()
        ..showSnackBar(
          SnackBar(
            content: Text(result.message),
            behavior: SnackBarBehavior.floating,
          ),
        );
    }
  }
}
