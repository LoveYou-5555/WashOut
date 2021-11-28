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

  factory Merchant.fromJSON(Map<String, dynamic> data) {
    return Merchant(
        name: data["name"],
        carwashID: data["carwashID"],
        email: data["email"],
        uid: data["uid"]);
  }
}
