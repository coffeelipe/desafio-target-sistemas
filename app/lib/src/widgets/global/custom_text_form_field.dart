import 'package:app/src/core/theme/app_palette.dart';
import 'package:app/src/core/utils/validation_utils.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final int? maxLength;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final String? Function(String? value)? validator;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.label,
    this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType,
    this.maxLength,
    this.focusNode,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label != null) ...[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                label!,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppPalette.primaryVariant,
                ),
              ),
            ),
          ),
        ],
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          maxLength: maxLength,
          inputFormatters: [ValidationUtils.noEmojiFormatter],
          buildCounter:
              (
                context, {
                required currentLength,
                required isFocused,
                required maxLength,
              }) {
                if (maxLength == null) {
                  return null;
                }
                return Offstage(
                  offstage: !isFocused,
                  child: Text(
                    '$currentLength/$maxLength',
                    style: TextStyle(
                      color: currentLength >= maxLength
                          ? AppPalette.primary
                          : null,
                      fontSize: 12,
                    ),
                  ),
                );
              },
          errorBuilder: (context, errorText) {
            return Text(errorText, maxLines: 2);
          },
        ),
      ],
    );
  }
}
