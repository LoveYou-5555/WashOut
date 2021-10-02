// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:washout/screens/general/app_entry.dart';
import 'package:washout/configs/routes.dart';
import 'package:washout/screens/merchant/manage_queue_screen.dart';
import 'package:washout/screens/merchant/merchant_home_screen.dart';
import 'package:washout/screens/customer/register_screen.dart';
import 'package:washout/screens/merchant/add_service_merchant_screen.dart';
import 'package:washout/screens/merchant/merchant_home_screen.dart';
import 'package:washout/screens/merchant/service_merchant_screen.dart';
import 'package:washout/screens/search_carwash_screen.dart';

void main() => runApp(
      MaterialApp(
        
        initialRoute: AppEntry.routeName,
        debugShowCheckedModeBanner: false,
        routes: routes,
      ),
    );
