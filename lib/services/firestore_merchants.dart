// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:washout/configs/firestore_collections.dart';

final _merchants = FirestoreCollections.merchants;

class FirestoreMerchants {
  FirestoreMerchants._();

  static Future<Map<String, dynamic>> getMerchantByUID(String merchantId) async {
    try {
      QuerySnapshot qrShot = await _merchants
          .where(
            "merchant_id",
            isEqualTo: merchantId,
          )
          .get();

      return qrShot.docs[0].data() as Map<String, dynamic>;
    } catch (e) {
      print("NOT FOUND");
      return {};
    }
  }

  static Future<Map<String, dynamic>> getMerchantByDocId(String docId) async {
    try {
      DocumentSnapshot merchDS =
          await FirestoreCollections.merchants.doc(docId).get();

      return merchDS.data() as Map<String, dynamic>;
    } catch (e) {
      print("single failed");
      return {};
    }
  }
}
