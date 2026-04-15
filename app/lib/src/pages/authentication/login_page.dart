import 'package:app/src/core/theme/app_palette.dart';
import 'package:app/src/core/theme/app_typography.dart';
import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:app/src/pages/authentication/widgets/login_form.dart';
import 'package:app/src/widgets/foreground_card.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ForegroundCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildWelcomeHeader(),
                SizedBox(height: ResponsiveUtils.spacing(SpacingSize.large)),
                Padding(
                  padding: EdgeInsets.all(
                    ResponsiveUtils.spacing(SpacingSize.medium),
                  ),
                  child: const LoginForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _buildWelcomeHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Bem vindo de volta.', style: AppTypography.heading1),
        Text(
          'Monte a sua coleção de informações.',
          style: TextStyle(color: AppPalette.caption, fontSize: 16),
        ),
      ],
    );
  }
}
