import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

final customersCollection = _firestore.collection("customers");
final queueTicketsCollection = _firestore.collection("queue_tickets");
final merchantsCollection = _firestore.collection("merchants");
