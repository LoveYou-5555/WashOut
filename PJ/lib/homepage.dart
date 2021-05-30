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
      appBar: AppBar(
        automaticallyImplyLeading: true,
<<<<<<< Updated upstream
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.format_list_bulleted_outlined),color: Colors.blue,),
        actions: [Image.asset("assets/logo_1.png",
            height: 51.0,
            width: 125.0,
        ),],
        toolbarHeight: 90,
        backgroundColor: Colors.grey[200],
        shadowColor: Colors.white,

=======
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.format_list_bulleted_outlined),
          color: Colors.blue,
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
>>>>>>> Stashed changes
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
<<<<<<< Updated upstream
          Container(height: 50,),
=======
          Container(
            height: 50,
          ),
>>>>>>> Stashed changes
          Expanded(
            flex: 771,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
<<<<<<< Updated upstream
                          Icon(Icons.add_circle_outline,size: 35),
                          Text('Add car wash',style: TextStyle(fontSize: 25),),
=======
                          Icon(Icons.add_circle_outline, size: 35),
                          Text(
                            'Add car wash',
                            style: TextStyle(fontSize: 25),
                          ),
>>>>>>> Stashed changes
                        ],
                      ),
                    )
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
