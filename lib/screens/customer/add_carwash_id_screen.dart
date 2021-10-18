// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:washout/screens/customer/add_carwash_to_list_screen.dart';
import 'package:washout/services/firestore_merchants.dart';
import 'package:washout/widgets/general/custom_appbar.dart';
import 'package:washout/widgets/general/custom_back_button.dart';
import 'package:washout/widgets/general/custom_button.dart';
import 'package:washout/widgets/general/custom_drawer.dart';

class AddCarwashIdScreen extends StatefulWidget {
  static const routeName = "/addCarwashId";

  const AddCarwashIdScreen({Key? key}) : super(key: key);

  @override
  _AddCarwashIdScreenState createState() => _AddCarwashIdScreenState();
}

class _AddCarwashIdScreenState extends State<AddCarwashIdScreen> {
  final TextEditingController _idField = TextEditingController();

  void _searchCarwash() async {
    Map<String, dynamic> carwash = await FirestoreMerchants.getMerchantByUID(_idField.text);
    if(carwash.isNotEmpty){
      Navigator.of(context).pushNamed(AddCarwashToListScreen.routeName, arguments: carwash);
    }
  }

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
            onPressed: () {
              Navigator.of(context).pop();
            },
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
                    controller: _idField,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Insert car wash id',
                    ),
                  ),
                  Container(height: 30),
                  CustomButton(
                    onPressed: () {
                      _searchCarwash();
                      // Navigator.of(context)
                      //     .pushNamed(AddCarwashToListScreen.routeName);
                    },
                    text: "Search",
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
