// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class QueueStatusTicket extends StatelessWidget {
  final Color color;
  final int ticketCount;
  final String statusLabel;

  const QueueStatusTicket({
    Key? key,
    required this.color,
    required this.ticketCount,
    required this.statusLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
            child: Center(
              child: Text(
                statusLabel,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 13,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 25,
                ),
                Text(
                  '$ticketCount',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Queue',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.grey)),
          ),
        )
      ],
    );
  }
}
