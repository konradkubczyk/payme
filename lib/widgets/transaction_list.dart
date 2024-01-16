import 'package:flutter/material.dart';
import 'package:payme/models/transaction.dart';
import 'package:payme/widgets/transaction_list_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        return TransactionListItem(transactions[index]);
      },
    );
  }
}
