import 'package:flutter/material.dart';
import 'package:payme/models/settlement.dart';
import 'package:payme/screens/edit_settlement_screen.dart';
import 'package:payme/screens/settlements_list_screen.dart';

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
