import 'package:washout/add/add_carwash_screen.dart';
import 'package:washout/screens/customer/home_screen.dart';
import 'package:washout/screens/general/app_entry.dart';
import 'package:washout/screens/register_merchant_screen.dart';
import 'package:washout/screens/register_screen.dart';

final routes = {
  AppEntry.routeName: (ctx) => const AppEntry(),
  RegisterScreen.routeName: (ctx) => const RegisterScreen(),
  RegisterMerchantScreen.routeName: (ctx) => const RegisterMerchantScreen(),
  HomeScreen.routeName: (ctx) => const HomeScreen(),
  AddCarwashScreen.routeName: (ctx) => const AddCarwashScreen(),
};