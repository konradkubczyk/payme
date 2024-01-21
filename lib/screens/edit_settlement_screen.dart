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
  final _descriptionController = TextEditingController();
  final _settlementValue = TextEditingController();
  final _friendNameController = TextEditingController();
  final _friendEmailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void insertNewSettlementIntoDatabase(
      name, value, description, database) async {
    Settlement.addSettlement(name, value, description, database);
    List<Settlement> updatedSettlements =
    await Settlement.getAllSettlements(database);
    widget.onUpdateSettlements(updatedSettlements);
  }

  void addFriendintoDatabase(name, email, database) {
    // Add logic to save friend details (name and email)
    // For now, print the details to the console
    print("Friend Name: ${_friendNameController.text}");
    print("Friend Email: ${_friendEmailController.text}");

    // Add further logic if needed, e.g., saving to database
  }

  void addProductIntoDatabase(name, cost, buyer, database) {
    // Add logic to save product details (name, cost, buyer)
    // For now, print the details to the console
    print("Product Name: $name");
    print("Product Cost: $cost");
    print("Product Buyer: $buyer");

    // Add further logic if needed, e.g., saving to database
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add new Settlement")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
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
                      return 'Please enter settlement name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _settlementValue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Monetary value',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter settlement value';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      insertNewSettlementIntoDatabase(
                        _nameController.text,
                        _settlementValue.text,
                        _descriptionController.text,
                        DataProvider.of(context, listen: false).database,
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Add"),
                ),
                const SizedBox(height: 36),
                const Text(
                  "Add a Friend to the settlement",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _friendNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Friend Name',
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _friendEmailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Friend Email',
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      addFriendintoDatabase(
                        _friendNameController.text,
                        _friendEmailController.text,
                        DataProvider.of(context, listen: false).database,
                      );
                    }
                  },
                  child: const Text("Add Friend"),
                ),
                const SizedBox(height: 36),
                const Text(
                  "Add a Product to the settlement",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  // Add product name field
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Product Name',
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  // Add product cost field
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Product Cost',
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  // Add product buyer field
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Product Buyer',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      addProductIntoDatabase(
                        // Retrieve values from the product form fields
                        'Product Name',
                        'Product Cost',
                        'Product Buyer',
                        DataProvider.of(context, listen: false).database,
                      );
                    }
                  },
                  child: const Text("Add Product"),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Add new settlement to the database
            insertNewSettlementIntoDatabase(
              _nameController.text,
              _settlementValue.text,
              _descriptionController.text,
              DataProvider.of(context, listen: false).database,
            );
            Navigator.pop(context);
          }
        },
        tooltip: 'Save',
        child: const Icon(Icons.check),
      ),
    );
  }
}
