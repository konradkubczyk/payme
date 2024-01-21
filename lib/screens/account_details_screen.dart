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

  @override
  void initState() {
    super.initState();
    initializeTransactions();
  }

  Future<void> initializeTransactions() async {
    final userId = DataProvider.of(context, listen: false).userId;
    final database = DatabaseProvider.of(context, listen: false).database;

    transactions =
        await model_transaction.Transaction.getTransactionsByAccountId(
            widget.account.id, database);
    setState(() {}); // Update the UI after fetching accounts
  }

  Future<void> createAndEditTransaction() async {
    final userId = DataProvider.of(context, listen: false).userId;
    final database = DatabaseProvider.of(context, listen: false).database;

    // Create account asynchronously
    int newTransactionId =
        await model_transaction.Transaction.addTransactionReturnId(
            'New Transaction',
            userId,
            0.0,
            null,
            'New Transaction',
            'New Transaction',
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
          onTransactionUpdated: (updatedAccount) {
            // Update the state in other widgets or screens using the updated account
            // For example, you can use setState in the parent widget
            setState(() {
              // Update your state here
              initializeTransactions();
            });
          },
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
          title: Text(widget.account.name),
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
              leading: const Icon(Icons.type_specimen),
              title: const Text('Type'),
              subtitle: Text(widget.account.type.name),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return TransactionListItem(transaction);
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
}
