import 'package:firebase/services/firebase_services.dart';
import 'package:firebase/utilites/app_utilities.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HomePage',
              style: TextStyle(fontSize: Responsive.w(30, context)),
            ),
            SizedBox(
              height: Responsive.h(100, context),
            ),
            ElevatedButton(
              onPressed: () {
                AuthFirebaseServices().logout();
              },
              child: const Text("Log Out"),
            ),
          ],
        ),
      ),
    );
  }
}
