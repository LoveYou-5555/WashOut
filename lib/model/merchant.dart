import 'package:washout/model/user_account.dart';

class Merchant extends UserAccount {
  String name;
  String carwashID;

  Merchant({
    required this.name,
    required this.carwashID,
    required String? email,
    required String? uid,
  }) : super(email: email, uid: uid);
}