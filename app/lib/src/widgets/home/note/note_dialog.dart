import 'package:app/src/widgets/home/note/labeled_field.dart';
import 'package:flutter/material.dart';

import 'package:app/src/core/theme/app_palette.dart';
import 'package:app/src/core/theme/app_typography.dart';
import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:app/src/core/utils/validation_utils.dart';
import 'package:app/src/widgets/global/custom_elevated_button.dart';

class NoteDialog extends StatelessWidget {
  final String dialogTitle;
  final String? initialTitle;
  final String? initialContent;
  final String primaryActionText;
  final String cancelActionText;
  final VoidCallback? onPrimaryPressed;
  final VoidCallback? onCancelPressed;

  const NoteDialog({
    super.key,
    this.dialogTitle = 'Nova nota',
    this.initialTitle,
    this.initialContent,
    this.primaryActionText = 'Salvar',
    this.cancelActionText = 'Cancelar',
    this.onPrimaryPressed,
    this.onCancelPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 560),
        child: Padding(
          padding: EdgeInsets.all(ResponsiveUtils.spacing(SpacingSize.medium)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.edit_note_rounded,
                    color: AppPalette.primary,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(dialogTitle, style: AppTypography.heading2),
                  ),
                  IconButton(
                    onPressed:
                        onCancelPressed ?? () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close_rounded),
                  ),
                ],
              ),
              SizedBox(height: ResponsiveUtils.spacing(SpacingSize.medium)),
              LabeledField(
                label: 'Título',
                child: TextFormField(
                  initialValue: initialTitle,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  textInputAction: TextInputAction.next,
                  inputFormatters: [ValidationUtils.noEmojiFormatter],
                  decoration: const InputDecoration(hintText: 'Opcional'),
                ),
              ),
              SizedBox(height: ResponsiveUtils.spacing(SpacingSize.small)),
              LabeledField(
                label: 'Conteúdo',
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 160),
                  child: TextFormField(
                    initialValue: initialContent,
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    maxLines: 10,
                    minLines: 6,
                    inputFormatters: [ValidationUtils.noEmojiFormatter],
                    decoration: const InputDecoration(
                      hintText: 'Escreva sua nota aqui…',
                    ),
                  ),
                ),
              ),
              SizedBox(height: ResponsiveUtils.spacing(SpacingSize.large)),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: OutlinedButton(
                        onPressed:
                            onCancelPressed ??
                            () => Navigator.of(context).pop(),
                        style: OutlinedButton.styleFrom(
                          shape: const StadiumBorder(),
                          foregroundColor: AppPalette.primaryVariant,
                          side: BorderSide(
                            color: AppPalette.primaryVariant.withValues(
                              alpha: 0.35,
                            ),
                          ),
                        ),
                        child: Text(
                          cancelActionText,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: GradientButton(
                      onPressed:
                          onPrimaryPressed ?? () => Navigator.of(context).pop(),
                      child: Text(
                        primaryActionText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
