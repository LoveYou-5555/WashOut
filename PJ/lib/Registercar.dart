import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_page_ui/homepage.dart';
import 'package:form_field_validator/form_field_validator.dart';

class registercar extends StatefulWidget {
  @override
  _registercarState createState() => _registercarState();
}

class _registercarState extends State<registercar> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
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
        drawer: new Drawer(
          child: ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text('AAA'),
                accountEmail: new Text('haha@gmail.com'),
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: new NetworkImage('url'),
                ),
              )
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomePage();
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
                  validator:
                      RequiredValidator(errorText: "กรุณาใส่ชื่อด้วยครับ"),
                  decoration: InputDecoration(labelText: 'Name'),
                ),
              ],
            ),
          ),
        ]));
  }
}
