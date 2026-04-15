import 'package:app/src/core/theme/app_theme.dart';
import 'package:app/src/pages/authentication/login_page.dart';
import 'package:app/src/pages/authentication/registration_page.dart';
import 'package:app/src/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
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
          routes: {
            '/': (_) => const HomePage(),
            '/login': (_) => const LoginPage(),
            '/register': (_) => const RegistrationPage(),
          },
          initialRoute: '/login',
        );
      },
    );
  }
}
