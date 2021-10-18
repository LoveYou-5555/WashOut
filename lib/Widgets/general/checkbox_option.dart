// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

const _circleSize = 20.0;

class CheckboxItem extends StatelessWidget {
  final String text;
  final void Function() onTap;
  final bool checked;
  final String tailingText;
  final Color backgroundColor;
  final Color checkedColor;
  final Color uncheckedColor;

  const CheckboxItem({
    Key? key,
    required this.text,
    required this.onTap,
    required this.checked,
    this.tailingText = "",
    this.checkedColor = Colors.red,
    this.uncheckedColor = Colors.white,
    this.backgroundColor = const Color(0xFF6DAADA),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        height: 50,
        decoration: BoxDecoration( 
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: _circleSize,
                    height: _circleSize,
                    decoration: BoxDecoration(
                      color: checked
                          ? checkedColor
                          : uncheckedColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(text),
                  Spacer(),
                  Text(tailingText),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
