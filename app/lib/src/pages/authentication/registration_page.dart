import 'package:app/src/core/theme/app_palette.dart';
import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:app/src/widgets/authentication/registration_form.dart';
import 'package:app/src/widgets/global/foreground_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ForegroundCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/logo.svg', height: 50),
                SizedBox(
                  height: ResponsiveUtils.spacing(SpacingSize.medium),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveUtils.spacing(SpacingSize.medium),
                  ),
                  child: const RegistrationForm(),
                ),
                SizedBox(height: ResponsiveUtils.spacing(SpacingSize.large)),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: RichText(
                    text: TextSpan(
                      text: 'Já tem uma conta? ',
                      style: const TextStyle(color: Colors.black),
                      children: [
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Text(
                              'Faça login',
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
}
