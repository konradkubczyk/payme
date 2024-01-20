import 'package:flutter/material.dart';
import 'package:payme/models/account.dart';
import 'package:payme/screens/edit_account_screen.dart';
import 'package:payme/services/database_provider.dart';
import 'package:payme/widgets/transaction_list_item.dart';
import 'package:provider/provider.dart';

class AccountDetailsScreen extends StatelessWidget {
  final Account account;

  const AccountDetailsScreen(this.account, {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
        builder: (context, DatabaseProvider, child) {
      return Scaffold(
          appBar: AppBar(
            title: Text(account.name),
            actions: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditAccountScreen(account),
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
                subtitle: Text(account.type == null
                    ? 'None'
                    : account.type.toString().split('.').last),
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: account.transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = account.transactions[index];
                    return TransactionListItem(transaction);
                  },
                ),
              ),
            ],
          ));
    });
  }
}
