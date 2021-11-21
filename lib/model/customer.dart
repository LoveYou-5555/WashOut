import 'package:washout/model/user_account.dart';

class Customer extends UserAccount {
  final String firstName;
  final String lastName;
  final String phone;
  final List<String> carwashList;

  Customer({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.carwashList,
    required String? email,
    required String? uid,
  }) : super(email: email, uid: uid);
}
