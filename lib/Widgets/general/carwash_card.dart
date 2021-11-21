// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:washout/configs/sizes.dart';

class CarwashCard extends StatelessWidget {
  const CarwashCard({
    Key? key,
    required this.id,
    required this.name,
    required this.onPressed,
    this.showBorder = true,
    this.active = false,
  }) : super(key: key);

  final String id;
  final String name;
  final bool showBorder;
  final bool active;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(kSizeS),
        decoration: BoxDecoration(
          color: active ? Colors.lightBlue[50] : null,
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
                        fontSize: 20),
                  ),
                  kSizedBoxVerticalXS,
                  kSizedBoxVerticalXXS,
                  Text(
                    active ? 'Your queue is here' : 'ID: $id',
                    style: TextStyle(
                        color: active ? Colors.green : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
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
