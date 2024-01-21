import 'package:flutter/material.dart';
import 'package:payme/models/account.dart';
import 'package:payme/models/account_type.dart';
import 'package:payme/screens/edit_account_screen.dart';

class AccountMenu extends StatefulWidget {
  final Account account;
  final Function(Account) onAccountUpdated;
  final Function(Account) deleteAccount;

  AccountMenu({
    required this.account,
    required this.onAccountUpdated,
    required this.deleteAccount,
  });

  @override
  _AccountMenuState createState() => _AccountMenuState();
}

class _AccountMenuState extends State<AccountMenu> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.account_balance),
            title: Text(widget.account.name),
            subtitle: widget.account.type != AccountType.none
                ? Text(widget.account.type.name)
                : null,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit account'),
            onTap: () {
              // Navigate to edit account screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditAccountScreen(
                    account: widget.account,
                    onAccountUpdated: (updatedAccount) {
                      // Update the state in other widgets or screens using the updated account
                      // For example, you can use setState in the parent widget
                      // Update your state here
                      setState(() {});
                      widget.onAccountUpdated(updatedAccount);
                    },
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Delete account'),
            onTap: () {
              // Delete account
              widget.deleteAccount(widget.account);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
