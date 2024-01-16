import 'package:flutter/material.dart';

class SettlementsScreen extends StatelessWidget {
  const SettlementsScreen({super.key});

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
            title: Text(settlement.title),
            subtitle: Text(settlement.description),
            onTap: () {
              // Navigate to settlement details screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettlementDetailsScreen(settlement: settlement),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open settlement form pane
          showModalBottomSheet(
            context: context,
            builder: (context) => const SettlementFormPane(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Settlement {
  final String title;
  final String description;

  Settlement({required this.title, required this.description});
}

final List<Settlement> settlements = [
  Settlement(
    title: 'Settlement 1',
    description: 'This is the first settlement',
  ),
  Settlement(
    title: 'Settlement 2',
    description: 'This is the second settlement',
  ),
  Settlement(
    title: 'Settlement 3',
    description: 'This is the third settlement',
  ),
];

class SettlementDetailsScreen extends StatelessWidget {
  final Settlement settlement;

  const SettlementDetailsScreen({super.key, required this.settlement});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(settlement.title),
      ),
      body: Center(
        child: Text(settlement.description),
      ),
    );
  }
}

class SettlementFormPane extends StatelessWidget {
  const SettlementFormPane({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Add New Settlement',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                  ),
                ),
              ],
            ),
          ),
          // Add settlement form fields here
        ],
      ),
    );
  }
}
