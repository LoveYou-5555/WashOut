import 'package:washout/screens/customer/new_queue_screen.dart';
import 'package:washout/screens/customer/register_customer_screen.dart';
import 'package:washout/screens/customer/search_merchant.dart';
import 'package:washout/screens/customer/add_carwash_to_list_screen.dart';
import 'package:washout/screens/customer/add_other_car_screen.dart';
import 'package:washout/screens/customer/choose_car_screen.dart';
import 'package:washout/screens/customer/customer_home_screen.dart';
import 'package:washout/screens/customer/merchant_detail_screen.dart';
import 'package:washout/screens/customer/service_customer.dart';
import 'package:washout/screens/customer/summary_pre_screen.dart';
import 'package:washout/screens/customer/summary_screen.dart';
import 'package:washout/screens/general/app_entry.dart';
import 'package:washout/screens/merchant/manual_ticket_screen.dart';
import 'package:washout/screens/merchant/merchant_home_screen.dart';
import 'package:washout/screens/merchant/queue_detail_screen.dart';
import 'package:washout/screens/merchant/register_merchant_screen.dart';

final routes = {
  AppEntry.routeName: (ctx) => const AppEntry(),
  RegisterCustomerScreen.routeName: (ctx) => const RegisterCustomerScreen(),
  RegisterMerchantScreen.routeName: (ctx) => const RegisterMerchantScreen(),
  CustomerHomeScreen.routeName: (ctx) => const CustomerHomeScreen(),
  MerchantHomeScreen.routeName: (ctx) => const MerchantHomeScreen(),
  NewQueueScreen.routeName: (ctx) => const NewQueueScreen(),
  ManualTicketScreen.routeName: (ctx) => ManualTicketScreen(),
  QueueDetailScreen.routeName: (ctx) => const QueueDetailScreen(),
  SearchMerchantScreen.routeName: (ctx) => const SearchMerchantScreen(),
  AddCarwashToListScreen.routeName: (ctx) => const AddCarwashToListScreen(),
  MerchantDetailScreen.routeName: (ctx) => const MerchantDetailScreen(),
  ServiceCustomerScreen.routeName: (ctx) => const ServiceCustomerScreen(),
  ChooseCarScreen.routeName: (ctx) => const ChooseCarScreen(),
  AddOtherCarScreen.routeName: (ctx) => const AddOtherCarScreen(),
  SummaryPreScreen.routeName: (ctx) => const SummaryPreScreen(),
  SummaryScreen.routeName: (ctx) => const SummaryScreen(),
};
