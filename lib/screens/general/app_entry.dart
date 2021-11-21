import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:washout/configs/const.dart';
import 'package:washout/screens/customer/customer_home_screen.dart';
import 'package:washout/screens/customer/login_customer_screen.dart';
import 'package:washout/screens/merchant/login_merchant_screen.dart';
import 'package:washout/screens/merchant/merchant_home_screen.dart';
import 'package:washout/services/firestore_customers.dart';
import 'package:washout/services/firestore_merchants.dart';

class AppEntry extends StatefulWidget {
  static const routeName = "/appEntry";

  const AppEntry({Key? key}) : super(key: key);

  @override
  _AppEntryState createState() => _AppEntryState();
}

class _AppEntryState extends State<AppEntry> {
  var _firebaseIniting = true;
  var _firebaseError = false;
  var _merchantMode = false;
  var _hasUser = false;

  var _appIniting = true;

  Future<void> _initAppData() async {
    const isMerchKey = "isMerchant";

    final pref = await SharedPreferences.getInstance();
    var merch = pref.getBool(isMerchKey);
    if (merch == null || merch == false) {
      await pref.setBool(isMerchKey, false);
    }

    merch = pref.getBool(isMerchKey);
    setState(() {
      _merchantMode = merch ?? false;
    });
  }

  void _initializeApplication() async {
    setState(() {
      _appIniting = true;
    });

    await _initializeFlutterFire();
    await _initAppData();
    await _initUser();

    setState(() {
      _appIniting = false;
    });
  }

  Future<void> _initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _firebaseIniting = false;
      });
    } catch (e) {
      setState(() {
        _firebaseError = true;
      });
    }
  }

  Future<void> _initUser() async {
    final user = FirebaseAuth.instance.currentUser;
    final pref = await SharedPreferences.getInstance();
    setState(() {
      _hasUser = user != null;
    });
  }

  @override
  void initState() {
    super.initState();
    _initializeApplication();
  }

  @override
  Widget build(BuildContext context) {
    if (_appIniting) {
      return const Scaffold(
          body: Center(
        child: CircularProgressIndicator(),
      ));
    } else {
      if (_hasUser) {
        if (_merchantMode) {
          return const MerchantHomeScreen();
        } else {
          return const CustomerHomeScreen();
        }
      } else {
        if (_merchantMode) {
          return LoginMerchantScreen();
        } else {
          return LoginCustomerScreen();
        }
      }
    }
  }
}
