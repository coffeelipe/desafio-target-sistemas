import 'package:app/src/core/extensions/mediaquery_extension.dart';
import 'package:app/src/core/theme/app_palette.dart';
import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:app/src/stores/authentication/registration_form_state.dart';
import 'package:app/src/stores/main/root_store.dart';
import 'package:app/src/widgets/authentication/registration_form.dart';
import 'package:app/src/widgets/global/foreground_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late final RegistrationFormState _formStateStore;
  ReactionDisposer? _authReactionDisposer;
  ReactionDisposer? _authErrorReactionDisposer;

  @override
  void initState() {
    super.initState();
    final authStore = context.read<RootStore>().authStore;
    _formStateStore = RegistrationFormState(authStore: authStore);

    _authReactionDisposer = reaction<bool>(
      (_) => authStore.isLoggedInServerSide,
      (isLoggedIn) {
        if (!isLoggedIn || !mounted) return;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
        });
      },
      fireImmediately: true,
    );

    _authErrorReactionDisposer = reaction<String?>(
      (_) => authStore.authErrorMessage,
      (message) {
        if (message == null || !mounted) return;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(message)));
          authStore.clearAuthError();
        });
      },
    );
  }

  @override
  void dispose() {
    _authReactionDisposer?.call();
    _authErrorReactionDisposer?.call();
    _formStateStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: context.screenHeight),
          child: SafeArea(
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
                        maxHeight: context.screenHeight * 0.65,
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
                              child: Provider.value(
                                value: _formStateStore,
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
