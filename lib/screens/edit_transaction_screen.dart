import 'package:flutter/material.dart';
import 'package:payme/models/transaction.dart';
import 'package:payme/services/data_provider.dart';

class EditTransactionScreen extends StatefulWidget {
  final Transaction transaction;
  final Function(Transaction) onTransactionUpdated; // Callback function

  const EditTransactionScreen({
    required this.transaction,
    required this.onTransactionUpdated,
    super.key,
  });

  @override
  _EditTransactionScreenState createState() => _EditTransactionScreenState();
}

class _EditTransactionScreenState extends State<EditTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.transaction.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Transaction'),
      ),
      body: Form(
        key: _formKey,
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
                    return 'Please enter transaction name';
                  }
                  return null;
                },
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Update the transaction information
                    widget.transaction.title = _nameController.text;

                    // Save changes
                    widget.transaction.update(
                      DataProvider.of(context, listen: false).database,
                      DataProvider.of(context, listen: false).userId,
                    );

                    // Call the callback function with the modified transaction
                    widget.onTransactionUpdated(widget.transaction);

                    // Close the screen
                    Navigator.pop(context);
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
