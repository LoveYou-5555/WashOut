// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:washout/configs/colors.dart';
import 'package:washout/configs/sizes.dart';
import 'package:washout/model/merchant.dart';
import 'package:washout/screens/customer/new_queue_screen.dart';
import 'package:washout/screens/customer/service_customer.dart';
import 'package:washout/screens/general/app_entry.dart';
import 'package:washout/services/firestore_customers.dart';
import 'package:washout/services/firestore_merchants.dart';
import 'package:washout/services/firestore_queue_tickets.dart';
import 'package:washout/widgets/appbars/customer_appbar.dart';
import 'package:washout/widgets/general/carwash_card.dart';
import 'package:washout/widgets/general/custom_appbar.dart';
import 'package:washout/widgets/general/custom_back_button.dart';
import 'package:washout/widgets/general/custom_button.dart';
import 'package:washout/widgets/general/custom_drawer.dart';
import 'package:washout/widgets/general/queue_status_ticket.dart';

class MerchantDetailScreen extends StatefulWidget {
  static const routeName = "/merchantDetail";
  const MerchantDetailScreen({Key? key}) : super(key: key);

  @override
  State<MerchantDetailScreen> createState() => _MerchantDetailScreenState();
}

class _MerchantDetailScreenState extends State<MerchantDetailScreen> {
  bool isLoading = true;

  Merchant? _merchant;
  bool isActive = false;
  bool isInList = false;

  bool queueBlocked = false;

  int prevQueueCount = 0;
  bool _argsReceived = false;

  Future<void> fetchMerchantData(String merchUID) async {
    setState(() {
      isLoading = true;
    });

    final merch = await FirestoreMerchants().getMerchantByUID(merchUID);

    final queue = await FirestoreQueueTickets().getQueueTicketByCustomer(
      FirebaseAuth.instance.currentUser!.uid,
    );

    final queues =
        await FirestoreQueueTickets().getQueueTicketListByMerchant(merchUID);

    print(queues.length);

    if (queue != null) {
      print("remove after");
      queues.removeWhere(
        (element) => element!.customerUID == queue.customerUID,
      );
      queues.removeWhere(
        (element) => element!.createdAt.isAfter(queue.createdAt),
      );
    }

    print(queues.length);

    final customer = await FirestoreCustomer()
        .getCustomerByUID(FirebaseAuth.instance.currentUser!.uid);

    setState(() {
      _argsReceived = true;
      _merchant = merch;
      isInList = customer!.carwashList.contains(merchUID);
      if (queue == null) {
        queueBlocked = false;
        isActive = false;
      } else {
        isActive = queue.merchantUID == merchUID;
        queueBlocked = queue.merchantUID != merchUID;
      }

      prevQueueCount = queues.length;
    });

    setState(() {
      isLoading = false;
    });
  }

  Future<void> addToList(BuildContext context) async {
    await FirestoreCustomer().addCarwashToList(_merchant!.uid);
    Navigator.of(context).popUntil(ModalRoute.withName(AppEntry.routeName));
  }

  Future<void> cancelQueue(BuildContext context) async {
    await FirestoreQueueTickets()
        .removeQueueTicketByCustomerUID(FirebaseAuth.instance.currentUser!.uid);
    await fetchMerchantData(_merchant!.uid!);
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _buildMainControls(BuildContext context) {
    if (!isInList) {
      return Column(
        children: [
          CustomButton(
            onPressed: () => addToList(context),
            text: "Add to my list",
          ),
        ],
      );
    } else {
      if (isActive) {
        return Column(
          children: [
            Text("$prevQueueCount Queue(s) before you"),
            kSizedBoxVerticalS,
            CustomButton(
              onPressed: () => cancelQueue(context),
              text: "Cancel my queue",
            ),
          ],
        );
      } else {
        if (queueBlocked) {
          return Column(
            children: [
              Text("$prevQueueCount Queue(s) before you"),
              kSizedBoxVerticalS,
              Text("You already queued another carwash"),
            ],
          );
        } else {
          return Column(
            children: [
              Text("$prevQueueCount Queue(s) before you"),
              kSizedBoxVerticalS,
              CustomButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(NewQueueScreen.routeName,
                          arguments: _merchant!.uid)
                      .then((value) => fetchMerchantData(_merchant!.uid!));
                },
                text: "Queue this carwash",
              ),
            ],
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_argsReceived) {
      final merchUID = ModalRoute.of(context)!.settings.arguments as String;
      fetchMerchantData(merchUID);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomerAppbar(),
      drawer: CustomDrawer(
        accountEmail: "mail@mail.com",
        accountName: "Bob Boc",
        onSignOut: () {},
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: kCustomerPrimary,
              ),
            )
          : Column(
              children: [
                CustomBackButton(
                  text: "Back",
                  onPressed: () {},
                  iconColor: kCustomerPrimary,
                ),
                Padding(
                  padding: const EdgeInsets.all(kScreenPadding),
                  child: Column(
                    children: [
                      CarwashCard(
                        id: _merchant!.carwashID,
                        name: _merchant!.name,
                        onPressed: () {},
                        showBorder: true,
                        active: isActive,
                      ),
                      kSizedBoxVerticalM,
                      _buildMainControls(context),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
