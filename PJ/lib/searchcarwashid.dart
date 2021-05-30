import 'package:flutter/material.dart';
import 'package:flutter_login_page_ui/addcarwash.dart';
import 'package:flutter_login_page_ui/homepage.dart';

class SearchCarwashIdPage extends StatefulWidget {
  @override
  _SearchCarwashIdPageState createState() => _SearchCarwashIdPageState();
}

class _SearchCarwashIdPageState extends State<SearchCarwashIdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: new AppBar(
         iconTheme: IconThemeData(
    color: Colors.blue
  ),
        actions: [
          Image.asset(
            "assets/logo_1.png",
            height: 51.0,
            width: 125.0,
          ),
        ],
        toolbarHeight: 90,
        backgroundColor: Colors.grey[200],
        shadowColor: Colors.white,
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
          new UserAccountsDrawerHeader(accountName: new Text('AAA'), accountEmail: new Text('haha@gmail.com'),currentAccountPicture: new CircleAvatar(
            backgroundImage: new NetworkImage('url'),
          ),)
        ],),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomePage();
              }));
            },
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios),
                Text(
                  'ย้อนกลับ',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            height: 50,
          ),
          Expanded(
            flex: 771,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Car Wash ID',
                            style: TextStyle(
                                fontSize: 35.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Container(height: 35),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Insert car wash id',
                      ),
                    ),
                    Container(height: 30),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return AddCarwashIdPage();
                          }));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 15.0),
                          child: Text('Search'),
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
