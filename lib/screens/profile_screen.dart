import 'package:flutter/material.dart';
import 'package:payme/models/user.dart';
import 'package:payme/services/data_provider.dart';
import 'package:payme/services/database_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Add a GlobalKey for the form

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
        centerTitle: true,
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
                child: Center(
                  child: Form(
                    key: _formKey,
                    // Associate the form key with the Form widget
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            (nameController.text.isEmpty)
                                ? "Hello."
                                : "Hello, ${nameController.text}.",
                            style: const TextStyle(
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
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: 'Username',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter a username.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: emailController,
                          enableSuggestions: true,
                          autocorrect: false,
                          decoration: const InputDecoration(
                            labelText: 'Email address (optional)',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: phoneNumberController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: 'Phone number (optional)',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Validate the form
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, update the user data
                              _updateUserData();
                            }
                          },
                          child: const Text('Update your data'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
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
