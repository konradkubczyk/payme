import 'package:flutter/foundation.dart';

class Transaction {
  String id;  
  String title;
  double amount;
  DateTime date;
  Category category;
  String? description;
  String contrahentId;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    this.description,
    required this.contrahentId
  });
}
