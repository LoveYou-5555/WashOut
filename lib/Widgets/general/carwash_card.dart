// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:washout/configs/sizes.dart';
import 'package:washout/model/queue_ticket.dart';

final statusColor = {
  QueueTicketStatus.active: Colors.lightBlue[50],
  QueueTicketStatus.completed: Colors.green[100],
  QueueTicketStatus.rejected: Colors.red[100],
};

final statusMessage = {
  QueueTicketStatus.active: "Your queue is here",
  QueueTicketStatus.completed: "Your queue is completed",
  QueueTicketStatus.rejected: "Your queue is rejected",
};

class CarwashCard extends StatelessWidget {
  const CarwashCard({
    Key? key,
    required this.id,
    required this.name,
    required this.onPressed,
    this.showBorder = true,
    this.active = false,
    this.status,
  }) : super(key: key);

  final String id;
  final String name;
  final bool showBorder;
  final bool active;
  final QueueTicketStatus? status;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(kSizeS),
        decoration: BoxDecoration(
          color: status == null ? null : statusColor[status],
          border: showBorder
              ? Border.all(
                  color: Colors.black,
                  width: 1,
                )
              : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Icon(
                Icons.local_car_wash,
                color: Colors.black,
                size: kSizeL,
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  kSizedBoxVerticalXS,
                  kSizedBoxVerticalXXS,
                  Text(
                    status == null ? "ID: $id" : statusMessage[status]!,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: kSizeS,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
