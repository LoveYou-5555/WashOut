import 'package:flutter/material.dart';
import 'package:washout/Widgets/general/custom_appbar.dart';
import 'package:washout/Widgets/general/custom_drawer.dart';
import 'package:washout/screens/customer/summary_screen.dart';
import 'package:washout/widgets/general/custom_back_button.dart';
import 'package:washout/widgets/general/custom_button.dart';
import 'package:washout/widgets/general/summary_detail.dart';
import 'package:washout/widgets/general/summary_header.dart';

import 'choose_car_screen.dart';

class SummaryPreScreen extends StatelessWidget {
  static const routeName = "/summaryPre";
  const SummaryPreScreen({Key? key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/474x/f5/0f/ca/f50fcac962f825241f039d2eede27c50.jpg'),
                  radius: 50,
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
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Service Summary",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xff007AFF),
                    ),
                  ),
                ],
              ),
            ),
            SummaryHeader(
              text: "Car detail",
            ),
            SummaryDetail(text: "brand - model", tailingText: "license"),
            SummaryHeader(
              text: "Service",
            ),
            SummaryDetail(
              text: "washing",
              tailingText: "200 THB",
            ),
            SummaryDetail(
              text: "Repaint",
              tailingText: "600 THB",
            ),
            SummaryHeader(
              text: "Your queue",
              tailingText: "4 Queues",
            ),
            SummaryHeader(
              text: "Total price",
              tailingText: "800 THB",
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(SummaryScreen.routeName);
                      },
                      text: "Confirm",
                      color: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
