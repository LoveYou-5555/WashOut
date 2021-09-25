// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:washout/Widgets/general/custom_appbar.dart';
import 'package:washout/configs/app_color.dart';
import 'package:washout/configs/asset_paths.dart';
import 'package:washout/widgets/general/carwash_card.dart';
import 'package:washout/widgets/general/custom_back_button.dart';
import 'package:washout/widgets/general/custom_drawer.dart';
import 'package:washout/widgets/general/text_button_with_icon.dart';

// 'https://i.pinimg.com/474x/f5/0f/ca/f50fcac962f825241f039d2eede27c50.jpg'

const _dummy = [
  {
    "id": "123456",
    "name": "ABC Carwash",
    "imageURL":
        "https://i.pinimg.com/474x/f5/0f/ca/f50fcac962f825241f039d2eede27c50.jpg",
  },
  {
    "id": "789102",
    "name": "DEF Carwash",
    "imageURL":
        "https://i.pinimg.com/474x/f5/0f/ca/f50fcac962f825241f039d2eede27c50.jpg",
  },
  {
    "id": "7eeeee2",
    "name": "8min washer",
    "imageURL":
        "https://i.pinimg.com/474x/f5/0f/ca/f50fcac962f825241f039d2eede27c50.jpg",
  },
    {
    "id": "123456",
    "name": "ABC Carwash",
    "imageURL":
        "https://i.pinimg.com/474x/f5/0f/ca/f50fcac962f825241f039d2eede27c50.jpg",
  },
  {
    "id": "789102",
    "name": "DEF Carwash",
    "imageURL":
        "https://i.pinimg.com/474x/f5/0f/ca/f50fcac962f825241f039d2eede27c50.jpg",
  },
  {
    "id": "7eeeee2",
    "name": "8min washer",
    "imageURL":
        "https://i.pinimg.com/474x/f5/0f/ca/f50fcac962f825241f039d2eede27c50.jpg",
  },
    {
    "id": "123456",
    "name": "ABC Carwash",
    "imageURL":
        "https://i.pinimg.com/474x/f5/0f/ca/f50fcac962f825241f039d2eede27c50.jpg",
  },
  {
    "id": "789102",
    "name": "DEF Carwash",
    "imageURL":
        "https://i.pinimg.com/474x/f5/0f/ca/f50fcac962f825241f039d2eede27c50.jpg",
  },
  {
    "id": "7eeeee2",
    "name": "8min washer",
    "imageURL":
        "https://i.pinimg.com/474x/f5/0f/ca/f50fcac962f825241f039d2eede27c50.jpg",
  },
    {
    "id": "123456",
    "name": "ABC Carwash",
    "imageURL":
        "https://i.pinimg.com/474x/f5/0f/ca/f50fcac962f825241f039d2eede27c50.jpg",
  },
  {
    "id": "789102",
    "name": "DEF Carwash",
    "imageURL":
        "https://i.pinimg.com/474x/f5/0f/ca/f50fcac962f825241f039d2eede27c50.jpg",
  },
  {
    "id": "7eeeee2",
    "name": "8min washer",
    "imageURL":
        "https://i.pinimg.com/474x/f5/0f/ca/f50fcac962f825241f039d2eede27c50.jpg",
  },
];

class HomeScreen extends StatefulWidget {
  static const routeName = "/homeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> _dataList = _dummy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        isMerchant: false,
      ),
      drawer: CustomDrawer(
        accountEmail: "mail@mail.com",
        accountName: "Name Name",
        onSignOut: () {},
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 30,
        ),
        child: Column(
          children: [
            TextButtonWithIcon(
              icon: Icon(
                Icons.add_circle_outline,
                color: AppColor.customerPrimary,
                size: 50,
              ),
              onPressed: () {},
              text: "Add carwash",
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _dummy.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CarwashCard(
                        id: _dummy[index]["id"] ?? "",
                        imageUrl: _dummy[index]["imageURL"] ?? "",
                        name: _dummy[index]["name"] ?? "",
                        onPressed: () {},
                      ),
                      if (index != _dummy.length - 1)
                        SizedBox(
                          height: 20,
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
