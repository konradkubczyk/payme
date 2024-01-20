import 'package:flutter/material.dart';
import 'package:payme/models/account.dart';
import 'package:payme/screens/account_details_screen.dart';
import 'package:payme/screens/edit_account_screen.dart';
import 'package:payme/services/data_provider.dart';
import 'package:payme/services/database_provider.dart';
import 'package:payme/widgets/account_menu.dart';

class AccountsListScreen extends StatelessWidget {
  List<Account> accounts;

  AccountsListScreen({Key? key}) : accounts = [];

  Future<void> initializeAccounts() async {
    accounts = await Account.getAccountsByUserId(
        DataProvider().userId, DatabaseProvider().database);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accounts'),
      ),
      body: ListView.builder(
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          final account = accounts[index];
          return ListTile(
            leading: const Icon(Icons.account_balance),
            title: Text(account.name),
            subtitle: account.type != null ? Text(account.type!) : null,
            onTap: () {
              // Navigate to transactions screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AccountDetailsScreen(account),
                ),
              );
            },
            onLongPress: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => AccountMenu(account),
              );
            },
            trailing: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                // Open account menu
                showModalBottomSheet(
                  context: context,
                  builder: (context) => AccountMenu(account),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Create a new account and navigate to edit account screen
          final account = Account(id: 0, name: '', type: '', transactions: []);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditAccountScreen(account),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Sample accounts data

/*final accounts = [
  Account(id: 1, name: 'Account 1', type: 'Checking', transactions: [
    Transaction(
      id: 1,
      title: 'Transaction 1',
      date: DateTime.now(),
      description: 'Transaction 1',
      amount: 100.00,
    ),
    Transaction(
      id: 2,
      title: 'Transaction 2',
      date: DateTime.now(),
      description: 'Transaction 2',
      amount: 200.00,
    ),
    Transaction(
      id: 3,
      title: 'Transaction 3',
      date: DateTime.now(),
      description: 'Transaction 3',
      amount: 300.00,
    ),
  ]),
  Account(id: 2, name: 'Account 2', transactions: [
    Transaction(
      id: 4,
      title: 'Transaction 4',
      date: DateTime.now(),
      description: 'Transaction 4',
      amount: 400.00,
    ),
    Transaction(
      id: 5,
      title: 'Transaction 5',
      date: DateTime.now(),
      description: 'Transaction 5',
      amount: 500.00,
    ),
    Transaction(
      id: 6,
      title: 'Transaction 6',
      date: DateTime.now(),
      description: 'Transaction 6',
      amount: 600.00,
    ),
  ]),
  Account(id: 3, name: 'Account 3', type: 'Credit Card', transactions: [
    Transaction(
      id: 7,
      title: 'Transaction 7',
      date: DateTime.now(),
      description: 'Transaction 7',
      amount: 700.00,
    ),
    Transaction(
      id: 8,
      title: 'Transaction 8',
      date: DateTime.now(),
      description: 'Transaction 8',
      amount: 800.00,
    ),
    Transaction(
      id: 9,
      title: 'Transaction 9',
      date: DateTime.now(),
      description: 'Transaction 9',
      amount: 900.00,
    ),
  ]),
];
*/
