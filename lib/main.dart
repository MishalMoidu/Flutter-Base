import 'package:firebase/provider/firebase_provider.dart';
import 'package:firebase/view/auth/auth_page.dart';
import 'package:firebase/view/auth/login_page.dart';
import 'package:firebase/view/homepage/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseAuth.instance.useAuthEmulator("localhost", 9099);
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ref.watch(authStateProvider).when(
            data: (data) {
              if (data == null) {
                return AuthenticationPage();
              } else {
                return HomePage();
              }
            },
            error: (error, stackTrace) => Text("$error"),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
