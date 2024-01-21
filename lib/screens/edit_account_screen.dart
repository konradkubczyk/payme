import 'package:flutter/material.dart';
import 'package:payme/models/account.dart';
import 'package:payme/models/account_type.dart';
import 'package:payme/services/data_provider.dart';

class EditAccountScreen extends StatefulWidget {
  final Account account;
  final Function(Account) onAccountUpdated; // Callback function

  const EditAccountScreen({
    required this.account,
    required this.onAccountUpdated,
    super.key,
  });

  @override
  _EditAccountScreenState createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late AccountType _selectedAccountType;
  final List<AccountType> _availableAccountTypes = AccountType.values.toList();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.account.name);
    _selectedAccountType = widget.account.type;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Account'),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
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
                              return 'Please enter account name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        DropdownButtonFormField<AccountType>(
                          value: _selectedAccountType,
                          onChanged: (value) {
                            setState(() {
                              _selectedAccountType = value!;
                            });
                          },
                          items: _availableAccountTypes.map((type) {
                            return DropdownMenuItem<AccountType>(
                              value: type,
                              child: Text(type.name),
                            );
                          }).toList(),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Type',
                          ),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select account type';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Update the account information
              widget.account.name = _nameController.text;
              widget.account.type = _selectedAccountType;

              // Save changes
              widget.account.update(
                DataProvider.of(context, listen: false).database,
                DataProvider.of(context, listen: false).userId,
              );

              // Call the callback function with the modified account
              widget.onAccountUpdated(widget.account);

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
