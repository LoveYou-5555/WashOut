// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const CustomBackButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        Navigator.of(context).pop();
      },
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios,
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
