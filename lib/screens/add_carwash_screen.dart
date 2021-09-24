// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:washout/screens/search_carwash_screen.dart';

class AddCarwashScreen extends StatefulWidget {

  
  const AddCarwashScreen({Key? key}) : super(key: key);

  @override
  _AddCarwashScreenState createState() => _AddCarwashScreenState();
}

class _AddCarwashScreenState extends State<AddCarwashScreen> {
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
                return SearchCarwashScreen();
              }));
            },
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios),
                Text(
                  'ย้อนกลับ',
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
              child: Container(
                child: Column(
                  children: [
                    // Row(
                    //   children: [
                    //     Text('Car Wash ID',
                    //         style: TextStyle(
                    //             fontSize: 35.0, fontWeight: FontWeight.bold)),
                    //   ],
                    // ),
                    // Container(height: 35),
                    // TextField(
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(),
                    //     hintText: 'Insert car wash id',
                    //   ),
                    // ),
                    // Container(height: 30),
                    ElevatedButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context){
                          //   return ;
                          // }));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 15.0),
                          child: Text('Add'),
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
