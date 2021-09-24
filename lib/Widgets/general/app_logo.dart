import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final bool isMerchant;

  const AppLogo({Key? key, this.isMerchant = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      isMerchant
          ? "assets/images/logo_merchant.png"
          : "assets/images/logo_customer.png",
    );
  }
}
