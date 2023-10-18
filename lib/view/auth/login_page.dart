import 'package:firebase/provider/firebase_provider.dart';
import 'package:firebase/provider/providers.dart';
import 'package:firebase/utilites/app_utilities.dart';
import 'package:firebase/view/auth/signup_page.dart';
import 'package:firebase/view/widget/custom_textfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPages extends ConsumerWidget {
  LoginPages({
    super.key,
  });

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login Page",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: Responsive.h(50, context),
              ),
              CustomTextField(controller: email, hint: "Enter Your Email"),
              SizedBox(
                height: Responsive.h(10, context),
              ),
              CustomTextField(
                  controller: password, hint: "Enter Your Password"),
              SizedBox(
                height: Responsive.h(50, context),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await ref
                        .watch(authProvider)
                        .login(email.text, password.text);
                  } on FirebaseAuthException catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          e.message.toString(),
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(350, Responsive.h(50, context))),
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: Responsive.h(10, context),
              ),
              TextButton(
                onPressed: () {
                  ref.read(pageController).jumpToPage(1);
                },
                child: const Text("Don't Have An Accout? SignUp"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
