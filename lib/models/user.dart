import 'package:payme/models/account.dart';
import 'package:payme/models/person.dart';

class User extends Person {
  List<Account> accounts;

  User({
    required super.id,
    required super.name,
    required super.email,
    super.phoneNumber,
    super.bankAccountNumber,
    required this.accounts,
  });
}
