import 'package:flutter/material.dart';
import 'package:payme/models/account.dart';
import 'package:payme/widgets/transaction_list.dart';

class AccountList extends StatelessWidget {
  final List<Account> accounts;

  AccountList(this.accounts);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: accounts.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(accounts[index].type),
            subtitle: TransactionList(accounts[index].transactions),
          ),
        );
      },
    );
  }
}
