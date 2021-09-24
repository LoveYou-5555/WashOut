// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:washout/configs/app_color.dart';
import 'package:washout/configs/sizes.dart';
import 'package:washout/model/profile.dart';
import 'package:washout/screens/general/app_entry.dart';
import 'package:washout/widgets/general/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "/registerCustomer";

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _tosChecked = false;

  void _changeTOSCheck(bool? value) {
    setState(() {
      _tosChecked = value ?? false;
    });
  }

  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: "AA", password: "Bb");

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
              padding: const EdgeInsets.all(30.0),
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
                      SizedBox(height: 15),
                      TextFormField(
                        validator: (txt) => "กรุณาใส่ชื่อด้วยครับ",
                        decoration: InputDecoration(labelText: 'Name'),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        validator: (txt) => "กรุณาใส่นามสกุลด้วยครับ",
                        decoration: InputDecoration(labelText: 'LastName'),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        validator: (txt) => "กรุณาใส่เลขบัตรประชาชนด้วยครับ",
                        decoration: InputDecoration(labelText: 'Idcard'),
                      ),
                      SizedBox(height: 5),
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
                      Container(height: 5),
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
                      SizedBox(height: 5),
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
                                  color: AppColor.customerPrimary,
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
                                  color: AppColor.customerPrimary,
                                  fontSize: Sizes.fonts.subtitle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              onPressed: () {
                                Navigator.of(context).popUntil(
                                  ModalRoute.withName(AppEntry.routeName),
                                );
                              },
                              color: AppColor.customerPrimary,
                              text: 'Create account',
                            ),
                          ),
                        ],
                      ),
                      Container(height: 5),
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
                                color: AppColor.customerPrimary,
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
