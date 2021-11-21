// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:washout/screens/customer/customer_home_screen.dart';

class RegisterCarScreen extends StatefulWidget {
  const RegisterCarScreen({Key? key}) : super(key: key);

  @override
  _RegisterCarScreenState createState() => _RegisterCarScreenState();
}

class _RegisterCarScreenState extends State<RegisterCarScreen> {
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
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CustomerHomeScreen();
              }));
            },
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios),
                Text(
                  'ย้อนกลับ',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Create account',
                  style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
                ),
                Container(height: 15),
                TextFormField(
                  // validator:
                  //     RequiredValidator(errorText: "กรุณาใส่ชื่อด้วยครับ"),
                  decoration: InputDecoration(labelText: 'Name'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
