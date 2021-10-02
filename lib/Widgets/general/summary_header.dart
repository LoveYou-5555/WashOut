import 'package:flutter/material.dart';

class SummaryHeader extends StatelessWidget {
  final String text;
  final String tailingText;

  const SummaryHeader({
    Key? key,
    this.text = "",
    this.tailingText = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          const Spacer(),
          Text(tailingText),
        ],
      ),
    );
  }
}
