import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final List<Color> colors;
  final IconData iconData;
  final void Function() onPressed;

  const SocialIcon({
    Key? key,
    required this.colors,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0),
      child: Container(
        width: 45.0,
        height: 45.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: colors,
            tileMode: TileMode.clamp,
          ),
        ),
        child: RawMaterialButton(
          shape: const CircleBorder(),
          onPressed: onPressed,
          child: Icon(
            iconData,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}