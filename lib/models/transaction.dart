import 'package:flutter/foundation.dart';

class Transaction { 
  int id;
  String title;
  double amount;
  DateTime date;
  Category? category;
  String? description;
  String contrahentId;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    this.category,
    this.description,
    required this.contrahentId
  });
}
