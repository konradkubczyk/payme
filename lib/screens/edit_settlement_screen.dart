import 'package:flutter/material.dart';
import 'package:payme/models/settlement.dart';
import 'package:payme/services/data_provider.dart';

class EditSettlementScreen extends StatefulWidget {
  final Settlement settlement;
  final ValueChanged<List<Settlement>> onUpdateSettlements;

  EditSettlementScreen({
    required this.settlement,
    required this.onUpdateSettlements,
  });

  @override
  _EditSettlementScreenState createState() => _EditSettlementScreenState();
}

class _EditSettlementScreenState extends State<EditSettlementScreen> {
  final _nameController = TextEditingController();

  void insertNewSettlementIntoDatabase(name, database) async {
    Settlement.addSettlement(name, database);
    List<Settlement> updatedSettlements =
        await Settlement.getAllSettlements(database);
    widget.onUpdateSettlements(updatedSettlements);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add new Settlement")),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter settlement  name';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  insertNewSettlementIntoDatabase(
                    _nameController.text,
                    DataProvider.of(context, listen: false).database,
                  );
                  Navigator.pop(context);
                },
                child: Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
