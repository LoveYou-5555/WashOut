import 'package:flutter/material.dart';
import 'package:flutter_login_page_ui/main.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool x =false;
  void changeX(){
    setState(() {
      x=!x;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        // title: Image.asset(
        //   'assets/backbutton.png',width: 35.0, 
        // ),
        leading: BackButton(
          color: Colors.blue,
        ),
      ),
      body: Column(
        children: [
          Expanded(child: Container(), flex: 70),
          Expanded(
            flex: 766,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                  child: Column(children: [
                Text(
                  'Create account',
                  style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
                ),
                Container(height: 20),
                TextField(decoration: InputDecoration(labelText: 'Name'),),
                Container(height: 10),
                TextField(decoration: InputDecoration(labelText: 'LastName'),),
                Container(height: 10),
                TextField(decoration: InputDecoration(labelText: 'Email'),),
                Container(height: 10),
                TextField(obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),),
                Container(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(value: x, onChanged: (newValue){
                      setState(() {
                        x=newValue ;
                      });
                    }),
                    Text('I agree with our', style: TextStyle(color: Colors.grey),),
                    TextButton(
                      onPressed: () {},
                      child: Text("Terms"),
                    ),
                    Text('and',style: TextStyle(color: Colors.grey),),
                    TextButton(
                      onPressed: () {},
                      child: Text("Conditions"),
                    ),
                  ],
                ),
                Container(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (Context){
                      return MyApp();
                    },),);
                  },
                   child: Padding(
                     padding: const EdgeInsets.symmetric(
                       horizontal: 80.0, vertical: 15.0),
                     child: Text('Create account'),
                   ),),
                ),
                Container(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?',style: TextStyle(color: Colors.grey),),
                    TextButton(onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (Context){
                      return MyApp();
                    },),);
                    }, child: Text('Sign in'))
                  ],
                )
              ])),
            ),
          ),
        ],
      ),
    );
  }
}
