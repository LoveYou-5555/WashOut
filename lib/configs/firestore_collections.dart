import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class FirestoreCollections{
  FirestoreCollections._();

  static final customers = _firestore.collection("customers");
  static final carwashList = _firestore.collection("cus_carwash_list");
  static final merchants = _firestore.collection("merchants");
}