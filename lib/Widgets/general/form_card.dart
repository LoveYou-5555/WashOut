// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class FormCard extends StatelessWidget {
  const FormCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 1),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login",
              style: TextStyle(
                  fontSize: 45, fontFamily: "Poppins-Bold", letterSpacing: 0.6),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Username",
              style: TextStyle(
                fontFamily: "Poppins-Medium",
                fontSize: 26,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "username",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "PassWord",
              style: TextStyle(
                fontFamily: "Poppins-Medium",
                fontSize: 26,
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.blue,
                    fontFamily: "Poppins-Medium",
                    fontSize: 28,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
