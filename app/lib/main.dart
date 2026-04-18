import 'package:app/firebase_options.dart';
import 'package:app/src/stores/main/root_store.dart';
import 'package:app/src/core/app_router/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    Provider<RootStore>(
      create: (_) => RootStore(),
      dispose: (_, store) => store.dispose(),
      child: const AppRouter(),
    ),
  );
}
