// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Service2Screen extends StatefulWidget {
  const Service2Screen({Key? key}) : super(key: key);

  @override
  _Service2ScreenState createState() => _Service2ScreenState();
}

class _Service2ScreenState extends State<Service2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue),
        actions: [
          Image.asset(
            "assets/logo_1.png",
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
                backgroundImage: NetworkImage('url'),
              ),
            )
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          TextButton(
            onPressed: () {
             
            },
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios),
                Text(
                  'Back',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
