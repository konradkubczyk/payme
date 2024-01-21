import 'package:flutter/material.dart';
import 'package:payme/models/settlement.dart';
import 'package:payme/services/data_provider.dart';
import 'package:payme/models/friend.dart';

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
  final List<int> _friendsList=[];

  void insertNewSettlementIntoDatabase(
      name, value, description,friends, database,) async {
    Settlement.addSettlement(name, value, description, friends,database);
    List<Settlement> updatedSettlements =
        await Settlement.getAllSettlements(database);
    widget.onUpdateSettlements(updatedSettlements);
  }

  void addProductIntoDatabase(name, cost, buyer, database) {
    // Add logic to save product details (name, cost, buyer)
    // For now, print the details to the console
    print("Product Name: $name");
    print("Product Cost: $cost");
    print("Product Buyer: $buyer");

    // Add further logic if needed, e.g., saving to database
  }
  void addFriendintoDatabase(name,email,database) async{
    // Add logic to save friend details (name and email)
    // For now, print the details to the console
    _friendsList.add (await (Friend.addFriend(name,email,database))); 
    print("Friend Name: ${_friendNameController.text}");
    print("Friend Email: ${_friendEmailController.text}");
    

    // Add further logic if needed, e.g., saving to database
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(title: Text("Add new Settlement")),
      body: SingleChildScrollView(
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
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                ),
              ),
              TextFormField(
                controller: _settlementValue,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Monetary value',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  insertNewSettlementIntoDatabase(
                    _nameController.text,
                    _settlementValue.text,
                    _descriptionController.text,
                    _friendsList,
                    DataProvider.of(context, listen: false).database,
                  );
                  Navigator.pop(context);
                },
                child: Text("Add"),
              ),
              SizedBox(height: 20),
              Text(
                "Add a Friend to the settlement",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _friendNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Friend Name',
                ),
              ),
              TextFormField(
                controller: _friendEmailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Friend Email',
                ),
              ),
              ElevatedButton(
  onPressed: () {
    addFriendintoDatabase(
      _friendNameController.text,
      _friendEmailController.text,
      DataProvider.of(context, listen: false).database,
    );
  },
  child: Text("Add Friend"),),SizedBox(height: 20),
              Text(
                "Add a Product to the settlement",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                // Add product name field
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Product Name',
                ),
              ),
              TextFormField(
                // Add product cost field
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Product Cost',
                ),
              ),
              TextFormField(
                // Add product buyer field
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Product Buyer',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  addProductIntoDatabase(
                    // Retrieve values from the product form fields
                    'Product Name',
                    'Product Cost',
                    'Product Buyer',
                    DataProvider.of(context, listen: false).database,
                  );
                },
                child: Text("Add Product"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
















