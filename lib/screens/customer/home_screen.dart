// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:washout/screens/general/app_entry.dart';
import 'package:washout/screens/search_carwash_screen.dart';
import 'package:washout/widgets/general/custom_appbar.dart';
import 'package:washout/widgets/general/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/homeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        isMerchant: false,
      ),
      drawer: CustomDrawer(
        accountEmail: "email@mail.com",
        accountName: "Bob Somchai",
        imageURL:
            'https://i.pinimg.com/474x/f5/0f/ca/f50fcac962f825241f039d2eede27c50.jpg',
        onSignOut: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(AppEntry.routeName, (route) => false);
        },
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
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
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SearchCarwashScreen();
                        }));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_circle_outline, size: 35),
                          Text(
                            'Add car wash',
                            style: TextStyle(fontSize: 25),
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
