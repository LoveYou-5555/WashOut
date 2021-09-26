import 'package:flutter/material.dart';

class SummaryDetail extends StatelessWidget {
  const SummaryDetail({
    Key? key,
    this.text = '',
    this.tailingText = '',
  }) : super(key: key);

  final String text;
  final String tailingText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Text(text),
          Spacer(),
          Text(tailingText),
        ],
      ),
    );
  }
}
