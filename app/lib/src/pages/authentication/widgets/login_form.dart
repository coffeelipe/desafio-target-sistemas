import 'package:app/src/core/utils/responsive_utils.dart';
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
          ElevatedButton(onPressed: () {}, child: const Text('Login')),
        ],
      ),
    );
  }
}
