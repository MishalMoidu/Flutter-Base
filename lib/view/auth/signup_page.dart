import 'package:firebase/provider/firebase_provider.dart';
import 'package:firebase/utilites/app_utilities.dart';
import 'package:firebase/view/widget/custom_textfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/providers.dart';

class SignUp extends ConsumerWidget {
  SignUp({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();

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
                "Sign Up",
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
                height: Responsive.h(10, context),
              ),
              CustomTextField(
                  controller: confirmpassword, hint: "Conform Your Password"),
              SizedBox(
                height: Responsive.h(50, context),
              ),
              ElevatedButton(
                onPressed: () async {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => LoginPages(),
                  //   ),
                  // );
                  try {
                    if (password.text == confirmpassword.text) {
                      await ref
                          .watch(authProvider)
                          .signUp(email.text, password.text);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Password is not match",
                          ),
                        ),
                      );
                    }
                  } on FirebaseException catch (e) {
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
                  "SignUp",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: Responsive.h(10, context),
              ),
              TextButton(
                onPressed: () {
                  ref.read(pageController).jumpToPage(0);
                },
                child: const Text("You Have Account ? LogIn"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
