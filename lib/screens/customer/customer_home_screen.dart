// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:washout/Widgets/general/custom_appbar.dart';
import 'package:washout/configs/colors.dart';
import 'package:washout/configs/sizes.dart';
import 'package:washout/model/merchant.dart';
import 'package:washout/screens/customer/search_merchant.dart';
import 'package:washout/screens/customer/merchant_detail_screen.dart';
import 'package:washout/services/firestore_merchants.dart';
import 'package:washout/services/firestore_queue_tickets.dart';
import 'package:washout/widgets/general/carwash_card.dart';
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

  List<Merchant?> _merchantList = [];
  Merchant? _activeMerchant;

  Future<void> fetchScreenData() async {
    setState(() {
      isLoading = true;
    });

    await getMerchants();
    await getActiveQueue();

    if (_activeMerchant != null) {
      _merchantList
          .removeWhere((element) => element!.uid == _activeMerchant!.uid);
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> getMerchants() async {
    final merchants =
        await FirestoreMerchants().getMerchantsByCurrentCustomer();
    _merchantList = merchants;
  }

  Future<void> getActiveQueue() async {
    final queue = await FirestoreQueueTickets()
        .getQueueTicketByCustomer(FirebaseAuth.instance.currentUser!.uid);
    _activeMerchant = null;
    if (queue != null) {
      final merch =
          await FirestoreMerchants().getMerchantByUID(queue.merchantUID);

      _activeMerchant = merch;
    }
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
      drawer: CustomDrawer(
        accountEmail: "mail@mail.com",
        accountName: "Name Name",
        onSignOut: () {},
      ),
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
              child: Column(
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
                  if (_activeMerchant != null)
                    CarwashCard(
                      id: _activeMerchant!.carwashID,
                      name: _activeMerchant!.name,
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(MerchantDetailScreen.routeName,
                                arguments: _activeMerchant!.uid)
                            .then((value) => fetchScreenData());
                      },
                      showBorder: true,
                      active: true,
                    ),
                  kSizedBoxVerticalS,
                  Expanded(
                    child: ListView.builder(
                      itemCount: _merchantList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: kSizeXS,
                          ),
                          child: CarwashCard(
                            id: _merchantList[index]!.carwashID,
                            name: _merchantList[index]!.name,
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(MerchantDetailScreen.routeName,
                                      arguments: _merchantList[index]!.uid)
                                  .then((value) => fetchScreenData());
                            },
                            showBorder: true,
                          ),
                        );
                      },
                    ),
                  ),
                  CustomButton(
                    onPressed: fetchScreenData,
                    text: "Refresh",
                  ),
                ],
              ),
            ),
    );
  }
}
