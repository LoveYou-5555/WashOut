// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final String accountName;
  final String accountEmail;
  final String imageURL;
  final void Function() onSignOut;

  const CustomDrawer({
    Key? key,
    required this.accountName,
    required this.accountEmail,
    this.imageURL =
        'https://i.pinimg.com/474x/f5/0f/ca/f50fcac962f825241f039d2eede27c50.jpg',
    required this.onSignOut,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(accountName),
            accountEmail: Text(accountEmail),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                imageURL,
              ),
            ),
          ),
          TextButton(
            onPressed: onSignOut,
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios),
                Text(
                  'Sign Out',
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
