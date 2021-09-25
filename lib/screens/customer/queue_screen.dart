// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:washout/widgets/general/carwash_card.dart';
import 'package:washout/widgets/general/custom_appbar.dart';
import 'package:washout/widgets/general/custom_back_button.dart';
import 'package:washout/widgets/general/custom_button.dart';
import 'package:washout/widgets/general/custom_drawer.dart';
import 'package:washout/widgets/general/queue_status_ticket.dart';

class QueueScreen extends StatefulWidget {
  const QueueScreen({Key? key}) : super(key: key);

  @override
  State<QueueScreen> createState() => _QueueScreenState();
}

class _QueueScreenState extends State<QueueScreen> {
  bool _isOnService = true;

  Widget _buildUserStatusTicket() {
    return SizedBox(
      height: 120,
      child: Row(
        children: [
          Column(
            children: [
              Expanded(
                flex: 7,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffB5B5B5),
                  ),
                  child: Center(
                    child: Text(
                      'Awaiting',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 13,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Username 01",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            Text(
                              "Nissan march",
                            ),
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "Repaint",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
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
        accountName: "Bob Boc",
        onSignOut: () {},
        imageURL:
            "https://i.pinimg.com/474x/f5/0f/ca/f50fcac962f825241f039d2eede27c50.jpg",
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          CustomBackButton(
            text: "Back",
            onPressed: () {},
          ),
          CarwashCard(
            id: "123456",
            imageUrl:
                "https://i.pinimg.com/474x/f5/0f/ca/f50fcac962f825241f039d2eede27c50.jpg",
            name: "ABC Carcare",
            onPressed: () {},
            showBorder: false,
          ),
          SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Queue Before You',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                '3',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              Text(
                'Queue',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
          SizedBox(height: 30),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  QueueStatusTicket(
                    color: Color(0xffFFC107),
                    ticketCount: 5,
                    statusLabel: "Washing",
                  ),
                  SizedBox(height: 15),
                  QueueStatusTicket(
                    color: Color(0xffB5B5B5),
                    ticketCount: 2,
                    statusLabel: 'Awaiting',
                  ),
                  Spacer(),
                  if (!_isOnService)
                    SizedBox(
                      width: 200,
                      child: CustomButton(
                        onPressed: () {},
                        text: "Use Service",
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (_isOnService)
          _buildUserStatusTicket(),
        ],
      ),
    );
  }
}
