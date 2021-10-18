import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:washout/screens/customer/home_screen.dart';
import 'package:washout/screens/customer/login_customer_screen.dart';
import 'package:washout/screens/customer/register_screen.dart';
import 'package:washout/screens/merchant/login_merchant_screen.dart';
import 'package:washout/screens/merchant/merchant_home_screen.dart';
import 'package:washout/screens/register_merchant_screen.dart';
import 'package:washout/services/authentication.dart';
import 'package:washout/services/firestore_carwash_list.dart';
import 'package:washout/services/firestore_customers.dart';

class AppEntry extends StatefulWidget {
  static const routeName = "/appEntry";

  const AppEntry({Key? key}) : super(key: key);

  @override
  _AppEntryState createState() => _AppEntryState();
}

class _AppEntryState extends State<AppEntry> {
  final loginEmailCont = TextEditingController();
  final loginPassCont = TextEditingController();

  final regisEmailCont = TextEditingController();
  final regisPassCont = TextEditingController();
  final regisNameCont = TextEditingController();
  final regisLNCont = TextEditingController();

  bool _isMerchant = false;
  bool _isSignUp = false;

  User? user;

  bool _firebaseIniting = true;
  bool _firebaseError = false;

  void _initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _firebaseIniting = false;
        user = AppAuthentication.getCurrentUser();
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _firebaseError = true;
      });
    }
  }

  void _switchRole() {
    setState(() {
      _isMerchant = !_isMerchant;
    });
  }

  void _switchSignMode() {
    setState(() {
      _isSignUp = !_isSignUp;
    });
  }

  void _signUp() async {
    try {
      User? u = await AppAuthentication.signUp(
        email: regisEmailCont.text,
        password: regisPassCont.text,
      );

      await FirestoreCustomer.createUser(
        firstName: regisNameCont.text,
        lastName: regisLNCont.text,
      );

      await FirestoreCarwashList.createCarwashList();

      setState(() {
        user = u;
      });
    } catch (e) {
      print("Sign up process failed");
    }
  }

  void _signIn() async {
    User? u = await AppAuthentication.signIn(
      loginEmailCont.text,
      loginPassCont.text,
    );
    setState(() {
      user = u;
    });
  }

  @override
  void initState() {
    super.initState();
    _initializeFlutterFire();
  }

  @override
  Widget build(BuildContext context) {
    if (_firebaseError) {
      return Container();
    }
    if (_firebaseIniting) {
      return Container();
    }

    if (user == null) {
      print("No user");

      if (_isSignUp) {
        return _isMerchant
            ? RegisterMerchantScreen()
            : RegisterScreen(
                onToSignIn: _switchSignMode,
                onSignUp: () {
                  _signUp();
                },
                emailCont: regisEmailCont,
                lnCont: regisLNCont,
                nameCont: regisNameCont,
                passCont: regisPassCont,
              );
      } else {
        return _isMerchant
            ? LoginMerchantScreen(
                onModeSwitch: _switchRole,
              )
            : LoginCustomerScreen(
                onModeSwitch: _switchRole,
                onLogin: _signIn,
                onToSignUp: _switchSignMode,
                emailCont: loginEmailCont,
                passCont: loginPassCont,
              );
      }
    } else {
      print("Has user");
      return _isMerchant ? MerchantHomeScreen() : HomeScreen();
    }
  }
}
