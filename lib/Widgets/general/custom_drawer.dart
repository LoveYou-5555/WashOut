// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// https://i.insider.com/5cdedc95021b4c12a50f46f6?width=1136&format=jpeg

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:washout/configs/colors.dart';
import 'package:washout/configs/const.dart';
import 'package:washout/screens/general/app_entry.dart';
import 'package:washout/services/firestore_customers.dart';
import 'package:washout/services/firestore_merchants.dart';

class CustomDrawer extends StatefulWidget {
  final Color primaryColor;

  const CustomDrawer({
    Key? key,
    this.primaryColor = kCustomerPrimary,
  }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String accountName = "Loading";
  String accountEmail = "Loading";

  Future<void> loadUserData() async {
    final pref = await SharedPreferences.getInstance();

    String name;
    String? email;

    if (pref.getBool("isMerchant")!) {
      final merch = await FirestoreMerchants()
          .getMerchantByUID(FirebaseAuth.instance.currentUser!.uid);

      name = merch!.name;
      email = merch.email;
    } else {
      final cus = await FirestoreCustomer()
          .getCustomerByUID(FirebaseAuth.instance.currentUser!.uid);

      name = "${cus!.firstName} ${cus.lastName}";
      email = cus.email;
    }

    setState(() {
      accountEmail = email!;
      accountName = name;
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
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: widget.primaryColor,
            ),
            accountName: Text(accountName),
            accountEmail: Text(accountEmail),
          ),
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
