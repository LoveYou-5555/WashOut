// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:washout/configs/firestore_collections.dart';
import 'package:washout/model/queue_ticket.dart';

class FirestoreQueueTickets {
  Future<void> createQueueTicketManually({required String licensePlate}) async {
    try {
      await queueTicketsCollection.add({
        "merchantUID": FirebaseAuth.instance.currentUser!.uid,
        "customerUID": null,
        "createdAt": FieldValue.serverTimestamp(),
        "licensePlate": licensePlate,
      });
    } catch (e) {
      print(e);
      print("Cant add queue");
    }
  }

  Future<void> createQueueTicket(
    String customerUID,
    String merchantUID,
    String licensePlate,
  ) async {
    try {
      await queueTicketsCollection.add({
        "merchantUID": merchantUID,
        "customerUID": customerUID,
        "createdAt": FieldValue.serverTimestamp(),
        "licensePlate": licensePlate,
      });
    } catch (e) {
      print(e);
      print("Cant add queue");
    }
  }

  Future<void> removeQueueTicketByCustomerUID(String customerUID) async {
    try {
      final snap = await queueTicketsCollection
          .where("customerUID", isEqualTo: customerUID)
          .get();
      if (snap.docs.isNotEmpty) {
        await queueTicketsCollection.doc(snap.docs[0].id).delete();
      }
    } catch (e) {
      print("Cant delete");
    }
  }

  Future<void> removeQueueTicketByLicensePlate(String licensePlate) async {
    try {
      final snap = await queueTicketsCollection
          .where("licensePlate", isEqualTo: licensePlate)
          .get();
      if (snap.docs.isNotEmpty) {
        print("Perform delete");
        await queueTicketsCollection.doc(snap.docs[0].id).delete();
      } else {
        print("Cant find plate");
      }
    } catch (e) {
      print("Cant delete");
    }
  }

  Future<QueueTicket?> getQueueTicketByLicensePlate(String licensePlate) async {
    try {
      final snap = await queueTicketsCollection
          .where("licensePlate", isEqualTo: licensePlate)
          .get();

      if (snap.docs.isEmpty) {
        return null;
      } else {
        final data = snap.docs[0].data();
        return QueueTicket.fromJSON(data);
      }
    } catch (e) {
      print("Can't get tickets");
      return null;
    }
  }

  Future<QueueTicket?> getQueueTicketByCustomer(String uid) async {
    try {
      final snap = await queueTicketsCollection
          .where("customerUID", isEqualTo: uid)
          .get();

      if (snap.docs.isEmpty) {
        return null;
      } else {
        final data = snap.docs[0].data();
        return QueueTicket.fromJSON(data);
      }
    } catch (e) {
      print("Can't get tickets");
      return null;
    }
  }

  Future<QueueTicket?> getQueueTicketByCustomerAndMerchant(
      String customerUID, String merchantUID) async {
    try {
      final snap = await queueTicketsCollection
          .where("customerUID", isEqualTo: customerUID)
          .where("merchantUID", isEqualTo: merchantUID)
          .get();

      if (snap.docs.isEmpty) {
        return null;
      } else {
        final data = snap.docs[0].data();
        return QueueTicket.fromJSON(data);
      }
    } catch (e) {
      print("Can't get tickets");
      return null;
    }
  }

  Future<List<QueueTicket?>> getQueueTicketListByMerchant(
      String merchUID) async {
    try {
      final snap = await queueTicketsCollection
          .where("merchantUID", isEqualTo: merchUID)
          .get();

      if (snap.docs.isEmpty) {
        return [];
      } else {
        List<QueueTicket?> result = [];
        for (DocumentSnapshot doc in snap.docs) {
          final data = doc.data() as Map<String, dynamic>;
          result.add(
            QueueTicket.fromJSON(data),
          );
        }

        return result;
      }
    } catch (e) {
      print(e);
      print("Cant get list q by merch");
      return [];
    }
  }
}
