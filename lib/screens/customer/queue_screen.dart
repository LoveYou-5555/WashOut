// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:washout/widgets/general/carwash_card.dart';
import 'package:washout/widgets/general/custom_appbar.dart';
import 'package:washout/widgets/general/custom_back_button.dart';
import 'package:washout/widgets/general/custom_drawer.dart';

class QueueScreen extends StatefulWidget {
  const QueueScreen({Key? key}) : super(key: key);

  @override
  State<QueueScreen> createState() => _QueueScreenState();
}

class _QueueScreenState extends State<QueueScreen> {
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
          // Container(
          //   width: 300,
          //   height: 100,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [

          //       // CircleAvatar(
          //       //   radius: 50,
          //       //   backgroundImage: NetworkImage(
          //       //       'https://i.pinimg.com/474x/f5/0f/ca/f50fcac962f825241f039d2eede27c50.jpg'),
          //       // ),
          //       // SizedBox(
          //       //   width: 20,
          //       //   height: 60,
          //       // ),
          //       // Column(
          //       //   children: [
          //       //     Padding(padding: EdgeInsets.only(top: 20)),
          //       //     Text(
          //       //       'ABC CARCARE',
          //       //       style: TextStyle(
          //       //           color: Colors.black,
          //       //           fontWeight: FontWeight.bold,
          //       //           fontSize: 20),
          //       //     ),
          //       //     SizedBox(height: 10),
          //       //     Text(
          //       //       'ID: 123456',
          //       //       style: TextStyle(
          //       //           color: Colors.black,
          //       //           fontWeight: FontWeight.bold,
          //       //           fontSize: 15),
          //       //     ),
          //       //   ],
          //       // ),
          //     ],
          //   ),
          // ),
          CarwashCard(
            id: "123456",
            imageUrl: "https://i.pinimg.com/474x/f5/0f/ca/f50fcac962f825241f039d2eede27c50.jpg",
            name: "ABC Carcare",
            onPressed: (){},
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
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Container(
                          child: Center(
                              child: Text(
                            'Washing',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffFFC107),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 13,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 25,
                              ),
                              Text(
                                '2',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                'Queue',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Container(
                          child: Center(
                            child: Text(
                              'Awaiting',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffB5B5B5),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 13,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 25,
                              ),
                              Text(
                                '1',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                'Queue',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey)),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                        vertical: 5.0,
                      ),
                      child: Text(
                        'Use service',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(height: 150),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
