import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:washout/services/firestore_queue_tickets.dart';
import 'package:washout/widgets/general/custom_appbar.dart';
import 'package:washout/widgets/general/custom_back_button.dart';
import 'package:washout/widgets/general/custom_button.dart';
import 'package:washout/widgets/general/custom_drawer.dart';

class NewQueueScreen extends StatefulWidget {
  const NewQueueScreen({Key? key}) : super(key: key);

  static const routeName = "/newCustomerQueue";

  @override
  State<NewQueueScreen> createState() => _NewQueueScreenState();
}

class _NewQueueScreenState extends State<NewQueueScreen> {
  final _licensePlate = TextEditingController();

  String? merchUID;

  Future<void> sendTicket() async {
    if (_licensePlate.text.isNotEmpty) {
      final queue = await FirestoreQueueTickets()
          .getQueueTicketByLicensePlate(_licensePlate.text);

      if (queue != null) {
        print("Cant create: dup plate");
      } else {
        await FirestoreQueueTickets().createQueueTicket(
          FirebaseAuth.instance.currentUser!.uid,
          merchUID!,
          _licensePlate.text,
        );

        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    merchUID = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        isMerchant: false,
      ),
      drawer: CustomDrawer(),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          CustomBackButton(
            text: "Back",
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Container(
            height: 50,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("New ticket",
                          style: TextStyle(
                              fontSize: 35.0, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Container(height: 35),
                  TextField(
                    controller: _licensePlate,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Your license plate',
                    ),
                  ),
                  Container(height: 30),
                  CustomButton(
                    onPressed: sendTicket,
                    text: "Confirm",
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
