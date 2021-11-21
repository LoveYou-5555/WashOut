// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:washout/configs/colors.dart';
import 'package:washout/configs/const.dart';
import 'package:washout/configs/sizes.dart';
import 'package:washout/model/profile.dart';
import 'package:washout/screens/customer/customer_home_screen.dart';
import 'package:washout/screens/general/app_entry.dart';
import 'package:washout/services/firestore_customers.dart';
import 'package:washout/services/firestore_merchants.dart';
import 'package:washout/widgets/general/custom_button.dart';

class RegisterCustomerScreen extends StatefulWidget {
  static const routeName = "/registerCustomer";

  const RegisterCustomerScreen({
    Key? key,
  }) : super(key: key);

  @override
  _RegisterCustomerScreenState createState() => _RegisterCustomerScreenState();
}

class _RegisterCustomerScreenState extends State<RegisterCustomerScreen> {
  final formKey = GlobalKey<FormState>();

  final _name = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _phone = TextEditingController();

  void _createAccount(BuildContext context) async {
    if (_name.text.isNotEmpty &&
        _email.text.isNotEmpty &&
        _password.text.length >= 6 &&
        _password.text.isNotEmpty &&
        _phone.text.isNotEmpty) {
      try {
        

        UserCredential userCred =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text,
          password: _password.text,
        );

        if (await FirestoreMerchants().getMerchantByEmail(_email.text) ==
            null) {
          await FirestoreCustomer().createAccount(
            firstName: _name.text,
            lastName: _lastName.text,
            phone: _phone.text,
            uid: userCred.user!.uid,
            email: _email.text,
          );

          final pref = await SharedPreferences.getInstance();
          await pref.setString(firstNamePrefKey, _name.text);
          await pref.setString(lastNamePrefKey, _lastName.text);

          Navigator.of(context).pushNamedAndRemoveUntil(
              CustomerHomeScreen.routeName, (route) => false);
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
                          labelText: "Name",
                          controller: _name,
                        ),
                        kSizedBoxVerticalXXS,
                        _buildTextField(
                          labelText: "Lastname",
                          controller: _lastName,
                        ),
                        kSizedBoxVerticalXXS,
                        _buildTextField(labelText: "Email", controller: _email),
                        kSizedBoxVerticalXXS,
                        _buildTextField(
                          labelText: "Password(6-20) characters",
                          controller: _password,
                          obscureText: true,
                        ),
                        kSizedBoxVerticalXXS,
                        _buildTextField(
                          labelText: "Phone number",
                          controller: _phone,
                        ),
                        kSizedBoxVerticalM,
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                onPressed: () => _createAccount(context),
                                color: AppColor.customerPrimary,
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
