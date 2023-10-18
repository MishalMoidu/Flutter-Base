// ignore: unused_import
import 'package:firebase/view/auth/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseServices {
  Stream<User?> authStateChange() => FirebaseAuth.instance.authStateChanges();

  Future<UserCredential> login(String email, String password) {
    return FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> signUp(String email, String password) {
    return FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logout() => FirebaseAuth.instance.signOut();
}
