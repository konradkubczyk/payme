import 'package:flutter/material.dart';
import 'package:payme/models/settlement.dart' as mode_settlement;
import 'package:payme/screens/edit_settlement_screen.dart';
import 'package:payme/screens/settlement_details_screen.dart';
import 'package:payme/services/data_provider.dart';

class SettlementsListScreen extends StatefulWidget {
  const SettlementsListScreen({Key? key}) : super(key: key);

  @override
  _SettlementsListScreenState createState() => _SettlementsListScreenState();
}

class _SettlementsListScreenState extends State<SettlementsListScreen> {
  List<mode_settlement.Settlement> settlements = [];

  @override
  initState() {
    super.initState();
    initializeSettlements();
  }

  Future<void> initializeSettlements() async {
    final database = DataProvider.of(context, listen: false).database;
    List<mode_settlement.Settlement> updatedSettlements =
    await mode_settlement.Settlement.getAllSettlements(database);
    setState(() {
      settlements = updatedSettlements;
    });
  }

  Future<void> confirmDeleteSettlement(int index) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this settlement?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                deleteSettlement(index);
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteSettlement(int index) async {
    final database = DataProvider.of(context, listen: false).database;
    await settlements[index].delete(database);

    List<mode_settlement.Settlement> updatedSettlements =
    await mode_settlement.Settlement.getAllSettlements(database);

    setState(() {
      settlements = updatedSettlements;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settlements'),
        centerTitle: true,
      ),
      body: settlements.isEmpty
          ? const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'No settlements.\nClick the + button to add settlements.',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      )
          : ListView.builder(
        itemCount: settlements.length,
        itemBuilder: (context, index) {
          final settlement = settlements[index];
          return Dismissible(
            key: Key(settlement.id.toString()),
            background: Container(
              color: Colors.red,
              child: const ListTile(
                leading: Icon(Icons.delete, color: Colors.white),
              ),
            ),
            onDismissed: (direction) {
              confirmDeleteSettlement(index);
            },
            child: ListTile(
              leading: const Icon(Icons.receipt_long),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(settlement.name),
                  Text(
                    'Value: ${settlement.value.toString()} PLN',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              subtitle: Text(
                'Description: ${settlement.description}\nDate: ${settlement.date.toString()}',
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  confirmDeleteSettlement(index);
                },
              ),
              onTap: () {
                // Navigate to transactions screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SettlementDetailsScreen(settlement: settlement),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final settlement = mode_settlement.Settlement(
            id: 0,
            name: '',
            transactions: [],
            date: DateTime.now(),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditSettlementScreen(
                settlement: settlement,
                onUpdateSettlements: (updatedSettlements) {
                  setState(() {
                    settlements = updatedSettlements;
                  });
                },
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
