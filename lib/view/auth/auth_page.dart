import 'package:firebase/provider/providers.dart';
import 'package:firebase/view/auth/login_page.dart';
import 'package:firebase/view/auth/signUp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationPage extends ConsumerWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView(
      controller: ref.watch(pageController),
      children: [
        LoginPages(),
        SignUp(),
      ],
    );
  }
}
