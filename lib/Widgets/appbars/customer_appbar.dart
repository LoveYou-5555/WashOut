import 'package:flutter/material.dart';
import 'package:washout/configs/colors.dart';
import 'package:washout/widgets/general/custom_appbar.dart';

class CustomerAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomerAppbar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomAppBar(
      iconColor: kCustomerPrimary,
      isMerchant: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}