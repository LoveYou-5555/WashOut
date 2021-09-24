import 'package:flutter/material.dart';
import 'package:washout/widgets/general/app_logo.dart';

class LoginScreenLogo extends StatelessWidget {
  final bool isMerchant;

  const LoginScreenLogo({Key? key, this.isMerchant = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60.0),
      child: Center(
        child: AppLogo(
          isMerchant: isMerchant,
        ),
      ),
    );
  }
}
