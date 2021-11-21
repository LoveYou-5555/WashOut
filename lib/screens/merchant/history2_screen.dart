import 'package:flutter/material.dart';
import 'package:washout/Widgets/general/custom_appbar.dart';
import 'package:washout/Widgets/general/custom_button.dart';
import 'package:washout/configs/colors.dart';
import 'package:washout/screens/merchant/merchant_home_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEAEA),
      appBar: CustomAppBar(
        isMerchant: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('AAA'),
              accountEmail: Text('haha@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://i.pinimg.com/474x/f5/0f/ca/f50fcac962f825241f039d2eede27c50.jpg'),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios),
                  Text(
                    'Sigh Out',
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
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
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          width: 70,
                                          height: 20,
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                  size: 10,
                                                ),
                                                Text(
                                                  'เสร็จสิ้น',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'สหัสวัต เพชรมณี',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '082-4585957',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.red[300],
                                              borderRadius:
                                                  BorderRadius.circular(0)),
                                          width: 65,
                                          height: 20,
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'ล้างรถ',
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.red[300],
                                              borderRadius:
                                                  BorderRadius.circular(0)),
                                          width: 65,
                                          height: 20,
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'ดูดฝุ่น',
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Text(
                                      'ส่วนลด',
                                      style: TextStyle(
                                        fontSize: 23,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      '200บ.',
                                      style: TextStyle(
                                        fontSize: 23,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      color: Colors.blue,
                                      width: 100,
                                      height: 60,
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'กอ 5445',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text("ชื่อรถ"),
                                        Icon(
                                          Icons.color_lens_outlined,
                                          color: Colors.red,
                                        ),
                                        Text("สี")
                                      ],
                                    ),
                                    SizedBox(
                                      height: 55,
                                    ),
                                    Text(
                                      'สรุปราคา',
                                      style: TextStyle(
                                        fontSize: 23,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      '300บ.',
                                      style: TextStyle(
                                        fontSize: 23,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ],
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
