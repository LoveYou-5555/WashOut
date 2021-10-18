// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:washout/Widgets/general/custom_appbar.dart';
import 'package:washout/Widgets/general/custom_button.dart';
import 'package:washout/Widgets/general/custom_drawer.dart';
import 'package:washout/configs/app_color.dart';
import 'package:washout/screens/general/app_entry.dart';
import 'package:washout/screens/merchant/service_merchant_screen.dart';

class AddServiceMerchantScreen extends StatefulWidget {
  const AddServiceMerchantScreen({Key? key}) : super(key: key);

  @override
  _AddServiceMerchantScreenState createState() =>
      _AddServiceMerchantScreenState();
}

class _AddServiceMerchantScreenState extends State<AddServiceMerchantScreen> {
  String dropdownvalue = 'ล้างรถ';
  var items = ['ล้างรถ', 'ขัดสี', 'ดูดฝุ่น', 'อื่นๆ'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color(0xFFEFEAEA),
      appBar: CustomAppBar(
        isMerchant: true,
        iconColor: AppColor.merchantPrimary,
      ),
      drawer: CustomDrawer(
        accountEmail: "email@mail.com",
        accountName: "Bob Somchai",
        imageURL:
            'https://i.pinimg.com/474x/f5/0f/ca/f50fcac962f825241f039d2eede27c50.jpg',
        onSignOut: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(AppEntry.routeName, (route) => false);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ServiceMerchantScreen();
                }));
              },
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: AppColor.merchantPrimary,
                  ),
                  Text(
                    'ย้อนกลับ',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
              height: 20,
            ),
            Text('Add Service',style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
            Container(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('การบริการ',
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Container(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 20),
                            child: DropdownButton(
                              isExpanded: true,
                              iconEnabledColor: Colors.red,
                              iconSize: 40,
                              dropdownColor: Colors.white,
                              value: dropdownvalue,
                              icon: Icon(Icons.keyboard_arrow_down),
                              items: items.map(
                                (String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                },
                              ).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  if (newValue == null) {
                                  } else {
                                    dropdownvalue = newValue;
                                  }
                                });
                              },
                              
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'บริการอื่นๆ',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            color: Colors.white,
                            height: 60,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('ราคา',
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Container(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text('฿'),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'ใส่ราคา',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            color: Colors.white,
                            height: 60,
                          ),
                        ),
                      ],
                    ),
                    Container(height: 90,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [                       
                        CustomButton(
                          onPressed: () {},
                          text:'Cancel',
                          color: Colors.red,
                        ),
                        CustomButton(
                            onPressed: () {},
                            text:'Submit',
                            color: Colors.green[300],
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
    );
  }
}
