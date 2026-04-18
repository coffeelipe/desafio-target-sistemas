import 'package:app/src/core/extensions/mediaquery_extension.dart';
import 'package:app/src/core/theme/app_palette.dart';
import 'package:app/src/core/theme/app_typography.dart';
import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:app/src/widgets/global/custom_elevated_button.dart';
import 'package:app/src/widgets/global/custom_text_form_field.dart';
import 'package:app/src/widgets/profile/section_card.dart';
import 'package:flutter/material.dart';


// TODO: Refatorar para usar state management
// TODO: Adicionar integração com backend (atualizar usuário, excluir conta)
// TODO: Fazer FAB aparecer somente na primeira pagina do menu inferior
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late final TextEditingController _usernameController;
  final FocusNode _usernameFocusNode = FocusNode();

  bool _hasUsernameInput = false;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _usernameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          SectionCard(
            title: 'Nome de usuário',
            icon: Icons.person_outline_rounded,
            iconColor: AppPalette.primary,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _usernameController,
                  focusNode: _usernameFocusNode,
                  label: 'Usuário',
                  hintText: 'Seu novo nome de usuário',
                  maxLength: 16,
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    final bool hasInput = value.trim().isNotEmpty;
                    if (hasInput == _hasUsernameInput) {
                      return;
                    }
                    setState(() => _hasUsernameInput = hasInput);
                  },
                ),
                SizedBox(height: ResponsiveUtils.spacing(SpacingSize.small)),
                Opacity(
                  opacity: _hasUsernameInput ? 1 : 0.45,
                  child: IgnorePointer(
                    ignoring: !_hasUsernameInput,
                    child: GradientButton(
                      onPressed: () {
                        _usernameFocusNode.unfocus();
                        _showTemplateSnackBar(
                          'Template: atualizar usuário (sem integração).',
                        );
                      },
                      child: const Text(
                        'Atualizar usuário',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: ResponsiveUtils.spacing(SpacingSize.medium)),
          SectionCard(
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
                  child: OutlinedButton.icon(
                    onPressed: _openDeleteAccountDialog,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.error,
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.error,
                      ),
                      shape: const StadiumBorder(),
                    ),
                    icon: const Icon(Icons.delete_forever_rounded),
                    label: const Text(
                      'Excluir conta',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showTemplateSnackBar(String message) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
      );
  }

  Future<void> _openDeleteAccountDialog() async {
    final Color errorColor = Theme.of(context).colorScheme.error;

    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Excluir conta?'),
          content: const Text(
            'Tem certeza? Esta ação não pode ser desfeita.\n\n'
            'Este é apenas um template de UI (sem integração).',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancelar'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                _showTemplateSnackBar(
                  'Template: excluir conta (sem integração).',
                );
              },
              style: FilledButton.styleFrom(backgroundColor: errorColor),
              child: const Text('Excluir'),
            ),
          ],
        );
      },
    );
  }
}
