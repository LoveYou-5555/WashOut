// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:washout/Widgets/general/carwash_card.dart';
import 'package:washout/Widgets/general/custom_appbar.dart';
import 'package:washout/configs/colors.dart';
import 'package:washout/configs/sizes.dart';
import 'package:washout/model/merchant.dart';
import 'package:washout/model/queue_ticket.dart';
import 'package:washout/screens/customer/search_merchant.dart';
import 'package:washout/screens/customer/merchant_detail_screen.dart';
import 'package:washout/services/firestore_merchants.dart';
import 'package:washout/services/firestore_queue_tickets.dart';
import 'package:washout/widgets/general/custom_button.dart';
import 'package:washout/widgets/general/custom_drawer.dart';
import 'package:washout/widgets/general/text_button_with_icon.dart';

class CustomerHomeScreen extends StatefulWidget {
  static const routeName = "/customerHomeScreen";

  const CustomerHomeScreen({Key? key}) : super(key: key);

  @override
  _CustomerHomeScreenState createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  bool isLoading = true;

  List<Merchant?> _baseMerchantList = [];

  Future<void> fetchScreenData() async {
    setState(() {
      isLoading = true;
    });
    _baseMerchantList =
        await FirestoreMerchants().getMerchantsByCurrentCustomer();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchScreenData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        isMerchant: false,
      ),
      drawer: CustomDrawer(),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: kCustomerPrimary,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(
                kSizeM,
              ),
              child: StreamBuilder<QuerySnapshot>(
                stream: FirestoreQueueTickets().getQueueTicketStreamByCustomer(
                  customerUID: FirebaseAuth.instance.currentUser!.uid,
                ),
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  final tickets = snapshot.data!.docs
                      .map(
                        (d) => QueueTicket.fromJSON(
                          d.data() as Map<String, dynamic>,
                        ),
                      )
                      .toList();

                  final tmpMerchantList =
                      _baseMerchantList.where((element) => true).toList();

                  QueueTicket? currentTicket;
                  if (tickets.isNotEmpty) {
                    currentTicket = tickets[0];
                  }

                  Merchant? currentMerchant;

                  if (currentTicket != null) {
                    currentMerchant = tmpMerchantList
                        .where(
                          (m) => m!.uid == currentTicket!.merchantUID,
                        )
                        .toList()[0];

                    tmpMerchantList.removeWhere(
                      (m) => m!.uid == currentMerchant!.uid,
                    );
                  }

                  return Column(
                    children: [
                      TextButtonWithIcon(
                        icon: Icon(
                          Icons.add_circle_outline,
                          color: AppColor.customerPrimary,
                          size: kSizeM + kSizeS,
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(SearchMerchantScreen.routeName)
                              .then((value) => fetchScreenData());
                        },
                        text: "Add carwash",
                      ),
                      kSizedBoxVerticalS,
                      if (currentTicket != null)
                        CarwashCard(
                          id: currentMerchant!.carwashID,
                          name: currentMerchant.name,
                          status: currentTicket.status,
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(
                                  MerchantDetailScreen.routeName,
                                  arguments: currentMerchant!.uid,
                                )
                                .then((value) => fetchScreenData());
                          },
                          showBorder: true,
                        ),
                      kSizedBoxVerticalS,
                      Expanded(
                        child: ListView.builder(
                          itemCount: tmpMerchantList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: kSizeXS,
                              ),
                              child: CarwashCard(
                                id: tmpMerchantList[index]!.carwashID,
                                name: tmpMerchantList[index]!.name,
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(MerchantDetailScreen.routeName,
                                          arguments:
                                              tmpMerchantList[index]!.uid)
                                      .then((value) => fetchScreenData());
                                },
                                showBorder: true,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
    );
  }
}
