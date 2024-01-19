import 'package:payme/models/transaction.dart';
import 'package:payme/models/databaseProvider.dart';
import 'package:flutter/material.dart';
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