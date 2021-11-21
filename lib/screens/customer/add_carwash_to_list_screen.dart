// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:washout/Widgets/general/carwash_card.dart';
import 'package:washout/Widgets/general/custom_button.dart';
import 'package:washout/configs/sizes.dart';
import 'package:washout/model/merchant.dart';
import 'package:washout/screens/general/app_entry.dart';
import 'package:washout/services/firestore_queue_tickets.dart';
import 'package:washout/widgets/general/custom_appbar.dart';
import 'package:washout/widgets/general/custom_back_button.dart';
import 'package:washout/widgets/general/custom_drawer.dart';

final _dummyMerchant = Merchant(
  carwashID: "abc123",
  email: "mail@mail.com",
  name: "Bob ar",
  uid: "12",
);

class AddCarwashToListScreen extends StatefulWidget {
  static const routeName = "/addCarwashList";
  const AddCarwashToListScreen({Key? key}) : super(key: key);

  @override
  _AddCarwashToListScreenState createState() => _AddCarwashToListScreenState();
}

class _AddCarwashToListScreenState extends State<AddCarwashToListScreen> {
  @override
  Widget build(BuildContext context) {
    var data = _dummyMerchant;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        isMerchant: false,
      ),
      drawer: CustomDrawer(
        accountEmail: "mail@mail.com",
        accountName: "Bob Simmons",
        onSignOut: () {},
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          CustomBackButton(
            onPressed: () {},
            text: "Back",
          ),
          kSizedBoxVerticalM,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSizeM),
            child: CarwashCard(
              id: data.carwashID,
              name: data.name,
              onPressed: () {},
              active: false,
              showBorder: true,
            ),
          ),
          kSizedBoxVerticalM,
          CustomButton(
            onPressed: () {},
            text: "Add this carwash",
          ),
        ],
      ),
    );
  }
}
