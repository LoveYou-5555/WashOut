import 'package:cloud_firestore/cloud_firestore.dart';

class QueueTicket {
  final String? customerUID;
  final String merchantUID;
  final DateTime createdAt;
  final String licensePlate;

  QueueTicket({
    required this.customerUID,
    required this.merchantUID,
    required this.createdAt,
    required this.licensePlate,
  });

  factory QueueTicket.fromJSON(Map<String, dynamic> data) {
    return QueueTicket(
      customerUID: data["customerUID"],
      merchantUID: data["merchantUID"],
      createdAt: DateTime.fromMillisecondsSinceEpoch(
          (data["createdAt"] as Timestamp).millisecondsSinceEpoch),
      licensePlate: data["licensePlate"],
    );
  }
}
