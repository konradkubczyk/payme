import 'package:flutter/material.dart';
import 'package:payme/models/account.dart';
import 'package:payme/models/account_type.dart';
import 'package:payme/screens/account_details_screen.dart';
import 'package:payme/screens/edit_account_screen.dart';
import 'package:payme/services/data_provider.dart';
import 'package:payme/services/database_provider.dart';
import 'package:payme/widgets/account_menu.dart';

class AccountsListScreen extends StatefulWidget {
  const AccountsListScreen({Key? key});

  @override
  _AccountsListScreenState createState() => _AccountsListScreenState();
}

class _AccountsListScreenState extends State<AccountsListScreen> {
  List<Account> accounts = [];

  @override
  void initState() {
    super.initState();
    initializeAccounts();
  }

  Future<void> initializeAccounts() async {
    final userId = DataProvider.of(context, listen: false).userId;
    final database = DatabaseProvider.of(context, listen: false).database;

    accounts = await Account.getAccountsByUserId(userId, database);
    setState(() {}); // Update the UI after fetching accounts
  }

  Future<void> createAndEditAccount() async {
    final userId = DataProvider.of(context, listen: false).userId;
    final database = DatabaseProvider.of(context, listen: false).database;

    // Create account asynchronously
    int newAccountId = await Account.addAccountReturnId(
        "New account", AccountType.none, userId, database);

    // Get the created account
    Account newAccount = await Account.getAccount(newAccountId, database);

    // Refresh the account list
    await initializeAccounts();

    // Navigate to edit account screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditAccountScreen(newAccount),
      ),
    );
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
            // Unchanged code for ListTile
            leading: const Icon(Icons.account_balance),
            title: Text(account.name),
            subtitle: account.type != AccountType.none ? Text(account.type.name) : null,
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
        onPressed: createAndEditAccount,
        child: const Icon(Icons.add),
      ),
    );
  }
}
