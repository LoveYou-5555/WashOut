// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MerchantHomeScreen extends StatefulWidget {
  const MerchantHomeScreen({Key? key}) : super(key: key);

  @override
  _MerchantHomeScreenState createState() => _MerchantHomeScreenState();
}

class _MerchantHomeScreenState extends State<MerchantHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.red),
        actions: [
          Image.asset(
            "assets/logo_2.png",
            height: 51.0,
            width: 125.0,
          ),
        ],
        toolbarHeight: 90,
        backgroundColor: Colors.grey[200],
        shadowColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('AAA'),
              accountEmail: Text('haha@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://i.pinimg.com/474x/f5/0f/ca/f50fcac962f825241f039d2eede27c50.jpg'),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios),
                  Text(
                    'Sigh Out',
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: 30,
          ),
          Expanded(
            flex: 771,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('เมนูลัด',
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
