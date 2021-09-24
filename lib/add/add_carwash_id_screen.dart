// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AddCarwashIdScreen extends StatefulWidget {
  const AddCarwashIdScreen({Key? key}) : super(key: key);

  @override
  _SearchCarwashIdPageState createState() => _SearchCarwashIdPageState();
}

class _SearchCarwashIdPageState extends State<AddCarwashIdScreen> {
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
          Container(
            height: 50,
          ),
          Expanded(
            flex: 771,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Car Wash ID',
                          style: TextStyle(
                              fontSize: 35.0, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Container(height: 35),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Insert car wash id',
                    ),
                  ),
                  Container(height: 30),
                  ElevatedButton(
                      onPressed: () {
                       
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 15.0),
                        child: Text('Search'),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
