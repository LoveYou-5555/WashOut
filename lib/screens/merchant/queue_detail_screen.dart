// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:washout/configs/colors.dart';
import 'package:washout/configs/sizes.dart';
import 'package:washout/model/customer.dart';
import 'package:washout/model/queue_ticket.dart';
import 'package:washout/services/firestore_customers.dart';
import 'package:washout/services/firestore_queue_tickets.dart';
import 'package:washout/widgets/appbars/merchant_appbar.dart';
import 'package:washout/widgets/general/custom_back_button.dart';
import 'package:washout/widgets/general/custom_button.dart';
import 'package:washout/widgets/general/custom_drawer.dart';
import 'package:washout/widgets/general/queue_ticket_card.dart';

class QueueDetailScreen extends StatefulWidget {
  static const routeName = "/merchantQueueDetail";

  const QueueDetailScreen({Key? key}) : super(key: key);

  @override
  State<QueueDetailScreen> createState() => _QueueDetailScreenState();
}

class _QueueDetailScreenState extends State<QueueDetailScreen> {
  QueueTicket? ticket;
  Customer? customer;
  bool isManualTicket = false;

  bool _argsReceived = false;

  Future<void> fetchTicketData(String licensePlate) async {
    final t = await FirestoreQueueTickets()
        .getQueueTicketByLicensePlate(licensePlate);

    print("Load");
    ticket = t;

    isManualTicket = ticket!.customerUID == null;
    if (!isManualTicket) {
      customer =
          await FirestoreCustomer().getCustomerByUID(ticket!.customerUID!);
    }

    setState(() {
      _argsReceived = true;
    });
  }

  Future<void> completeTicket(BuildContext context) async {
    print(ticket!.licensePlate);
    await FirestoreQueueTickets()
        .removeQueueTicketByLicensePlate(ticket!.licensePlate);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    if (!_argsReceived) {
      final licensePlate = ModalRoute.of(context)!.settings.arguments as String;
      fetchTicketData(licensePlate);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MerchantAppBar(),
      drawer: CustomDrawer(
        accountEmail: "mail@mail.com",
        accountName: "Bob Boc",
        onSignOut: () {},
      ),
      body: ticket == null
          ? Center(
              child: CircularProgressIndicator(
                color: kMerchantPrimary,
              ),
            )
          : Column(
              children: [
                CustomBackButton(
                  iconColor: kMerchantPrimary,
                  text: "Back",
                  onPressed: () {},
                ),
                Padding(
                  padding: const EdgeInsets.all(kScreenPadding),
                  child: Column(
                    children: [
                      QueueTicketCard(
                        createdAt: ticket!.createdAt,
                        licensePlate: ticket!.licensePlate,
                        isOverdue: ticket!.createdAt.isBefore(DateTime.now()),
                        onPressed: () {},
                      ),
                      kSizedBoxVerticalM,
                      isManualTicket
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "This ticket is issued by you",
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Ticket owner",
                                    ),
                                    Text(
                                      customer == null
                                          ? "Non-app customer"
                                          : "${customer!.firstName} ${customer!.lastName}",
                                    )
                                  ],
                                ),
                                kSizedBoxVerticalS,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Customer's phone",
                                    ),
                                    Text(
                                      customer!.phone,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                      kSizedBoxVerticalM,
                      CustomButton(
                        color: kMerchantPrimary,
                        onPressed: () => completeTicket(context),
                        text: "Complete this ticket",
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
