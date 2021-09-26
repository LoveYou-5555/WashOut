import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:washout/services/firebase_customer.dart';

final auth = FirebaseAuth.instance;

class FirebaseServices {
  static Future<void> initFirebase() async {
    await Firebase.initializeApp();
  }

  static Future<User?> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      UserCredential userCredential;
      userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseCustomer.createUser(firstName: firstName, lastName: lastName, uid: userCredential.user?.uid);
      return userCredential.user;
    } catch (e) {
      print("failed");
    }
  }

  static Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential;
      userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } catch (e) {}
  }

  static Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {}
  }

  static User? getCurrentUser() {
    return auth.currentUser;
  }
}
