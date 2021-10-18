// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;

class AppAuthentication {
  AppAuthentication._();

  static Future<User?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential;
      userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } catch (e) {
      throw Exception;
    }
  }

  static Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential;
      userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } catch (e) {
      print("Sign in failed");
      throw Exception;
    }
  }

  static Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("Failed to sign out");
    }
  }

  static User? getCurrentUser() {
    return _auth.currentUser;
  }
}
