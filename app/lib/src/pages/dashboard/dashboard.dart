import 'package:app/src/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Dashboard.', style: AppTypography.heading1),
    );
  }
}
