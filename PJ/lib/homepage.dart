import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(child: Container(color:Colors.grey),flex:125),
          Expanded(flex: 771,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Container(
              child: Column(children: [
                Image(
                  image: AssetImage("assets/addcarwash.png"),
                  ),
            ],),),
          ),
          )
        ],
      ),

    );
  }
}