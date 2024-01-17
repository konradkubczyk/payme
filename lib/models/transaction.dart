import 'package:flutter/foundation.dart';

class Transaction {
  int id;
  String title;
  double amount;
  DateTime date;
  Category? category;
  String? description;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    this.category,
    this.description,
  });
}
