import 'package:flutter/material.dart';
import 'package:washout/configs/colors.dart';
import 'package:washout/widgets/general/custom_appbar.dart';

class MerchantAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MerchantAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomAppBar(
      iconColor: kMerchantPrimary,
      isMerchant: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
