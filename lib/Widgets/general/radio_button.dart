import 'package:flutter/material.dart';

class RadioButton extends StatelessWidget {
  final bool isSelected;

  const RadioButton({Key? key, this.isSelected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16.0,
      height: 16.0,
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2.0, color: Colors.black)),
      child: isSelected
          ? Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
            )
          : Container(),
    );
  }
}
