import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = FirebaseFirestore.instance;

final customersCol = firestore.collection("customers");
final carwashListCol = firestore.collection("cus_carwash_list");

class FirebaseCustomer {
  static Future<void> createUser({
    required String firstName,
    required String lastName,
    required String? uid,
  }) async {
    try {
      await customersCol.add({
        "firstName": firstName,
        "lastName": lastName,
        "uid": uid,
      });

      await carwashListCol.add({
        "merch_doc_ids": [],
        "uid": uid,
      });
    } catch (e) {
      print("Failed");
    }
  }
}
