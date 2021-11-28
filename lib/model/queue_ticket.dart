import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:washout/configs/const.dart';

enum QueueTicketStatus {
  active,
  completed,
  rejected,
}

class QueueTicket {
  final String? customerUID;
  final String merchantUID;
  final DateTime createdAt;
  final String licensePlate;
  final String? phone;
  final QueueTicketStatus status;

  QueueTicket({
    required this.customerUID,
    required this.merchantUID,
    required this.createdAt,
    required this.licensePlate,
    required this.phone,
    required this.status,
  });

  factory QueueTicket.fromJSON(Map<String, dynamic> data) {

    return QueueTicket(
      customerUID: data["customerUID"],
      merchantUID: data["merchantUID"],
      createdAt: DateTime.fromMillisecondsSinceEpoch((data["createdAt"] == null
              ? Timestamp.now()
              : data["createdAt"] as Timestamp)
          .millisecondsSinceEpoch),
      licensePlate: data["licensePlate"],
      phone: data["phone"],
      status: queueTicketStatus[data["status"]]!,
    );
  }
}
