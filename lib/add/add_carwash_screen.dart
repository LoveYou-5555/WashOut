// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:washout/widgets/general/custom_drawer.dart';

class AddCarwashScreen extends StatefulWidget {
  static const routeName = "/addCarwash";

  const AddCarwashScreen({Key? key}): super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<AddCarwashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue), 
        actions: [
          Image.asset(
            "assets/logo_customer.png",
            height: 51.0,
            width: 125.0,
          ),
        ],
        toolbarHeight: 90,
        backgroundColor: Colors.grey[200],
        shadowColor: Colors.white,
      ),
      drawer: CustomDrawer(
        accountEmail: "mail@mail.com",
        accountName: "Name Name",
        onSignOut: (){},
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          TextButton(
            onPressed: () {
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
                       
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
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
          SizedBox(height: 20),
          InkWell(
            onTap: () {
            },
            child: Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Image.asset(
                    "assets/face.png",
                    height: 90,
                    width: 90,
                  ),
                  SizedBox(
                    width: 20,
                    height: 60,
                  ),
                  Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Text(
                        'ABC CARCARE',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'ID: 123456',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 300,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 5)),
                Image.asset(
                  "assets/face.png",
                  height: 90,
                  width: 90,
                ),
                SizedBox(
                  width: 20,
                  height: 60,
                ),
                Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text(
                      'DEF CARCARE',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'ID: 123456',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            flex: 771,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                     
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_circle_outline, size: 35),
                          Text(
                            'Add car wash',
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                        ],
                      ),
                    )
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
