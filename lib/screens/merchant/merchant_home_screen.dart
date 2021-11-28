// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:washout/Widgets/general/custom_drawer.dart';
import 'package:washout/configs/colors.dart';
import 'package:washout/configs/sizes.dart';
import 'package:washout/model/merchant.dart';
import 'package:washout/model/queue_ticket.dart';
import 'package:washout/screens/merchant/manual_ticket_screen.dart';
import 'package:washout/screens/merchant/queue_detail_screen.dart';
import 'package:washout/services/firestore_merchants.dart';
import 'package:washout/services/firestore_queue_tickets.dart';
import 'package:washout/widgets/appbars/merchant_appbar.dart';
import 'package:washout/widgets/general/custom_button.dart';
import 'package:washout/widgets/general/queue_ticket_card.dart';

class MerchantHomeScreen extends StatefulWidget {
  static const routeName = "/merchantHome";

  const MerchantHomeScreen({Key? key}) : super(key: key);

  @override
  _MerchantHomeScreenState createState() => _MerchantHomeScreenState();
}

class _MerchantHomeScreenState extends State<MerchantHomeScreen> {
  Merchant? profile;
  List<QueueTicket?> tickets = [];
  bool loadingProfile = true;

  Future<void> fetchScreenData() async {
    setState(() {
      loadingProfile = true;
    });

    final data = await FirestoreMerchants()
        .getMerchantByUID(FirebaseAuth.instance.currentUser!.uid);

    profile = data;

    setState(() {
      loadingProfile = false;
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
      backgroundColor: Color(0xFFEFEAEA),
      appBar: MerchantAppBar(),
      drawer: CustomDrawer(
        primaryColor: kMerchantPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(kScreenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              loadingProfile ? "Loading" : profile!.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kMerchantPrimary,
                fontSize: kSizeS,
              ),
            ),
            Text(
              loadingProfile ? "Loading" : "ID: ${profile!.carwashID}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            kSizedBoxVerticalS,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your queue",
                        style: TextStyle(
                          color: kMerchantPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(ManualTicketScreen.routeName);
                        },
                        text: "Add new ticket",
                        color: kMerchantPrimary,
                      ),
                    ],
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirestoreQueueTickets().getQueueTicketStream(
                      merchantUID: FirebaseAuth.instance.currentUser!.uid,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }

                      var tickets = snapshot.data!.docs
                          .map(
                            (q) => QueueTicket.fromJSON(
                              q.data() as Map<String, dynamic>,
                            ),
                          )
                          .toList();

                      tickets = tickets
                          .where(
                            (t) => t.status == QueueTicketStatus.active,
                          )
                          .toList();

                      tickets.sort(
                        (a, b) =>
                            a.createdAt.millisecondsSinceEpoch -
                            b.createdAt.millisecondsSinceEpoch,
                      );

                      return Expanded(
                        child: tickets.isEmpty
                            ? Center(
                                child: Text("No new ticket"),
                              )
                            : ListView.builder(
                                padding: const EdgeInsets.symmetric(
                                    vertical: kSizeS),
                                itemCount: tickets.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: kSizeXS),
                                  child: QueueTicketCard(
                                    createdAt: tickets[index].createdAt,
                                    licensePlate: tickets[index].licensePlate,
                                    isOverdue: index == 0,
                                    onPressed: () {
                                      Navigator.of(context).pushNamed(
                                        QueueDetailScreen.routeName,
                                        arguments: tickets[index].licensePlate,
                                      );
                                    },
                                  ),
                                ),
                              ),
                      );
                    },
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
