import 'package:flutter/material.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

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
            subtitle: Text(account.details),
            onTap: () {
              // Navigate to transactions screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TransactionsScreen(account),
                ),
              );
            },
            onLongPress: () {
              // Navigate to account details screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AccountDetailsScreen(account),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Account {
  final String name;
  final String details;

  Account(this.name, this.details);
}

class TransactionsScreen extends StatelessWidget {
  final Account account;

  const TransactionsScreen(this.account, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: Center(
        child: Text('Transactions for ${account.name}'),
      ),
    );
  }
}

class AccountDetailsScreen extends StatelessWidget {
  final Account account;

  const AccountDetailsScreen(this.account, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Account Name: ${account.name}'),
            const SizedBox(height: 16),
            Text('Account Details: ${account.details}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to edit account screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditAccountScreen(account),
                  ),
                );
              },
              child: const Text('Edit Account'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditAccountScreen extends StatelessWidget {
  final Account account;

  const EditAccountScreen(this.account, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Account'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Edit Account: ${account.name}'),
            const SizedBox(height: 16),
            Text('Account Details: ${account.details}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save changes and navigate back to account details screen
                Navigator.pop(context);
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}

// Sample accounts data
final accounts = [
  Account('Account 1', 'Account details 1'),
  Account('Account 2', 'Account details 2'),
  Account('Account 3', 'Account details 3'),
];
