import 'package:flutter/material.dart';
import 'package:payme/models/account.dart';
import 'package:payme/screens/edit_account_screen.dart';
import 'package:payme/services/database_provider.dart';
import 'package:payme/widgets/transaction_list_item.dart';
import 'package:provider/provider.dart';
import 'package:payme/models/account_type.dart';

class AccountDetailsScreen extends StatefulWidget {
  final Account account;
  final Function(Account) onAccountUpdated;

  const AccountDetailsScreen(this.account, this.onAccountUpdated, {super.key});

  @override
  _AccountDetailsScreenState createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen> {
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
                  itemCount: widget.account.transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = widget.account.transactions[index];
                    return TransactionListItem(transaction);
                  },
                ),
              ),
            ],
          ));
    });
  }
}
