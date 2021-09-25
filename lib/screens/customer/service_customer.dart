import 'package:flutter/material.dart';
import 'package:washout/Widgets/general/custom_appbar.dart';
import 'package:washout/Widgets/general/custom_drawer.dart';
import 'package:washout/widgets/general/checkbox_option.dart';
import 'package:washout/widgets/general/custom_back_button.dart';

const _dummy = [
  {
    "name": "Wash",
    "price": 200,
  },
  {
    "name": "Repaint",
    "price": 600,
  },
];



class ServiceCustomer extends StatefulWidget {


  const ServiceCustomer({Key? key}) : super(key: key);
  @override
  _ServiceCustomerState createState() => _ServiceCustomerState();
}

class _ServiceCustomerState extends State<ServiceCustomer> {
  List<Map<String, dynamic>> _data = _dummy;
  final List<int> _selectedOptions = [];

  void _onSelect(int index){
    setState(() {
      if(_selectedOptions.contains(index)){
        _selectedOptions.remove(index);
      }else{
        _selectedOptions.add(index);
      }
    });
  }

  int _calculatePrice(){
    var sum = 0;
    for(int i in _selectedOptions){
      sum += _data[i]["price"] as int;
    }

    return sum;
  }

  Widget _buildOptionList(){
    var items = <Widget>[];
    for(int i = 0; i < _data.length; i++){
      items.add(
        Padding(
          padding: EdgeInsets.all(20),
          child: CheckboxItem(
            checked: _selectedOptions.contains(i),
            onTap: () => _onSelect(i),
            text: _data[i]["name"],
            tailingText: "${_data[i]['price']} THB",
          ),
        ),
      );
    }

    return Column(
      children: items,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        isMerchant: false,
      ),
      drawer: CustomDrawer(
        accountEmail: "mail@mail.com",
        accountName: "Name Name",
        onSignOut: () {},
      ),
      body: Column(
        children: [
          CustomBackButton(
            onPressed: () {},
            text: 'Back',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://i.pinimg.com/474x/f5/0f/ca/f50fcac962f825241f039d2eede27c50.jpg'),
                radius: 50,
              ),
              SizedBox(
                width: 20,
                height: 60,
              ),
              Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 20)),
                  Text(
                    'ABC CARCARE',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'ID: 123456',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Services available"),
                  Expanded(child: _buildOptionList()),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    padding: EdgeInsets.all(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total price:"),
                        Text("${_calculatePrice()} THB")
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {

                        },
                        child: Text(
                          "Confirm",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}