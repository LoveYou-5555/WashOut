import 'package:flutter/material.dart';

class CarwashCard extends StatelessWidget {
  const CarwashCard({
    Key? key,
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.onPressed,
    this.showBorder = true,

  }) : super(key: key);

  final String id;
  final String name;
  final String imageUrl;
  final bool showBorder;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 300,
        height: 100,
        decoration: BoxDecoration(
          border: showBorder ? Border.all(
            color: Colors.black,
            width: 1,
          ) : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                imageUrl,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 20)),
                Text(
                  '$name',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  'ID: $id',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
