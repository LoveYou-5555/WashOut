// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:washout/configs/colors.dart';
import 'package:washout/configs/const.dart';
import 'package:washout/configs/sizes.dart';
import 'package:washout/screens/general/app_entry.dart';
import 'package:washout/screens/merchant/merchant_home_screen.dart';
import 'package:washout/screens/merchant/register_merchant_screen.dart';
import 'package:washout/services/firestore_customers.dart';
import 'package:washout/services/firestore_merchants.dart';
import 'package:washout/widgets/general/custom_button.dart';
import 'package:washout/widgets/general/login_screen_logo.dart';

class LoginMerchantScreen extends StatelessWidget {
  static const routeName = "/merchantLogin";

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  LoginMerchantScreen({
    Key? key,
  }) : super(key: key);

  Future<void> signIn(BuildContext context) async {
    if (_email.text.isNotEmpty && _password.text.length >= 6) {
      try {
        if (await FirestoreCustomer().getCustomerByEmail(_email.text) != null) {
          print("wrong mode");
          return;
        }

        final userCred = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text,
          password: _password.text,
        );

        final pref = await SharedPreferences.getInstance();
        final merch =
            await FirestoreMerchants().getMerchantByUID(userCred.user!.uid);

        print('get merchant complete');

        await pref.setString(namePrefKey, merch!.name);

        print('set pref complete');

        Navigator.of(context)
            .pushNamedAndRemoveUntil(AppEntry.routeName, (route) => false);
      } catch (e) {
        print(e);
        print("Can't sign in");
      }
    }
  }

  void _switchToCustomer(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool(isMerchantPrefKey, false);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppEntry.routeName, (route) => false);
  }

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
                      controller: _email,
                      decoration: InputDecoration(labelText: 'E-mail'),
                    ),
                    SizedBox(
                      height: 13.0,
                    ),
                    TextField(
                      controller: _password,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password(6-20Characters)',
                      ),
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
                              color: AppColor.merchantPrimary),
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
                          onPressed: () => _switchToCustomer(context),
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
