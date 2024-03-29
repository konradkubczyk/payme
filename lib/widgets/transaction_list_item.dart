import 'package:flutter/material.dart';
import 'package:payme/models/transaction.dart';
import 'package:payme/screens/edit_transaction_screen.dart';

class TransactionListItem extends StatefulWidget {
  final Transaction transaction;
  final Function(Transaction)
      updateTransaction; // Callback function for deleting the transaction
  final Function(Transaction)
      deleteTransaction; // Callback function for deleting the transaction

  const TransactionListItem(
      {required this.transaction,
      required this.updateTransaction,
      required this.deleteTransaction,
      super.key});

  @override
  TransactionListItemState createState() => TransactionListItemState();
}

class TransactionListItemState extends State<TransactionListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.transaction.title),
      subtitle: Text(widget.transaction.date.toString()),
      trailing: Text(
        widget.transaction.amount.toString(),
        style: TextStyle(
          color: widget.transaction.amount < 0 ? Colors.red : Colors.green,
          fontSize: 16,
        ),
      ),
      onTap: () {
        // Navigate to edit transaction screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditTransactionScreen(
              transaction: widget.transaction,
              updateTransaction: widget.updateTransaction,
              deleteTransaction: widget.deleteTransaction,
            ),
          ),
        );
      },
    );
  }
}
