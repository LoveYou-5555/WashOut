// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class QueueScreen extends StatefulWidget {
  const QueueScreen({Key? key}) : super(key: key);

  @override
  State<QueueScreen> createState() => _QueueScreenState();
}

class _QueueScreenState extends State<QueueScreen> {
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
            width: 300,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Queue Before You',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                '3',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              Text(
                'Queue',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
          SizedBox(height: 30),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Container(
                          child: Center(
                              child: Text(
                            'Washing',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white),
                          )),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffFFC107),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 13,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 25,
                              ),
                              Text(
                                '2',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                'Queue',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Container(
                          child: Center(
                            child: Text(
                              'Awaiting',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffB5B5B5),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 13,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 25,
                              ),
                              Text(
                                '1',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                'Queue',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey)),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                     
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                        vertical: 5.0,
                      ),
                      child: Text(
                        'Use service',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(height: 150),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
