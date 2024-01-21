import 'package:flutter/material.dart';
import 'package:payme/models/friend.dart';
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
  EditSettlementScreenState createState() => EditSettlementScreenState();
}

class EditSettlementScreenState extends State<EditSettlementScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _settlementValue = TextEditingController();
  final _friendNameController = TextEditingController();
  final _friendEmailController = TextEditingController();
  final List<int> _friendsList = [];
  final List<String> _friendsNames = [];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Add new settlement")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Description',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _settlementValue,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Amount',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter settlement value';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(height: 36),
                  const Text(
                    "Friends",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _friendsList.isEmpty
                      ? const Text(
                          "Please add at least one friend to the settlement",
                          style: TextStyle(color: Colors.red),
                        )
                      : _buildFriendsList(),
                  const SizedBox(height: 16),
                  const Text(
                    "Add a friend",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _friendNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Friend\'s name',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _friendEmailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Friend\'s email',
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        addFriendIntoDatabase(
                          _friendNameController.text,
                          _friendEmailController.text,
                          DataProvider.of(context, listen: false).database,
                        );
                        _friendsNames.add(_friendNameController.text);
                      }
                    },
                    child: const Text("Add friend"),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // If there are no friends added to the settlement, show an error message
              if (_friendsList.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        "Please add at least one friend to the settlement"),
                  ),
                );
                return;
              }

              insertNewSettlementIntoDatabase(
                _nameController.text,
                _settlementValue.text,
                _descriptionController.text,
                _friendsList,
                DataProvider.of(context, listen: false).database,
              );
              Navigator.pop(context);
            }
          },
          child: const Icon(Icons.save),
        ));
  }

  Widget _buildFriendsList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _friendsList.length,
      itemBuilder: (context, index) {
        return ListTile(
          // Show friends names on the list
          title: Text(_friendsNames[index]),
        );
      },
    );
  }

  void addFriendIntoDatabase(
      String name, String email, dynamic database) async {
    _friendsList.add(await (Friend.addFriend(name, email, database)));
    setState(
        () {}); // Trigger a rebuild to update the friends list on the screen
  }

  void insertNewSettlementIntoDatabase(String name, String value,
      String description, List<int> friends, dynamic database) async {
    Settlement.addSettlement(name, value, description, friends, database);
    List<Settlement> updatedSettlements =
        await Settlement.getAllSettlements(database);
    widget.onUpdateSettlements(updatedSettlements);
  }
}
