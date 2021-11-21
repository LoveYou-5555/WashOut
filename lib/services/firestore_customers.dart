// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:washout/configs/firestore_collections.dart';
import 'package:washout/model/customer.dart';

class FirestoreCustomer {
  Future<void> createAccount({
    required String uid,
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
  }) async {
    try {
      await customersCollection.add({
        "carwashList": [],
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "uid": uid,
        "email": email,
      });
    } catch (e) {
      print("failed to register customer");
      print(e);
    }
  }

  Future<Customer?> getCustomerByUID(String uid) async {
    try {
      final snap = await customersCollection.where("uid", isEqualTo: uid).get();
      if (snap.docs.isEmpty) {
        return null;
      } else {
        final data = snap.docs[0].data();
        print(data);
        var carwashList = data["carwashList"] as List<dynamic>;
        List<String> carwashListStr = [];
        for (dynamic cw in carwashList) {
          carwashListStr.add(cw.toString());
        }
        print(carwashListStr);
        return Customer(
          firstName: data["firstName"],
          lastName: data["lastName"],
          phone: data["phone"],
          carwashList: carwashListStr,
          email: data["email"],
          uid: uid,
        );
      }
    } catch (e) {
      print("Can't get customer firebase");
      print(e);
      return null;
    }
  }

  Future<Customer?> getCustomerByEmail(String email) async {
    try {
      final snap = await customersCollection.where("email", isEqualTo: email).get();
      if (snap.docs.isEmpty) {
        return null;
      } else {
        final data = snap.docs[0].data();
        print(data);
        var carwashList = data["carwashList"] as List<dynamic>;
        List<String> carwashListStr = [];
        for (dynamic cw in carwashList) {
          carwashListStr.add(cw.toString());
        }
        print(carwashListStr);
        return Customer(
          firstName: data["firstName"],
          lastName: data["lastName"],
          phone: data["phone"],
          carwashList: carwashListStr,
          email: null,
          uid: data["uid"],
        );
      }
    } catch (e) {
      print("Can't get customer firebase");
      print(e);
      return null;
    }
  }

  Future<void> addCarwashToList(String? carwashUID) async {
    try {
      final customer =
          await getCustomerByUID(FirebaseAuth.instance.currentUser!.uid);
      final carwashList = customer!.carwashList;
      carwashList.add(carwashUID!);

      final snap = await customersCollection
          .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      await customersCollection.doc(snap.docs[0].id).update({
        "carwashList": carwashList,
      });
    } catch (e) {
      print(e);
      print("failed to append");
    }
  }
}
