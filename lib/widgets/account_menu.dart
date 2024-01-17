import 'package:flutter/material.dart';
import 'package:payme/models/account.dart';
import 'package:payme/screens/edit_account_screen.dart';

class AccountMenu extends StatelessWidget {
  final Account account;

  const AccountMenu(this.account, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.account_balance),
            title: Text(account.name),
            subtitle: account.type != null ? Text(account.type!) : null,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit Account'),
            onTap: () {
              // Navigate to edit account screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditAccountScreen(account),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Delete Account'),
            onTap: () {
              // Delete account
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
