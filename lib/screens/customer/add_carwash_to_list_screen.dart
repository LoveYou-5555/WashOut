// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:washout/widgets/general/custom_appbar.dart';
import 'package:washout/widgets/general/custom_back_button.dart';
import 'package:washout/widgets/general/custom_drawer.dart';

class AddCarwashToListScreen extends StatefulWidget {
  static const routeName = "/addCarwashList";
  const AddCarwashToListScreen({Key? key}) : super(key: key);

  @override
  _AddCarwashToListScreenState createState() => _AddCarwashToListScreenState();
}

class _AddCarwashToListScreenState extends State<AddCarwashToListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        isMerchant: false,
      ),
      drawer: CustomDrawer(
        accountEmail: "mail@mail.com",
        accountName: "Bob Simmons",
        onSignOut: () {},
        imageURL:
            "https://i.insider.com/5cdedc95021b4c12a50f46f6?width=1136&format=jpeg",
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          CustomBackButton(
            onPressed: () {},
            text: "Back",
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
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      "https://i.insider.com/5cdedc95021b4c12a50f46f6?width=1136&format=jpeg",
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'ABC CAR CARE',
                    style: TextStyle(
                        height: 1, fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    child: Text(
                      'ID : 123456',
                      style: TextStyle(
                          height: 1.5,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    height: 50,
                  ),

                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15.0),
                        child: Text(
                          'ADD',
                          style: TextStyle(fontSize: 20),
                        ),
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
