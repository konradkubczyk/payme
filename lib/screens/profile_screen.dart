import 'package:flutter/material.dart';
import 'package:payme/models/user.dart';
import 'package:payme/services/data_provider.dart';
import 'package:payme/services/database_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Build your widget tree here
          return _buildContent();
        } else {
          // Show a loading indicator or an empty container while waiting
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Future<void> _initializeUserData() async {
    final database = DatabaseProvider.of(context, listen: false).database;
    final userId = DataProvider.of(context, listen: false).userId;
    final user = await User.getUser(userId, database);

    nameController.text = user.name;
    emailController.text = user.email!;
    phoneNumberController.text = user.phoneNumber!;
  }

  Widget _buildContent() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    Text("Hello, ${nameController.text}!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 32)),
                    const SizedBox(height: 20),
                    const Text("Welcome to our PayMe app",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 10),
                    const Text(
                      "You can use this app to follow your account, your expenses, and earnings, as well as settling group expenses with friends.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 32),
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Enter your username',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: emailController,
                      enableSuggestions: true,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        labelText: 'Enter your email address',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Enter your phone number',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_validateUsername()) {
                          _updateUserData();
                        } else {
                          _showValidationError('Please enter a username.');
                        }
                      },
                      child: const Text('Update your data'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  bool _validateUsername() {
    return nameController.text.trim().isNotEmpty;
  }

  void _showValidationError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _updateUserData() async {
    final database = DatabaseProvider.of(context, listen: false).database;
    final userId = DataProvider.of(context, listen: false).userId;

    await User.update(userId, nameController.text, emailController.text,
        phoneNumberController.text, database);
  }
}
