import 'package:app/src/core/extensions/mediaquery_extension.dart';
import 'package:app/src/core/theme/app_palette.dart';
import 'package:app/src/core/theme/app_typography.dart';
import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:app/src/stores/authentication/auth_store.dart';
import 'package:app/src/stores/authentication/login_form_state.dart';
import 'package:app/src/stores/main/root_store.dart';
import 'package:app/src/widgets/authentication/login_form.dart';
import 'package:app/src/widgets/global/foreground_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginFormState _formStateStore;
  ReactionDisposer? _authReactionDisposer;

  @override
  void initState() {
    super.initState();
    final AuthStore authStore = context.read<RootStore>().authStore;
    _formStateStore = LoginFormState(authStore: authStore);

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
  }

  @override
  void dispose() {
    _authReactionDisposer?.call();
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
                    SvgPicture.asset('assets/images/logo.svg', height: 60),
                    SizedBox(
                      height: ResponsiveUtils.spacing(SpacingSize.extraLarge),
                    ),
                    _buildWelcomeHeader(),
                    SizedBox(
                      height: ResponsiveUtils.spacing(SpacingSize.large),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ResponsiveUtils.spacing(SpacingSize.medium),
                      ),
                      child: Provider.value(
                        value: _formStateStore,
                        child: const LoginForm(),
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveUtils.spacing(SpacingSize.large),
                    ),
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
