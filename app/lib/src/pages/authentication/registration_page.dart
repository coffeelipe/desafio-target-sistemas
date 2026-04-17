import 'package:app/src/core/extensions/mediaquery_extension.dart';
import 'package:app/src/core/theme/app_palette.dart';
import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:app/src/stores/authentication/registration_form_state.dart';
import 'package:app/src/widgets/authentication/registration_form.dart';
import 'package:app/src/widgets/global/foreground_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: context.mediaQuery.size.height,
            ),
            child: Center(
              child: ForegroundCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/logo.svg', height: 50),
                    SizedBox(
                      height: ResponsiveUtils.spacing(SpacingSize.medium),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: context.mediaQuery.size.height * 0.65,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: ResponsiveUtils.spacing(
                                  SpacingSize.medium,
                                ),
                              ),
                              child: Provider(
                                create: (_) => RegistrationFormState(),
                                dispose: (context, store) => store.dispose(),
                                child: const RegistrationForm(),
                              ),
                            ),
                            SizedBox(
                              height: ResponsiveUtils.spacing(
                                SpacingSize.large,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveUtils.spacing(SpacingSize.small),
                    ),
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
        ),
      ),
    );
  }
}
