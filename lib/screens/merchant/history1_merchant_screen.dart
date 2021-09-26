import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:washout/Widgets/general/custom_appbar.dart';
import 'package:washout/Widgets/general/custom_drawer.dart';
import 'package:washout/configs/app_color.dart';
import 'package:washout/configs/sizes.dart';
import 'package:washout/screens/general/app_entry.dart';
import 'package:washout/screens/merchant/merchant_home_screen.dart';
import 'package:washout/screens/merchant/service_merchant_screen.dart';

class HistoryMerchantScreen extends StatefulWidget {
  const HistoryMerchantScreen({Key? key}) : super(key: key);

  @override
  _HistoryMerchantScreenState createState() => _HistoryMerchantScreenState();
}

class _HistoryMerchantScreenState extends State<HistoryMerchantScreen> {
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
                  return MerchantHomeScreen();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColor.merchantPrimary,
                  ),
                ),
                Text(
                  '1 มกราคม 2999',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                TextButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColor.merchantPrimary,
                  ),
                ),
              ],
            ),
            Container(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'จำนวนคิวทั้งหมด',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '5 คิว',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )
              ],
            ),
            Container(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(children: [
                                Text(
                                  '# 1',
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5)),
                                  width: 60,
                                  height: 20,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          'เสร็จสิ้น',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ]),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'ว่องไว ไกลสุดฟ้า',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('เมื่อเวลา',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                              Row(
                                children: [
                                  Text("14.30" ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
                                  SizedBox(width: 10,),
                                  Text("PM",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
