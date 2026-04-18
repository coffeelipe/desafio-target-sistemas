import 'package:app/src/core/theme/app_theme.dart';
import 'package:app/src/pages/authentication/login_page.dart';
import 'package:app/src/pages/authentication/registration_page.dart';
import 'package:app/src/pages/main_scaffold/main_scaffold.dart';
import 'package:app/src/pages/splash/splash_screen.dart';
import 'package:app/src/stores/authentication/auth_store.dart';
import 'package:app/src/stores/main/root_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AppRouter extends StatelessWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthStore authStore = context.read<RootStore>().authStore;

    return Observer(
      builder: (_) {
        if (authStore.isInitializing) {
          return const MaterialApp(home: SplashScreen());
        }

        final initialRoute = authStore.isLoggedInServerSide ? '/' : '/login';

        return ScreenUtilInit(
          designSize: const Size(393, 851),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode.light, // TODO: change to system later
              onGenerateInitialRoutes: (String initialRouteName) {
                Widget page = initialRouteName == '/login'
                    ? const LoginPage()
                    : const MainScaffold();
                return [
                  MaterialPageRoute(
                    builder: (_) => page,
                    settings: RouteSettings(name: initialRouteName),
                  ),
                ];
              },
              routes: {
                '/': (_) => const MainScaffold(),
                '/login': (_) => const LoginPage(),
                '/register': (_) => const RegistrationPage(),
              },
              initialRoute: initialRoute,
            );
          },
        );
      },
    );
  }
}
