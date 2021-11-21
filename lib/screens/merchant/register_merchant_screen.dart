// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:washout/configs/colors.dart';
import 'package:washout/configs/const.dart';
import 'package:washout/configs/sizes.dart';
import 'package:washout/screens/general/app_entry.dart';
import 'package:washout/services/firestore_customers.dart';
import 'package:washout/services/firestore_merchants.dart';
import 'package:washout/widgets/general/custom_button.dart';

class RegisterMerchantScreen extends StatefulWidget {
  static const routeName = "/registerMerchant";

  const RegisterMerchantScreen({Key? key}) : super(key: key);

  @override
  _RegisterMerchantScreenState createState() => _RegisterMerchantScreenState();
}

class _RegisterMerchantScreenState extends State<RegisterMerchantScreen> {
  final formKey = GlobalKey<FormState>();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _carwashID = TextEditingController();

  void _createAccount(BuildContext context) async {
    if (_email.text.isNotEmpty &&
        _name.text.isNotEmpty &&
        _password.text.length >= 6 &&
        _carwashID.text.isNotEmpty) {
      try {
        if (await FirestoreMerchants().carwashIDExists(_carwashID.text) ||
            await FirestoreCustomer().getCustomerByEmail(_email.text) != null) {
          print("Failed: carwashID already exists");
        } else {
          UserCredential userCred =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email.text,
            password: _password.text,
          );

          await FirestoreMerchants().createAccount(
            uid: userCred.user!.uid,
            name: _name.text,
            carwashID: _carwashID.text,
            email: _email.text,
          );

          final pref = await SharedPreferences.getInstance();
          await pref.setString(namePrefKey, _name.text);

          Navigator.of(context)
              .pushNamedAndRemoveUntil(AppEntry.routeName, (route) => false);
        }
      } catch (e) {
        print("Failed to register");
        print(e);
      }
    } else {
      print("Can't sign up");
    }
  }

  Widget _buildTextField(
      {TextEditingController? controller,
      String? labelText,
      bool obscureText = false}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: kMerchantPrimary,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
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
                            fontSize: kSizeM,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        kSizedBoxVerticalS,
                        _buildTextField(
                          labelText: "Carwash name",
                          controller: _name,
                        ),
                        kSizedBoxVerticalXXS,
                        _buildTextField(
                          labelText: "Email",
                          controller: _email,
                        ),
                        kSizedBoxVerticalXXS,
                        _buildTextField(
                          obscureText: true,
                          labelText: "Password (6-20 characters)",
                          controller: _password,
                        ),
                        kSizedBoxVerticalXXS,
                        _buildTextField(
                          labelText: "Carwash ID",
                          controller: _carwashID,
                        ),
                        kSizedBoxVerticalM,
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                onPressed: () => _createAccount(context),
                                color: kMerchantPrimary,
                                text: 'Create account',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
