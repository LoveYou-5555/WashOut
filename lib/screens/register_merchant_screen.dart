// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:washout/configs/app_color.dart';
import 'package:washout/configs/sizes.dart';
import 'package:washout/model/profile.dart';
import 'package:washout/screens/general/app_entry.dart';
import 'package:washout/widgets/general/custom_button.dart';

class RegisterMerchantScreen extends StatefulWidget {
  static const routeName = "/registerMerchant";

  const RegisterMerchantScreen({Key? key}) : super(key: key);

  @override
  _RegisterMerchantScreenState createState() => _RegisterMerchantScreenState();
}

class _RegisterMerchantScreenState extends State<RegisterMerchantScreen> {
  bool _tosChecked = false;

  void _changeTOSCheck(bool? value) {
    setState(() {
      _tosChecked = value ?? false;
    });
  }

  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: "777", password: "jjj");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).popUntil(
              ModalRoute.withName(AppEntry.routeName),
            );
          },
          color: Colors.blue,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Text(
                        'Create account',
                        style: TextStyle(
                          fontSize: Sizes.fonts.mainTitle,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 1.5),
                      TextFormField(
                        validator: (txt) => "กรุณาใส่ชื่อด้วยครับ",
                        decoration: InputDecoration(labelText: 'Name'),
                      ),
                      SizedBox(height: 1.5),
                      TextFormField(
                        validator: (txt) => "กรุณาใส่นามสกุลด้วยครับ",
                        decoration: InputDecoration(labelText: 'ชื่อ'),
                      ),
                      SizedBox(height: 1.5),
                      TextFormField(
                        validator: (txt) => "กรุณาใส่เลขบัตรประชาชนด้วยครับ",
                        decoration: InputDecoration(labelText: 'Idcard'),
                      ),
                      SizedBox(height: 1.5),
                      TextFormField(
                        validator: (txt) => "กรุณาใส่เลขบัตรประชาชนด้วยครับ",
                        decoration: InputDecoration(labelText: 'จังหวัด'),
                      ),
                      SizedBox(height: 1.5),
                      TextFormField(
                        validator: (txt) => "กรุณาใส่เลขบัตรประชาชนด้วยครับ",
                        decoration: InputDecoration(labelText: 'อำเถอ'),
                      ),
                      SizedBox(height: 1.5),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'ถนน'),
                      ),
                      SizedBox(height: 1.25),
                      TextFormField(
                        validator: (txt) => "กรุณาใส่เลขบัตรประชาชนด้วยครับ",
                        decoration:
                            InputDecoration(labelText: 'หมายเลขโทรศัพท์'),
                      ),
                      SizedBox(height: 1),
                      TextFormField(
                        // validator: MultiValidator(
                        //   [
                        //     RequiredValidator(
                        //         errorText: "กรุณาใส่ email ครับ"),
                        //     EmailValidator(
                        //         errorText: "รูปแบบ email ไม่ถูกต้อง")
                        //   ],
                        // ),
                        decoration: InputDecoration(labelText: 'Email'),
                        // onSaved: (String email) {
                        //   profile.email = email;
                        // },
                      ),
                      Container(height: 1),
                      TextFormField(
                        // validator: RequiredValidator(
                        //     errorText: "กรุณาใส่ password ครับ"),
                        obscureText: true,
                        // onSaved: (String password) {
                        //   profile.password = password;
                        // },
                        decoration: InputDecoration(
                            labelText: 'Password(6-20 characters)'),
                      ),
                      SizedBox(height: 1),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              activeColor: Colors.black,
                              value: _tosChecked,
                              onChanged: _changeTOSCheck,
                            ),
                            Text(
                              'I agree with our',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: Sizes.fonts.subtitle,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Terms",
                                style: TextStyle(
                                  color: AppColor.merchantPrimary,
                                  fontSize: Sizes.fonts.subtitle,
                                ),
                              ),
                            ),
                            Text(
                              'and',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: Sizes.fonts.subtitle,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Conditions",
                                style: TextStyle(
                                  color: AppColor.merchantPrimary,
                                  fontSize: Sizes.fonts.subtitle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(height: 1),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              onPressed: () {
                                Navigator.of(context).popUntil(
                                  ModalRoute.withName(AppEntry.routeName),
                                );
                              },
                              color: AppColor.merchantPrimary,
                              text: 'Create account',
                            ),
                          ),
                        ],
                      ),
                      Container(height: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).popUntil(
                                ModalRoute.withName(AppEntry.routeName),
                              );
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                color: AppColor.merchantPrimary,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
