import 'dart:ffi';
import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;

class FirebaseServices {
  static Future<void> initFirebase() async {
    await Firebase.initializeApp();
  }

  static Future<String?> signUp(String email, String password) async {
    try {
      UserCredential userCredential;
      userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user?.uid;
    } catch (e) {}
  }
}
