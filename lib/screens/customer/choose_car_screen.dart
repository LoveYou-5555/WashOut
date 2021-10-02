import 'package:flutter/material.dart';
import 'package:washout/Widgets/general/custom_appbar.dart';
import 'package:washout/Widgets/general/custom_drawer.dart';
import 'package:washout/screens/customer/add_other_car_screen.dart';
import 'package:washout/screens/customer/summary_pre_screen.dart';
import 'package:washout/widgets/general/carwash_card.dart';
import 'package:washout/widgets/general/checkbox_option.dart';
import 'package:washout/widgets/general/custom_back_button.dart';
import 'package:washout/widgets/general/custom_button.dart';

const _dummy = [
  {
    "brand": "Toyata",
    "model": "Altis",
    "plate": "กง 5222",
  },
  {
    "brand": "Audi",
    "model": "R8",
    "plate": "ออ 5555",
  },
];

class ChooseCarScreen extends StatefulWidget {
  static const routeName = "/chooseCar";
  const ChooseCarScreen({Key? key}) : super(key: key);

  @override
  State<ChooseCarScreen> createState() => _ChooseCarScreenState();
}

class _ChooseCarScreenState extends State<ChooseCarScreen> {
  int _selectedIndex = -1;
  List<Map<String, dynamic>> _cars = _dummy;

  void _onSelect(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
        accountName: "Bob Somchai",
        onSignOut: () {},
        imageURL:
            "https://i.insider.com/5cdedc95021b4c12a50f46f6?width=1136&format=jpeg",
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Column(
          children: [
            CustomBackButton(
              text: "Back",
              onPressed: () {},
            ),
            CarwashCard(
              id: "123456",
              imageUrl:
                  "https://i.pinimg.com/474x/f5/0f/ca/f50fcac962f825241f039d2eede27c50.jpg",
              name: "Bob Lame",
              onPressed: () {},
              showBorder: false,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _cars.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                    ),
                    child: CheckboxItem(
                      checked: index == _selectedIndex,
                      onTap: () => _onSelect(index),
                      text:
                          "${_cars[index]['brand']} ${_cars[index]['model']} ${_cars[index]['plate']}",
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AddOtherCarScreen.routeName);
                    },
                    text: "Another car",
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(SummaryPreScreen.routeName);
                    },
                    text: "Confirm",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }
}
