import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_page_ui/main.dart';
import 'package:flutter_login_page_ui/searchcarwashid.dart';

class HomePageMerchantPage extends StatefulWidget {
  @override
  _HomePageMerchantPageState createState() => _HomePageMerchantPageState();
}

class _HomePageMerchantPageState extends State<HomePageMerchantPage> {
  final aunt = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
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
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('AAA'),
              accountEmail: new Text('haha@gmail.com'),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage(
                    'https://i.pinimg.com/474x/f5/0f/ca/f50fcac962f825241f039d2eede27c50.jpg'),
              ),
            ),
            TextButton(
              onPressed: () {
                aunt.signOut().then((value) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return MyApp();
                  }));
                });
              },
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
              )),
            ),
          ),
        ],
      ),
    );
  }
}
