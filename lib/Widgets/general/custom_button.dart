import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final Color? color;

  const CustomButton({Key? key, required this.onPressed, this.text = "", this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
