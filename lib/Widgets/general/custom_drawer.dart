// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// https://i.insider.com/5cdedc95021b4c12a50f46f6?width=1136&format=jpeg

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:washout/configs/colors.dart';
import 'package:washout/configs/const.dart';
import 'package:washout/screens/general/app_entry.dart';

class CustomDrawer extends StatefulWidget {
  final String accountName;
  final String accountEmail;
  final void Function()? onSignOut;
  final Color primaryColor;

  const CustomDrawer({
    Key? key,
    required this.accountName,
    required this.accountEmail,
    required this.onSignOut,
    this.primaryColor = kCustomerPrimary,
  }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String? accountName;
  String? accountEmail;

  Future<void> loadUserData() async {
    final pref = await SharedPreferences.getInstance();
    if (pref.getBool("isMerchant") ?? false) {
      setState(() {
        accountName =
            "${pref.getString(firstNamePrefKey)} ${pref.getString(lastNamePrefKey)}";
      });
    } else {
      setState(() {
        accountName = pref.getString(namePrefKey);
      });
    }

    setState(() {
      accountEmail = FirebaseAuth.instance.currentUser?.email;
    });
  }

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  void _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushNamedAndRemoveUntil(
        AppEntry.routeName,
        (route) => false,
      );
    } catch (e) {
      print("Can't sign out");
    }
  }

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
            onPressed: () {
              _signOut(context);
              // Navigator.of(context).pushNamedAndRemoveUntil(
              //   AppEntry.routeName,
              //   (route) => false,
              // );
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          // UserAccountsDrawerHeader(
          //   decoration: BoxDecoration(
          //     color: widget.primaryColor,
          //   ),
          //   accountName: Text(accountName ?? "UNKNOWN"),
          //   accountEmail: Text(accountEmail ?? "UNKNOWN"),
          // ),
          TextButton(
            onPressed: () => _showSignOutDialog(context),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: widget.primaryColor,
                ),
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
