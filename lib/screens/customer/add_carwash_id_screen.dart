// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:washout/widgets/general/custom_appbar.dart';
import 'package:washout/widgets/general/custom_back_button.dart';
import 'package:washout/widgets/general/custom_button.dart';
import 'package:washout/widgets/general/custom_drawer.dart';

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
      appBar: CustomAppBar(
        isMerchant: false,
      ),
      drawer: CustomDrawer(
        accountEmail: "mail@mail.com",
        accountName: "Bob Somchai",
        onSignOut: () {},
        imageURL:
            "https://i.insider.com/5cdedc95021b4c12a50f46f6?width=1136&format=jpeg",
        
      ),
      
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          CustomBackButton(
            text: "Back",
            onPressed: () {},
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
                    mainAxisAlignment: MainAxisAlignment.center,
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
                  CustomButton(onPressed: (){}, text: "Search",),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
