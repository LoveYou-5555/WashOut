import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:washout/services/firebase_services.dart';

final _firestore = FirebaseFirestore.instance;

final _customersCol = _firestore.collection("customers");
final _carwashListCol = _firestore.collection("cus_carwash_list");
final _merchantsCol = _firestore.collection("merchants");

class FirebaseCustomer {
  static Future<void> createUser({
    required String firstName,
    required String lastName,
    required String? uid,
  }) async {
    try {
      await _customersCol.add({
        "firstName": firstName,
        "lastName": lastName,
        "uid": uid,
      });

      await _carwashListCol.add({
        "merch_doc_ids": [],
        "uid": uid,
      });
    } catch (e) {
      print("Failed");
    }
  }

  static Future<Map<String, dynamic>> getMerchant(String merchant_id) async {
    try {
      QuerySnapshot qrShot = await _merchantsCol
          .where(
            "merchant_id",
            isEqualTo: merchant_id,
          )
          .get();

      return qrShot.docs[0].data() as Map<String, dynamic>;
    } catch (e) {
      print("NOT FOUND");
      return {};
    }
  }

  static Future<void> addMerchantToList(String merch_uid) async {
    try {
      QuerySnapshot qrShotMerch = await _merchantsCol
          .where("uid", isEqualTo: merch_uid)
          .get();

      print(merch_uid);

      var merchDocId = qrShotMerch.docs[0].id;

      print(merchDocId);
      print(FirebaseServices.getCurrentUser()?.uid);

      QuerySnapshot carwashListQrShot = await _carwashListCol
          .where("uid", isEqualTo: FirebaseServices.getCurrentUser()?.uid)
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

      await _carwashListCol.doc(docId).update({
        "merch_doc_ids": newList,
      });
    } catch (e) {
      print("Failed");
    }
  }

  static Future<List<Map<String, dynamic>>> getCarwashList() async {
    try{
      QuerySnapshot carListQS = await _carwashListCol.where("uid", isEqualTo: FirebaseServices.getCurrentUser()?.uid).get();
      var carwashListData = carListQS.docs[0].data() as Map<String, dynamic>;
      var merchDocIds = carwashListData["merch_doc_ids"] as List<dynamic>;

      var result = <Map<String, dynamic>>[];

      for(dynamic docId in merchDocIds){
        var data = await getSingleMerchant(docId);
        result.add(data);
      }

      print(result);
      return result;

    } catch (e) {
      return [];
    }
  }

  static Future<Map<String, dynamic>> getSingleMerchant(String docId) async {
    try{
      DocumentSnapshot merchDS = await _merchantsCol.doc(docId).get();

      return merchDS.data() as Map<String, dynamic>;

    }catch(e){
      print("single failed");
      return {};
    }
  }
}
