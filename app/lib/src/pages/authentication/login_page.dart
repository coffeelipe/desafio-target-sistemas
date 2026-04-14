import 'package:app/src/core/theme/app_typography.dart';
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
              children: [_buildWelcomeHeader()],
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
        Text('Bem vindo', style: AppTypography.heading1),
        Text('Monte a sua coleção de informações.'),
      ],
    );
  }
}
