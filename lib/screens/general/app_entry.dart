import 'package:flutter/material.dart';
import 'package:washout/screens/customer/login_customer_screen.dart';
import 'package:washout/screens/merchant/login_merchant_screen.dart';

class AppEntry extends StatefulWidget {
  static const routeName = "/appEntry";

  const AppEntry({Key? key}) : super(key: key);

  @override
  _AppEntryState createState() => _AppEntryState();
}

class _AppEntryState extends State<AppEntry> {
  bool _isMerchant = false;

  void _switchMode() {
    setState(() {
      _isMerchant = !_isMerchant;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isMerchant
        ? LoginMerchantScreen(
            onModeSwitch: _switchMode,
          )
        : LoginCustomerScreen(
            onModeSwitch: _switchMode,
          );
  }
}