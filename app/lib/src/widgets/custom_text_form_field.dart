import 'package:app/src/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hintText,
    this.obscureText = false,
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
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          decoration: InputDecoration(hintText: hintText),
          obscureText: obscureText,
        ),
      ],
    );
  }
}
