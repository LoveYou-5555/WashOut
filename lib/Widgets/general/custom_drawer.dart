// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final String accountName;
  final String accountEmail;
  final String imageURL;
  final void Function() onSignOut;

  Future<void> _showSignOutDialog(BuildContext context) async {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to Logout?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

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
            onPressed: () => _showSignOutDialog(context),
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
