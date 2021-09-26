import 'package:flutter/material.dart';
import 'package:washout/Widgets/general/custom_appbar.dart';
import 'package:washout/Widgets/general/custom_button.dart';
import 'package:washout/configs/app_color.dart';
import 'package:washout/screens/merchant/merchant_home_screen.dart';

class ManageQueueScreen extends StatefulWidget {
  const ManageQueueScreen({Key? key}) : super(key: key);

  @override
  _ManageQueueScreenState createState() => _ManageQueueScreenState();
}

class _ManageQueueScreenState extends State<ManageQueueScreen> {
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
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          width: 70,
                                          height: 20,
                                          child: Center(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.hourglass_bottom,
                                                  color: Colors.white,
                                                  size: 10,
                                                ),
                                                Text(
                                                  'รอดำเนินการ',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                  ),
                                                  textAlign: TextAlign.center,
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
                                              color: Colors.orange,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          width: 50,
                                          height: 20,
                                          child: Center(
                                            child: Column(
                                              children: [
                                                Text(
                                                  'ใหม่',
                                                  style: TextStyle(
                                                    fontSize: 13,
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
                                      height: 5,
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
                                      height: 5,
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
                                      height: 15,
                                    ),
                                    Text(
                                      'ส่วนลด',
                                      style: TextStyle(
                                        fontSize: 23,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '200 Bath',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        CustomButton(
                                          onPressed: () {},
                                          text: 'Cancel',
                                          color: Colors.red,
                                        ),
                                      ],
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
                                    Text(
                                      'ราคา',
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
                                    Row(
                                      children: [
                                        CustomButton(
                                          onPressed: () {},
                                          text: 'ดำเนินการ',
                                          color: Colors.yellow[700],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            height: 327,
                            width: 300,
                            color: Colors.white,
                          ),
                        )
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
