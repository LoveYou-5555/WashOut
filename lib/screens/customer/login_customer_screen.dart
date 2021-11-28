// ignore_for_file: prefer_const_constructors, avoid_unnecess ary_containers, must_be_immutable, prefer_const_literals_to_create_immutables
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:washout/configs/colors.dart';
import 'package:washout/configs/const.dart';
import 'package:washout/configs/sizes.dart';
import 'package:washout/screens/customer/register_customer_screen.dart';
import 'package:washout/screens/general/app_entry.dart';
import 'package:washout/services/firestore_customers.dart';
import 'package:washout/services/firestore_merchants.dart';
import 'package:washout/widgets/general/custom_button.dart';
import 'package:washout/widgets/general/login_screen_logo.dart';

class LoginCustomerScreen extends StatelessWidget {
  static const routeName = "/customerLogin";

  final _email = TextEditingController();
  final _password = TextEditingController();

  LoginCustomerScreen({
    Key? key,
  }) : super(key: key);

  void _switchToMerchant(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool(isMerchantPrefKey, true);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppEntry.routeName, (route) => false);
  }

  Future<void> signIn(BuildContext context) async {
    if (_email.text.isNotEmpty && _password.text.length >= 6) {
      try {
        if (await FirestoreMerchants().getMerchantByEmail(_email.text) !=
            null) {
          print("wrong mode");
          return;
        }

        final userCred = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text,
          password: _password.text,
        );
        final pref = await SharedPreferences.getInstance();
        final cus =
            await FirestoreCustomer().getCustomerByUID(userCred.user!.uid);

        print('get customer complete');

        await pref.setString(firstNamePrefKey, cus!.firstName);
        await pref.setString(lastNamePrefKey, cus.lastName);

        print('set pref complete');

        Navigator.of(context)
            .pushNamedAndRemoveUntil(AppEntry.routeName, (route) => false);
      } catch (e) {
        print(e);
        print("Can't sign in");
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("Failed to login"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Close"),
              )
            ],
          ),
        );
      }
    }
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
                  isMerchant: false,
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
                    kSizedBoxVerticalS,
                    TextField(
                      decoration: InputDecoration(labelText: 'E-mail'),
                      controller: _email,
                    ),
                    SizedBox(
                      height: 13.0,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password(6-20Characters)',
                      ),
                      controller: _password,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            color: kCustomerPrimary,
                            onPressed: () => signIn(context),
                            text: 'Sign In',
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
                          child: Text("Create account"),
                          onPressed: () => Navigator.of(context)
                              .pushNamed(RegisterCustomerScreen.routeName),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "You're Merchant?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextButton(
                          child: Text(
                            "Login Merchant",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          onPressed: () => _switchToMerchant(context),
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
