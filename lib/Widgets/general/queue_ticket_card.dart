import 'package:flutter/material.dart';
import 'package:washout/configs/sizes.dart';

class QueueTicketCard extends StatelessWidget {
  final DateTime createdAt;
  final String licensePlate;
  final void Function()? onPressed;
  final bool isOverdue;

  const QueueTicketCard({
    Key? key,
    required this.createdAt,
    required this.licensePlate,
    this.onPressed,
    this.isOverdue = false,
  }) : super(key: key);

  String fillDigits(int num) {
    var str = num.toString();
    if (str.length < 2) {
      str = "0" + str;
    }

    return str;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(kSizeS),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(kSizeXS),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Icon(
                Icons.account_circle_outlined,
                color: Colors.black,
                size: kSizeL,
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Text(
                    licensePlate,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: kSizeS + kSizeXS,
                    ),
                  ),
                  kSizedBoxVerticalXS,
                  kSizedBoxVerticalXXS,
                  Text(
                    "Created: " +
                        "${fillDigits(createdAt.day)}-" +
                        "${fillDigits(createdAt.month)}-" +
                        "${fillDigits(createdAt.year)} " +
                        "${fillDigits(createdAt.hour)}:" +
                        fillDigits(createdAt.minute),
                    style: const TextStyle(
                      fontSize: kSizeXS + kSizeXXS,
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
