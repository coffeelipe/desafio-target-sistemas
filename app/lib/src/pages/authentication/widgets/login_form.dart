import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:app/src/widgets/custom_elevated_button.dart';
import 'package:app/src/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const CustomTextFormField(
            label: 'Email',
            hintText: 'email@exemplo.com',
          ),
          SizedBox(height: ResponsiveUtils.spacing(SpacingSize.small)),
          const CustomTextFormField(label: 'Senha', hintText: 'Senha'),
          SizedBox(height: ResponsiveUtils.spacing(SpacingSize.large)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveUtils.spacing(SpacingSize.small),
            ),
            child: GradientButton(
              onPressed: () {},
              child: const Text(
                'Entrar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
