// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:washout/Widgets/general/carwash_card.dart';
import 'package:washout/Widgets/general/custom_button.dart';
import 'package:washout/configs/colors.dart';
import 'package:washout/configs/sizes.dart';
import 'package:washout/model/customer.dart';
import 'package:washout/model/merchant.dart';
import 'package:washout/model/queue_ticket.dart';
import 'package:washout/screens/customer/new_queue_screen.dart';

import 'package:washout/screens/general/app_entry.dart';
import 'package:washout/services/firestore_customers.dart';
import 'package:washout/services/firestore_merchants.dart';
import 'package:washout/services/firestore_queue_tickets.dart';
import 'package:washout/widgets/appbars/customer_appbar.dart';
import 'package:washout/widgets/general/custom_appbar.dart';
import 'package:washout/widgets/general/custom_back_button.dart';
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

  bool _argsReceived = false;
  Merchant? _merchant;
  Customer? _customer;
  QueueTicket? _currentTicket;

  Future<void> fetchScreenData(String merchantUID) async {
    setState(() {
      isLoading = true;
    });

    _merchant = await FirestoreMerchants().getMerchantByUID(merchantUID);
    _customer = await FirestoreCustomer()
        .getCustomerByUID(FirebaseAuth.instance.currentUser!.uid);
    _currentTicket =
        await FirestoreQueueTickets().getQueueTicketByCustomer(_customer!.uid!);

    print("Success");
    setState(() {
      _argsReceived = true;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> addMerchantToList(
    BuildContext context,
  ) async {
    setState(() {
      isLoading = true;
    });

    await FirestoreCustomer().addCarwashToList(_merchant!.uid);
    print("added");
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppEntry.routeName, (route) => false);
  }

  Future<void> removeMerchantFromList(BuildContext context) async {
    setState(() {
      isLoading = true;
    });

    await FirestoreCustomer().removeCarwashFromList(_merchant!.uid);

    print("removed");
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppEntry.routeName, (route) => false);
  }

  void toAddQueue(BuildContext context) {
    Navigator.of(context)
        .pushNamed(NewQueueScreen.routeName, arguments: _merchant!.uid)
        .then((value) => fetchScreenData(_merchant!.uid!));
  }

  Future<void> discardTicket() async {
    setState(() {
      isLoading = true;
    });

    await FirestoreQueueTickets()
        .removeQueueTicketByCustomerUID(_customer!.uid!);

    await fetchScreenData(_merchant!.uid!);

    setState(() {
      isLoading = false;
    });
  }

  Widget _buildPreviousCount(
      {required int count, required QueueTicketStatus? status}) {
    if (status == QueueTicketStatus.completed) {
      return Text("Your queue is completed");
    } else if (status == QueueTicketStatus.rejected) {
      return Text("Your queue is rejected");
    } else {
      return Text("$count others(s) before you");
    }
  }

  Widget _buildHeaderCard(QueueTicketStatus? status) {
    return CarwashCard(
      id: _merchant!.carwashID,
      name: _merchant!.name,
      onPressed: () {},
      status: status,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_argsReceived) {
      print("Getting args");
      final merchUID = ModalRoute.of(context)!.settings.arguments as String;
      fetchScreenData(merchUID);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomerAppbar(),
      drawer: CustomDrawer(),
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
                  onPressed: () => Navigator.of(context).pop(),
                  iconColor: kCustomerPrimary,
                ),
                Padding(
                  padding: const EdgeInsets.all(kScreenPadding),
                  child: StreamBuilder<QuerySnapshot>(
                    
                    stream: FirestoreQueueTickets()
                        .getQueueTicketStream(merchantUID: _merchant!.uid!),
                    builder: (ctx, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }

                      final tickets = snapshot.data!.docs
                          .map(
                            (d) => QueueTicket.fromJSON(
                              d.data() as Map<String, dynamic>,
                            ),
                          )
                          .toList();

                      if (_customer!.carwashList.contains(_merchant!.uid)) {
                        if (_currentTicket == null) {
                          final prevCount = tickets
                              .where(
                                  (t) => t.status == QueueTicketStatus.active)
                              .toList()
                              .length;
                          return Column(
                            children: [
                              _buildHeaderCard(null),
                              kSizedBoxVerticalM,
                              _buildPreviousCount(
                                count: prevCount,
                                status: null,
                              ),
                              kSizedBoxVerticalS,
                              CustomButton(
                                onPressed: () => toAddQueue(context),
                                text: "Add to queue",
                              ),
                              kSizedBoxVerticalS,
                              CustomButton(
                                onPressed: () =>
                                    removeMerchantFromList(context),
                                text: "Remove from my list",
                              ),
                            ],
                          );
                        } else if (_currentTicket!.merchantUID ==
                            _merchant!.uid) {
                          final curTicket = tickets.firstWhere(
                            (t) => t.customerUID == _customer!.uid,
                          );

                          final tmp = tickets.where((t) => true).toList();
                          tmp.removeWhere(
                              (t) => t.status != QueueTicketStatus.active);
                          tmp.removeWhere(
                              (t) => t.customerUID == curTicket.customerUID);
                          tmp.removeWhere(
                            (t) => t.createdAt.isAfter(curTicket.createdAt),
                          );

                          return Column(
                            children: [
                              _buildHeaderCard(curTicket.status),
                              kSizedBoxVerticalM,
                              _buildPreviousCount(
                                count: tmp.length,
                                status: curTicket.status,
                              ),
                              kSizedBoxVerticalS,
                              CustomButton(
                                onPressed: discardTicket,
                                text:
                                    curTicket.status == QueueTicketStatus.active
                                        ? "Cancel my queue"
                                        : "Remove this queue",
                              ),
                            ],
                          );
                        } else {
                          return Column(
                            children: [
                              _buildHeaderCard(null),
                              kSizedBoxVerticalM,
                              Text("You already queued another carwash"),
                              kSizedBoxVerticalS,
                              CustomButton(
                                onPressed: () =>
                                    removeMerchantFromList(context),
                                text: "Remove from my list",
                              ),
                            ],
                          );
                        }
                      } else {
                        return Column(
                          children: [
                            _buildHeaderCard(null),
                            kSizedBoxVerticalM,
                            Text("Add this carwash ?"),
                            kSizedBoxVerticalS,
                            CustomButton(
                              onPressed: () => addMerchantToList(context),
                              text: "Add to my list",
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
