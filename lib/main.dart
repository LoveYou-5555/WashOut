// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:washout/screens/general/app_entry.dart';
import 'package:washout/configs/routes.dart';

void main() => runApp(
      MaterialApp(
        
        initialRoute: AppEntry.routeName,
        debugShowCheckedModeBanner: false,
        routes: routes,
      ),
    );
