import 'package:payme/models/transaction.dart';

class Account {
  int id;
  String name;
  String? type;
  List<Transaction> transactions;

  Account({
    required this.id,
    required this.name,
    this.type,
    required this.transactions,
  });
}
