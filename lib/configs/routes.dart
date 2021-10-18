import 'package:washout/screens/customer/add_carwash_id_screen.dart';
import 'package:washout/screens/customer/add_carwash_to_list_screen.dart';
import 'package:washout/screens/customer/add_other_car_screen.dart';
import 'package:washout/screens/customer/choose_car_screen.dart';
import 'package:washout/screens/customer/home_screen.dart';
import 'package:washout/screens/customer/queue_screen.dart';
import 'package:washout/screens/customer/service_customer.dart';
import 'package:washout/screens/customer/summary_pre_screen.dart';
import 'package:washout/screens/customer/summary_screen.dart';
import 'package:washout/screens/general/app_entry.dart';
import 'package:washout/screens/register_merchant_screen.dart';

final routes = {
  AppEntry.routeName: (ctx) => const AppEntry(),
  // RegisterScreen.routeName: (ctx) => const RegisterScreen(),
  RegisterMerchantScreen.routeName: (ctx) => const RegisterMerchantScreen(),
  HomeScreen.routeName: (ctx) => const HomeScreen(),
  AddCarwashIdScreen.routeName: (ctx) => const AddCarwashIdScreen(),
  AddCarwashToListScreen.routeName: (ctx) => const AddCarwashToListScreen(),
  QueueScreen.routeName: (ctx) => const QueueScreen(),
  ServiceCustomerScreen.routeName: (ctx) => const ServiceCustomerScreen(),
  ChooseCarScreen.routeName: (ctx) => const ChooseCarScreen(),
  AddOtherCarScreen.routeName: (ctx) => const AddOtherCarScreen(),
  SummaryPreScreen.routeName: (ctx) => const SummaryPreScreen(),
  SummaryScreen.routeName: (ctx) => const SummaryScreen(),
};