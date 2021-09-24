// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:washout/widgets/general/app_logo.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final bool isMerchant;

  const CustomAppBar({Key? key, this.isMerchant = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.blue),
      actions: [
        SizedBox(
          height: 51.0,
          width: 125.0,
          child: AppLogo(
            isMerchant: isMerchant,
          ),
        ),
      ],
      backgroundColor: Colors.grey[200],
      shadowColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);



}
