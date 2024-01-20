import 'package:flutter/material.dart';
import 'package:payme/models/account.dart';
import 'package:payme/models/account_type.dart';
import 'package:payme/services/data_provider.dart';
import 'package:payme/services/database_provider.dart';

class EditAccountScreen extends StatefulWidget {
  final Account account;
  final Function(Account) onAccountUpdated; // Callback function

  const EditAccountScreen({
    required this.account,
    required this.onAccountUpdated,
    Key? key,
  }) : super(key: key);

  @override
  _EditAccountScreenState createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late String _selectedAccountType;
  List<String> _availableAccountTypes =
  AccountType.values.map((type) => type.toString().split('.').last).toList();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.account.name);
    _selectedAccountType = widget.account.type.toString().split('.').last;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Account'),
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
                  labelText: 'Account Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter account name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              DropdownButtonFormField<String>(
                value: _selectedAccountType,
                onChanged: (value) {
                  setState(() {
                    _selectedAccountType = value!;
                  });
                },
                items: _availableAccountTypes.map((type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Account Type',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select account type';
                  }
                  return null;
                },
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Update the account information
                    widget.account.name = _nameController.text;
                    widget.account.type =
                        AccountTypeExtension.fromString(_selectedAccountType);

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

extension AccountTypeExtension on AccountType {
  static AccountType fromString(String type) {
    return AccountType.values
        .firstWhere((e) => e.toString().split('.').last == type);
  }
}
