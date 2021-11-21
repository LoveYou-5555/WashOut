// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:washout/configs/colors.dart';

class CustomBackButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color iconColor;

  const CustomBackButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.iconColor = kCustomerPrimary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios,
            color: iconColor,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
