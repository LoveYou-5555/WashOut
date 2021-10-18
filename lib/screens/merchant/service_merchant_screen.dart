import 'package:flutter/material.dart';
import 'package:washout/Widgets/general/checkbox_option.dart';
import 'package:washout/Widgets/general/custom_appbar.dart';
import 'package:washout/Widgets/general/custom_button.dart';
import 'package:washout/Widgets/general/custom_drawer.dart';
import 'package:washout/configs/app_color.dart';
import 'package:washout/screens/customer/home_screen.dart';
import 'package:washout/screens/general/app_entry.dart';
import 'package:washout/screens/merchant/add_service_merchant_screen.dart';
import 'package:washout/screens/merchant/merchant_home_screen.dart';

class ServiceMerchantScreen extends StatefulWidget {


  const ServiceMerchantScreen({Key? key}) : super(key: key);

  @override
  _ServiceMerchantScreenState createState() => _ServiceMerchantScreenState();
}

class _ServiceMerchantScreenState extends State<ServiceMerchantScreen> {
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
      body: Column(
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
            height: 30,
          ),
          Expanded(
            flex: 771,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                child: Column(
                  children: [
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Container(
                    //         child: Row(
                    //           children: [
                    //             Icon(
                    //               Icons.fiber_manual_record,
                    //               color: Colors.green[400],
                    //             ),
                    //             SizedBox(
                    //               width: 10,
                    //             ),
                    //             Text('ล้างรถ'),
                    //             Spacer(),
                    //             Text('฿ 200'),
                    //           ],
                    //         ),
                    //         color: Colors.white,
                    //         padding: EdgeInsets.all(20),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    CheckboxItem(
                      text: 'ล้างรถ',
                      onTap: () {},
                      checked: true,
                      backgroundColor: Colors.white,
                      checkedColor: Colors.green,
                      uncheckedColor: Colors.grey,
                      tailingText: '฿ 200',
                    ),
                    Container(height: 15),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Container(
                    //         child: Row(
                    //           children: [
                    //             Icon(
                    //               Icons.fiber_manual_record,
                    //               color: Colors.grey,
                    //             ),
                    //             SizedBox(
                    //               width: 10,
                    //             ),
                    //             Text('ขัดสี'),
                    //             Spacer(),
                    //             Text('฿ 900'),
                    //           ],
                    //         ),
                    //         color: Colors.white,
                    //         padding: EdgeInsets.all(20),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    CheckboxItem(
                      text: 'ขัดสี',
                      onTap: () {},
                      checked: true,
                      backgroundColor: Colors.white,
                      checkedColor: Colors.green,
                      uncheckedColor: Colors.grey,
                      tailingText: '฿ 900',
                    ),
                    Container(
                      height: 20,
                    ),
                    Expanded(
                      flex: 771,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Container(
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return AddServiceMerchantScreen();
                                      },
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add_circle_outline,
                                      size: 35,
                                      color: AppColor.merchantPrimary,
                                    ),
                                    Text(
                                      'Add Service',
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: AppColor.merchantPrimary),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
