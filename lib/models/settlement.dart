import 'package:payme/models/friend.dart';
import 'package:payme/models/product.dart';
import 'package:payme/models/transaction.dart';

class Settlement {
  int id;
  String name;
  List<Friend>? friends;
  List<Transaction>? transactions;
  List<Product>? products;
  DateTime date;

  Settlement({
    required this.id,
    required this.name,
    this.friends,
    this.transactions,
    this.products,
    required this.date,
  });
}
