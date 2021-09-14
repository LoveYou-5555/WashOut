import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_page_ui/loginmerchant.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'main.dart';
import 'model/Profile.dart';

class RegistermPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegistermPage> {
  Future<FirebaseUser> signUp(String email, String password) async {
    AuthResult ar = await fa.createUserWithEmailAndPassword(
        email: email, password: password);
    return ar.user;
  }

  FirebaseAuth fa = FirebaseAuth.instance;
  bool x = false;
  void changeX() {
    setState(() {
      x = !x;
    });
  }

  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        // title: Image.asset(
        //   'assets/backbutton.png',width: 35.0,
        // ),
        leading: BackButton(
          color: Colors.blue,
        ),
      ),
      body: Column(
        children: [
          Expanded(child: Container(), flex: 70),
          Expanded(
            flex: 766,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                  child: Form(
                      key: formKey,
                      child: Column(children: [
                        Text(
                          'Create account',
                          style: TextStyle(
                              fontSize: 35.0, fontWeight: FontWeight.bold),
                        ),
                        Container(height: 15),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "กรุณาใส่ชื่อด้วยครับ"),
                          decoration: InputDecoration(labelText: 'Name'),
                        ),
                        Container(height: 5),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "กรุณาใส่ชื่อด้วยครับ"),
                          decoration: InputDecoration(labelText: 'LastName'),
                        ),
                        Container(height: 5),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "กรุณาใส่เลขบัตรประชาชนด้วยครับ"),
                          decoration: InputDecoration(labelText: 'Idcard'),
                        ),
                        Container(height: 5),
                        TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: "กรุณาใส่ email ครับ"),
                            EmailValidator(errorText: "รูปแบบ email ไม่ถูกต้อง")
                          ]),
                          decoration: InputDecoration(labelText: 'Email'),
                          onSaved: (String email) {
                            profile.email = email;
                          },
                        ),
                        Container(height: 5),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "กรุณาใส่ password ครับ"),
                          obscureText: true,
                          onSaved: (String password) {
                            profile.password = password;
                          },
                          decoration: InputDecoration(
                              labelText: 'Password(6-20 characters)'),
                        ),
                        Container(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                                value: x,
                                onChanged: (newValue) {
                                  setState(() {
                                    x = newValue;
                                  });
                                }),
                            Text(
                              'I agree with our',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text("Terms"),
                            ),
                            Text(
                              'and',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text("Conditions"),
                            ),
                          ],
                        ),
                        Container(height: 5),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState.validate()) {
                                formKey.currentState.save();
                                print(
                                    "email = ${profile.email} password = ${profile.password}");
                                formKey.currentState.reset();
                                signUp(profile.email, profile.password);
                                Navigator.pop(context);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 80.0, vertical: 15.0),
                              child: Text('Create account'),
                            ),
                          ),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (Context) {
                                        return LoginMerchantPage();
                                      },
                                    ),
                                  );
                                },
                                child: Text('Sign in'))
                          ],
                        )
                      ]))),
            ),
          ),
        ],
      ),
    );
  }
}
