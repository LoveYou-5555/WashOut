import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: 120,
        height: 1.0,
        color: Colors.black26.withOpacity(0.2),
      ),
    );
  }
}
