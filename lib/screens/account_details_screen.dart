import 'package:flutter/material.dart';
import 'package:payme/models/account.dart' as model_account;
import 'package:payme/models/account_type.dart';
import 'package:payme/models/transaction.dart' as model_transaction;
import 'package:payme/screens/edit_account_screen.dart';
import 'package:payme/screens/edit_transaction_screen.dart';
import 'package:payme/services/data_provider.dart';
import 'package:payme/services/database_provider.dart';
import 'package:payme/widgets/transaction_list_item.dart';
import 'package:provider/provider.dart';

class AccountDetailsScreen extends StatefulWidget {
  final model_account.Account account;
  final Function(model_account.Account) onAccountUpdated;

  const AccountDetailsScreen(this.account, this.onAccountUpdated, {super.key});

  @override
  _AccountDetailsScreenState createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen> {
  List<model_transaction.Transaction> transactions = [];
  double? balance = null;

  @override
  void initState() {
    super.initState();
    initializeTransactions();
  }

  Future<void> initializeTransactions() async {
    final database = DatabaseProvider.of(context, listen: false).database;

    transactions =
        await model_transaction.Transaction.getTransactionsByAccountId(
            widget.account.id, database);

    // Sort transaction by date
    transactions.sort((a, b) => b.date.compareTo(a.date));

    // Calculate account balance by summing up all transactions
    balance = transactions.fold(
        0.0,
        (previousValue, transaction) =>
            previousValue! + transaction.amount.toDouble());

    setState(() {}); // Update the UI after fetching transactions
  }

  Future<void> createAndEditTransaction() async {
    final userId = DataProvider.of(context, listen: false).userId;
    final database = DatabaseProvider.of(context, listen: false).database;

    // Create account asynchronously
    int newTransactionId =
        await model_transaction.Transaction.addTransactionReturnId(
            'New transaction',
            userId,
            0.0,
            null,
            'Transaction description',
            widget.account.id,
            database);

    // Get the created account
    model_transaction.Transaction newTransaction =
        await model_transaction.Transaction.getTransaction(
            newTransactionId, database);

    // Refresh the account list
    await initializeTransactions();

    // Navigate to edit account screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditTransactionScreen(
          transaction: newTransaction,
          updateTransaction: updateTransaction,
          deleteTransaction: deleteTransaction,
        ),
      ),
    );
  }

  Future<void> deleteTransaction(
      model_transaction.Transaction transaction) async {
    final database = DatabaseProvider.of(context, listen: false).database;

    // Delete account
    await transaction.delete(database);

    // Refresh the account list
    await initializeTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
        builder: (context, DatabaseProvider, child) {
      return Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.account.name),
              widget.account.type == AccountType.none
                  ? const SizedBox.shrink()
                  : Text(
                      widget.account.type.name,
                      style: Theme.of(context).textTheme.caption,
                    ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditAccountScreen(
                      account: widget.account,
                      onAccountUpdated: (updatedAccount) {
                        // Update the state in other widgets or screens using the updated account
                        // For example, you can use setState in the parent widget
                        setState(() {
                          widget.onAccountUpdated(updatedAccount);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.assessment),
              title: const Text('Balance'),
              // Stream builder to display account balance
              trailing: Text(
                balance == null
                    ? 'Loading...'
                    : '${balance!.toStringAsFixed(2)}',
                style: balance != null
                    ? TextStyle(
                        color: balance! < 0 ? Colors.red : Colors.green,
                        fontSize: 16,
                      )
                    : null,
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return TransactionListItem(
                    transaction: transaction,
                    updateTransaction: updateTransaction,
                    deleteTransaction: deleteTransaction,
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createAndEditTransaction,
          child: const Icon(Icons.add),
        ),
      );
    });
  }

  updateTransaction(model_transaction.Transaction transaction) {
    final index =
        transactions.indexWhere((element) => element.id == transaction.id);
    transactions[index] = transaction;
    initializeTransactions();
  }
}
