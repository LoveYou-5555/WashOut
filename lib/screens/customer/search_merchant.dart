// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:washout/screens/customer/merchant_detail_screen.dart';
import 'package:washout/services/firestore_merchants.dart';
import 'package:washout/widgets/general/custom_appbar.dart';
import 'package:washout/widgets/general/custom_back_button.dart';
import 'package:washout/widgets/general/custom_button.dart';
import 'package:washout/widgets/general/custom_drawer.dart';

class SearchMerchantScreen extends StatefulWidget {
  static const routeName = "/searchMerchant";

  const SearchMerchantScreen({Key? key}) : super(key: key);

  @override
  _SearchMerchantScreenState createState() => _SearchMerchantScreenState();
}

class _SearchMerchantScreenState extends State<SearchMerchantScreen> {
  final _carwashID = TextEditingController();

  Future<void> confirmSearch() async {
    print("sd");
    if (_carwashID.text.isNotEmpty) {
      final merch =
          await FirestoreMerchants().getMerchantByCarwashID(_carwashID.text);
      if (merch != null) {
        Navigator.of(context)
            .pushNamed(MerchantDetailScreen.routeName, arguments: merch.uid);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        isMerchant: false,
      ),
      drawer: CustomDrawer(),
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
                    controller: _carwashID,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Insert car wash id',
                    ),
                  ),
                  Container(height: 30),
                  CustomButton(
                    onPressed: confirmSearch,
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
