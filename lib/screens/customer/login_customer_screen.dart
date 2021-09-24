// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:washout/configs/app_color.dart';
import 'package:washout/configs/sizes.dart';
import 'package:washout/screens/customer/home_screen.dart';
import 'package:washout/screens/register_screen.dart';
import 'package:washout/widgets/general/custom_button.dart';
import 'package:washout/widgets/general/login_screen_logo.dart';

class LoginCustomerScreen extends StatelessWidget {
  final void Function() onModeSwitch;

  LoginCustomerScreen({
    Key? key,
    required this.onModeSwitch,
  }) : super(key: key);

  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();

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
                          child: Text("Reset Password"),
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              RegisterScreen.routeName,
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
                            color: AppColor.customerPrimary,
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  HomeScreen.routeName, (route) => false);
                            },
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
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              RegisterScreen.routeName,
                            );
                          },
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
