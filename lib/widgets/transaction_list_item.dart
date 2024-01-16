import 'package:flutter/material.dart';
import 'package:payme/models/transaction.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionListItem(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(transaction.title),
      subtitle: Text('${transaction.amount} ${transaction.category} | Date: ${transaction.date.toString()}'),
    );
  }
}