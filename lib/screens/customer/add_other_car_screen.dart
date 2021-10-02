import 'package:flutter/material.dart';
import 'package:washout/Widgets/general/custom_appbar.dart';
import 'package:washout/Widgets/general/custom_drawer.dart';
import 'package:washout/screens/customer/summary_pre_screen.dart';
import 'package:washout/widgets/general/custom_back_button.dart';
import 'package:washout/widgets/general/custom_button.dart';
import 'package:washout/widgets/general/custom_dropdown.dart';
import 'package:washout/widgets/general/custom_text_field.dart';

class AddOtherCarScreen extends StatefulWidget {
  static const routeName = "/addOtherCar";
  const AddOtherCarScreen({Key? key}) : super(key: key);

  @override
  State<AddOtherCarScreen> createState() => _AddOtherCarScreenState();
}

class _AddOtherCarScreenState extends State<AddOtherCarScreen> {
  final List<String> _brandItems = [
    "Please select",
    "Toyota",
    "Audi",
  ];

  final List<String> _colorItems = [
    "Please select",
    "Black",
    "White",
  ];

  var _selectedBrand = "Please select";
  var _selectedColor = "Please select";

  void _onSelectBrand(String? brand) {
    //
    setState(() {
      _selectedBrand = brand ?? "Please select";
    });
  }

  void _onSelectColor(String? color) {
    setState(() {
      _selectedColor = color ?? "Please select";
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomBackButton(
              text: "Back",
              onPressed: () {},
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Vehicle Information",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Brand",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomDropdown(
                    selectedItem: _selectedBrand,
                    items: _brandItems,
                    onChanged: _onSelectBrand,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Model",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Color",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomDropdown(
                      selectedItem: _selectedColor,
                      items: _colorItems,
                      onChanged: _onSelectColor),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "License Plate",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(SummaryPreScreen.routeName);
                            },
                            text: "Confirm",
                            color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
