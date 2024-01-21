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
  late TextEditingController _amountController;
  late TextEditingController _dateController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.transaction.title);
    _amountController =
        TextEditingController(text: widget.transaction.amount.toString());
    _dateController =
        TextEditingController(text: widget.transaction.date.toString());
    _descriptionController =
        TextEditingController(text: widget.transaction.description.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Transaction'),
        ),
        body: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Form(
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
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: _amountController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Amount',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter transaction amount';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: _dateController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Date',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter transaction date';
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter transaction description';
                          }
                          return null;
                        },
                        minLines: 3,
                        maxLines: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Update the transaction information
              widget.transaction.title = _nameController.text;
              widget.transaction.amount = double.parse(_amountController.text);
              widget.transaction.date = DateTime.parse(_dateController.text);
              widget.transaction.description =
                  _descriptionController.text.toString();

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
          child: const Icon(Icons.done),
        ));
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
