import 'package:firebase_auth/firebase_auth.dart';
import 'package:washout/configs/firestore_collections.dart';
import 'package:washout/model/merchant.dart';
import 'package:washout/services/firestore_customers.dart';

class FirestoreMerchants {
  Future<void> createAccount({
    required String uid,
    required String name,
    required String carwashID,
    required String email,
  }) async {
    await merchantsCollection.add({
      "uid": uid,
      "name": name,
      "carwashID": carwashID,
      "email": email,
    });
  }

  Future<bool> carwashIDExists(String carwashID) async {
    final snap = await merchantsCollection
        .where(
          "carwashID",
          isEqualTo: carwashID,
        )
        .get();

    return snap.docs.isNotEmpty;
  }

  Future<Merchant?> getMerchantData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      return null;
    }
    final snap = await merchantsCollection.where("uid", isEqualTo: uid).get();
    final data = snap.docs[0].data();

    return Merchant(
      name: data["name"],
      carwashID: data["carwashID"],
      email: FirebaseAuth.instance.currentUser?.email ?? "no email",
      uid: uid,
    );
  }

  Future<Merchant?> getMerchantByCarwashID(String carwashID) async {
    try {
      final snap = await merchantsCollection
          .where("carwashID", isEqualTo: carwashID)
          .get();
      if (snap.docs.isEmpty) {
        return null;
      } else {
        final data = snap.docs[0].data();
        return Merchant(
          name: data["name"],
          carwashID: data["carwashID"],
          email: null,
          uid: data["uid"],
        );
      }
    } catch (e) {
      print("cant get merch by cwID");
      return null;
    }
  }

  Future<Merchant?> getMerchantByEmail(String email) async {
    try {
      final snap =
          await merchantsCollection.where("email", isEqualTo: email).get();
      if (snap.docs.isEmpty) {
        return null;
      } else {
        final data = snap.docs[0].data();
        return Merchant(
          name: data["name"],
          carwashID: data["carwashID"],
          email: data["email"],
          uid: data["uid"],
        );
      }
    } catch (e) {
      print("cant get merch by cwID");
      return null;
    }
  }

  Future<Merchant?> getMerchantByUID(String uid) async {
    try {
      final snap = await merchantsCollection.where("uid", isEqualTo: uid).get();
      if (snap.docs.isEmpty) {
        print('no merch');
        return null;
      } else {
        final data = snap.docs[0].data();
        print(data);
        return Merchant.fromJSON(data);
      }
    } catch (e) {
      print(e);
      print("Can't get");
      return null;
    }
  }

  Future<List<Merchant?>> getMerchantsByCurrentCustomer() async {
    try {
      List<Merchant?> result = [];

      final uid = FirebaseAuth.instance.currentUser!.uid;
      final customer = await FirestoreCustomer().getCustomerByUID(uid);
      print("get customer pass");
      final merchList = customer!.carwashList;

      for (String merchUID in merchList) {
        final merchant = await FirestoreMerchants().getMerchantByUID(merchUID);
        result.add(merchant);
      }

      return result;
    } catch (e) {
      print("Failed to get merchants");
      print(e);
      return [];
    }
  }
}
