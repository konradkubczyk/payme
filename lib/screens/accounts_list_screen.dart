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
  AccountsListScreenState createState() => AccountsListScreenState();
}

class AccountsListScreenState extends State<AccountsListScreen> {
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
        builder: (context) => EditAccountScreen(
          account: newAccount,
          onAccountUpdated: (updatedAccount) {
            // Update the state in other widgets or screens using the updated account
            // For example, you can use setState in the parent widget
            setState(() {
              // Update your state here
              initializeAccounts();
            });
          },
        ),
      ),
    );
  }

  Future<void> deleteAccount(Account account) async {
    final database = DatabaseProvider.of(context, listen: false).database;

    // Delete account
    await account.delete(database);

    // Refresh the account list
    await initializeAccounts();

    // Show a snack-bar alert
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Account deleted'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accounts'),
        centerTitle: true,
      ),
      body: accounts.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'No accounts.\nClick the + button to add accounts.',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : ListView.builder(
              itemCount: accounts.length,
              itemBuilder: (context, index) {
                final account = accounts[index];
                return ListTile(
                  // Unchanged code for ListTile
                  leading: const Icon(Icons.account_balance),
                  title: Text(account.name),
                  subtitle: account.type != AccountType.none
                      ? Text(account.type.name)
                      : null,
                  onTap: () {
                    // Navigate to transactions screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountDetailsScreen(
                          account,
                          (updatedAccount) {
                            setState(() {
                              initializeAccounts();
                            });
                          },
                        ),
                      ),
                    );
                  },
                  onLongPress: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => AccountMenu(
                        account: account,
                        onAccountUpdated: (account) {
                          setState(() {
                            initializeAccounts();
                          });
                        },
                        deleteAccount: (account) {
                          setState(() {
                            deleteAccount(account);
                          });
                        },
                      ),
                    );
                  },
                  trailing: IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      // Open account menu
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => AccountMenu(
                          account: account,
                          onAccountUpdated: (account) {
                            setState(() {
                              initializeAccounts();
                            });
                          },
                          deleteAccount: (account) {
                            setState(() {
                              deleteAccount(account);
                            });
                          },
                        ),
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
