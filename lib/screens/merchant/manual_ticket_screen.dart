// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:washout/configs/colors.dart';
import 'package:washout/configs/sizes.dart';
import 'package:washout/services/firestore_queue_tickets.dart';
import 'package:washout/widgets/appbars/merchant_appbar.dart';
import 'package:washout/widgets/general/custom_back_button.dart';
import 'package:washout/widgets/general/custom_button.dart';
import 'package:washout/widgets/general/custom_drawer.dart';

class ManualTicketScreen extends StatelessWidget {
  static const routeName = "/manualTicket";

  final _licensePlate = TextEditingController();
  final _phone = TextEditingController();

  Future<void> sendTicket(BuildContext context) async {
    if (_licensePlate.text.isNotEmpty) {
      final queue = await FirestoreQueueTickets()
          .getQueueTicketByLicensePlate(_licensePlate.text);

      if (queue != null) {
        print("Cant create: dup plate");
      } else {
        await FirestoreQueueTickets().createQueueTicketManually(
          licensePlate: _licensePlate.text,
          phone: _phone.text.isEmpty ? null : _phone.text,
        );

        Future.delayed(const Duration(seconds: 2));
        Navigator.of(context).pop();
      }
    }
  }

  ManualTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MerchantAppBar(),
      drawer: CustomDrawer(
        primaryColor: kMerchantPrimary,
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          CustomBackButton(
            text: "Back",
            onPressed: () {
              Navigator.of(context).pop();
            },
            iconColor: kMerchantPrimary,
          ),
          Container(
            height: 50,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "New ticket",
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  kSizedBoxVerticalM,
                  TextField(
                    controller: _licensePlate,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Customer's license plate",
                    ),
                  ),
                  kSizedBoxVerticalS,
                  TextField(
                    controller: _phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Customer's phone",
                    ),
                  ),
                  kSizedBoxVerticalS,
                  CustomButton(
                    onPressed: () => sendTicket(context),
                    color: kMerchantPrimary,
                    text: "Confirm",
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
