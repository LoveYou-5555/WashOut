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
