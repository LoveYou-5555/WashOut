// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:washout/configs/firestore_collections.dart';
import 'package:washout/services/authentication.dart';
import 'package:washout/services/firestore_merchants.dart';

final _carwashList = FirestoreCollections.carwashList;

class FirestoreCarwashList {
  FirestoreCarwashList._();

  static Future<void> createCarwashList() async {
    try {
      await _carwashList.add({
        "merch_doc_ids": [],
        "uid": AppAuthentication.getCurrentUser()?.uid,
      });
    } catch (e) {
      print("Failed to create list");
      throw Exception;
    }
  }

  static Future<List<Map<String, dynamic>>> getCarwashList() async {
    try {
      QuerySnapshot carListQS = await _carwashList
          .where("uid", isEqualTo: AppAuthentication.getCurrentUser()?.uid)
          .get();
          
      var carwashListData = carListQS.docs[0].data() as Map<String, dynamic>;
      var merchDocIds = carwashListData["merch_doc_ids"] as List<dynamic>;

      var result = <Map<String, dynamic>>[];

      for (dynamic docId in merchDocIds) {
        var data = await FirestoreMerchants.getMerchantByDocId(docId);
        result.add(data);
      }

      print(result);
      return result;
    } catch (e) {
      return [];
    }
  }

  static Future<void> addCarwashToList(String merchUID) async {
    try {
      QuerySnapshot qrShotMerch = await FirestoreCollections.merchants
          .where("uid", isEqualTo: merchUID)
          .get();

      print(merchUID);

      var merchDocId = qrShotMerch.docs[0].id;

      print(merchDocId);
      print(AppAuthentication.getCurrentUser()?.uid);

      QuerySnapshot carwashListQrShot = await _carwashList
          .where("uid", isEqualTo: AppAuthentication.getCurrentUser()?.uid)
          .get();

      final docId = carwashListQrShot.docs[0].id;
      print(docId);
      var data = carwashListQrShot.docs[0].data() as Map<String, dynamic>;
      print(data);

      var newList = data["merch_doc_ids"] as List<dynamic>;
      print(newList);
      if (!newList.contains(merchDocId)) {
        newList.add(merchDocId);
      }

      await _carwashList.doc(docId).update({
        "merch_doc_ids": newList,
      });
    } catch (e) {
      print("Failed");
    }
  }
}
