import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_page_ui/register.dart';
import 'package:flutter_login_page_ui/homepage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController t = TextEditingController();
  TextEditingController tt = TextEditingController();
  FirebaseAuth fa = FirebaseAuth.instance;
  Future<void> signin(String email, String password) async {
    AuthResult ar =
        await fa.signInWithEmailAndPassword(email: email, password: password);
    print(ar.user);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (Context) {
          return HomePage();
        },
      ),
    );
  }

  bool _isSelected = false;

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              )
            : Container(),
      );

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(120),
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(child: Container(), flex: 161),
          Expanded(
              flex: 735,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage("assets/logo_1.png"),
                      ),
                      Container(
                        height: 60.0,
                      ),
                      Row(
                        children: [
                          Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 35.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        height: 17.0,
                      ),
                      TextField(
                        controller: t,
                        decoration: InputDecoration(labelText: 'E-mail'),
                      ),
                      Container(
                        height: 13.0,
                      ),
                      TextField(
                        controller: tt,
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'Password(6-20Characters)'),
                      ),
                      Container(
                        height: 40.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: ElevatedButton(
                            onPressed: () {
                              signin(t.text, tt.text);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 120.0, vertical: 15.0),
                              child: Text('Sign In'),
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextButton(
                            child: Text("Create account"),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (Context) {
                                    return RegisterPage();
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
