// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:washout/add/queue_screen.dart';

import 'service_screen_two.dart';

const _circleSize = 20.0;
const _unselectedColor = Colors.white;
const _selectedColor = Colors.red;

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);
  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final List<int> _selectedOptions = [];
  final List<int> _servicePrice = [
    200,
    500,
  ];

  void _onOptionSelect(int index) {
    setState(() {
      if (_selectedOptions.contains(index)) {
        _selectedOptions.remove(index);
      } else {
        _selectedOptions.add(index);
      }
    });
  }

  int _calculatePrice() {
    int sum = 0;
    for (int index in _selectedOptions) {
      sum += _servicePrice[index];
    }

    return sum;
  }

  Widget _buildOption(
      {required String text,
      required void Function(int) onTap,
      required int index}) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: EdgeInsets.all(12),
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFF6DAADA),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: _circleSize,
                  height: _circleSize,
                  decoration: BoxDecoration(
                    color: _selectedOptions.contains(index)
                        ? _selectedColor
                        : _unselectedColor,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(text),
              ],
            ),
            Text("${_servicePrice[index]} THB"),
          ],
        ),
      ),
    );
  }

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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return QueueScreen();
                  },
                ),
              );
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
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Services available"),
                  SizedBox(
                    height: 20,
                  ),
                  _buildOption(text: "Wash", onTap: _onOptionSelect, index: 0),
                  SizedBox(
                    height: 20,
                  ),
                  _buildOption(
                      text: "Repaint", onTap: _onOptionSelect, index: 1),
                  Spacer(),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    padding: EdgeInsets.all(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total price:"),
                        Text("${_calculatePrice()} THB")
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Service2Screen();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Confirm",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
