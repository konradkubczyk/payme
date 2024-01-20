import 'package:flutter/material.dart';
import 'package:payme/models/settlement.dart';
import 'package:payme/models/transaction.dart';
import 'package:payme/screens/edit_settlement_screen.dart';

class SettlementsListScreen extends StatelessWidget {
  const SettlementsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settlements'),
      ),
      body: ListView.builder(
        itemCount: settlements.length,
        itemBuilder: (context, index) {
          final settlement = settlements[index];
          return ListTile(
            leading: const Icon(Icons.money),
            title: Text(settlement.name),
            subtitle: Text(settlement.date.toString()),
            onTap: () {
              // Navigate to transactions screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettlementDetailsScreen(settlement),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Create a new settlement and navigate to edit settlement screen
          final settlement = Settlement(
              id: 0, name: '', transactions: [], date: DateTime.now());
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditSettlementScreen(settlement),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

final settlements = [
  Settlement(
    id: 1,
    name: 'Settlement 1',
    transactions: [
      Transaction(
        id: 1,
        title: 'Transaction 1',
        amount: 100,
        date: DateTime.now(),
      ),
      Transaction(
        id: 2,
        title: 'Transaction 2',
        amount: 200,
        date: DateTime.now(),
      ),
    ],
    date: DateTime.now(),
  ),
  Settlement(
    id: 2,
    name: 'Settlement 2',
    transactions: [
      Transaction(
        id: 3,
        title: 'Transaction 3',
        amount: 300,
        date: DateTime.now(),
      ),
      Transaction(
        id: 4,
        title: 'Transaction 4',
        amount: 400,
        date: DateTime.now(),
      ),
    ],
    date: DateTime.now(),
  ),
  Settlement(
    id: 3,
    name: 'Settlement 3',
    transactions: [
      Transaction(
        id: 5,
        title: 'Transaction 5',
        amount: 500,
        date: DateTime.now(),
      ),
      Transaction(
        id: 6,
        title: 'Transaction 6',
        amount: 600,
        date: DateTime.now(),
      ),
    ],
    date: DateTime.now(),
  ),
];
