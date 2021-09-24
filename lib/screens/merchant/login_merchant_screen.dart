// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:washout/configs/app_color.dart';
import 'package:washout/configs/sizes.dart';
import 'package:washout/screens/merchant/merchant_home_screen.dart';
import 'package:washout/screens/register_merchant_screen.dart';
import 'package:washout/widgets/general/custom_button.dart';
import 'package:washout/widgets/general/login_screen_logo.dart';

class LoginMerchantScreen extends StatelessWidget {
  final void Function() onModeSwitch;

  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();

  LoginMerchantScreen({
    Key? key,
    required this.onModeSwitch,
  }) : super(key: key);

  Future<void> signIn(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return MerchantHomeScreen();
        },
      ),
    );
  }

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
              )
            : Container(),
      );

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: 120,
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: LoginScreenLogo(
                  isMerchant: true,
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: Sizes.fonts.mainTitle,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 17.0,
                    ),
                    TextField(
                      controller: _emailField,
                      decoration: InputDecoration(labelText: 'E-mail'),
                    ),
                    SizedBox(
                      height: 13.0,
                    ),
                    TextField(
                      controller: _passwordField,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password(6-20Characters)',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Forget Password?",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        TextButton(
                          child: Text(
                            "Reset Password",
                            style: TextStyle(
                              color: AppColor.merchantPrimary,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              RegisterMerchantScreen.routeName,
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            onPressed: () => signIn(context),
                            text: 'Sign In',
                            color: AppColor.merchantPrimary
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        TextButton(
                          child: Text(
                            "Create account",
                            style: TextStyle(color: AppColor.merchantPrimary),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              RegisterMerchantScreen.routeName,
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "You're Customer?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextButton(
                          child: Text(
                            "Login Customer",
                            style: TextStyle(color: AppColor.customerPrimary),
                          ),
                          onPressed: onModeSwitch,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
