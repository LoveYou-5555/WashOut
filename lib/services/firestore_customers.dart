// ignore_for_file: avoid_print

import 'package:washout/configs/firestore_collections.dart';
import 'package:washout/services/authentication.dart';

final _customers = FirestoreCollections.customers;

class FirestoreCustomer {
  FirestoreCustomer._();

  static Future<void> createUser({
    required String firstName,
    required String lastName,
  }) async {
    try {
      await _customers.add({
        "firstName": firstName,
        "lastName": lastName,
        "uid": AppAuthentication.getCurrentUser()?.uid,
      });
    } catch (e) {
      print("Failed");
      throw Exception;
    }
  }
}
