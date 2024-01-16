import 'package:payme/models/person.dart';

class Friend extends Person {
  Friend({
    required super.id,
    required super.name,
    required super.email,
    super.phoneNumber,
    super.bankAccountNumber,
  });
}
