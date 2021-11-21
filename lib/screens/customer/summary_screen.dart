import 'package:flutter/material.dart';
import 'package:washout/Widgets/general/custom_appbar.dart';
import 'package:washout/Widgets/general/custom_drawer.dart';
import 'package:washout/screens/customer/customer_home_screen.dart';
import 'package:washout/screens/customer/merchant_detail_screen.dart';
import 'package:washout/widgets/general/carwash_card.dart';
import 'package:washout/widgets/general/custom_back_button.dart';
import 'package:washout/widgets/general/custom_button.dart';
import 'package:washout/widgets/general/summary_detail.dart';
import 'package:washout/widgets/general/summary_header.dart';

class SummaryScreen extends StatelessWidget {
  static const routeName = "/summary";
  const SummaryScreen({Key? key}) : super(key: key);
  Widget _buildHeader({String text = "", String tailingText = ""}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          const Spacer(),
          Text(tailingText),
        ],
      ),
    );
  }

  Widget _buildDetail({String text = "", String tailingText = ""}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Text(text),
          Spacer(),
          Text(tailingText),
        ],
      ),
    );
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarwashCard(
                  id: "123456",
                  name: "ABC carcare",
                  onPressed: () {},
                  showBorder: false,
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                  SummaryDetail(
                      text: "brand - model", tailingText: "license"),
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
                ],
              ),
            ),
            CustomButton(
              onPressed: () {
                Navigator.of(context).pushNamed(MerchantDetailScreen.routeName);
              },
              text: "Close",
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
