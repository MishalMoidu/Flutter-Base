import 'package:firebase/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = Provider<AuthFirebaseServices>((ref) {
  return AuthFirebaseServices();
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authProvider).authStateChange();
});


