import 'package:app/src/core/theme/app_palette.dart';
import 'package:app/src/core/theme/app_typography.dart';
import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:app/src/widgets/authentication/login_form.dart';
import 'package:app/src/widgets/global/foreground_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                SvgPicture.asset('assets/images/logo.svg', height: 60),
                SizedBox(
                  height: ResponsiveUtils.spacing(SpacingSize.extraLarge),
                ),
                _buildWelcomeHeader(),
                SizedBox(height: ResponsiveUtils.spacing(SpacingSize.large)),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveUtils.spacing(SpacingSize.medium),
                  ),
                  child: const LoginForm(),  // Main component containing the login form and submit button
                ),
                SizedBox(height: ResponsiveUtils.spacing(SpacingSize.large)),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: RichText(
                    text: TextSpan(
                      text: 'Novo aqui? ',
                      style: const TextStyle(color: Colors.black),
                      children: [
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/register'),
                            child: const Text(
                              'Crie uma conta',
                              style: TextStyle(
                                color: AppPalette.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
