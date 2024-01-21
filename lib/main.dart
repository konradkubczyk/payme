import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:payme/database/database.dart';
import 'package:payme/models/user.dart' as model_user;
import 'package:payme/screens/home_screen.dart';
import 'package:payme/services/data_provider.dart';
import 'package:payme/services/database_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDatabase(); // Create a single instance of the database
  final userId = await prefillDatabase(
      database); // Prefill the database and get the generated user ID

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DatabaseProvider(database)),
      ChangeNotifierProvider(create: (_) => DataProvider(database, userId)),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// This function is responsible for prefilling the database with a user if there are no users
Future<int> prefillDatabase(AppDatabase database) async {
  final users = await model_user.User.getAllUsers(database);
  if (users.isEmpty) {
    // If there are no users, add a new user
    final newUserId =
        await database.insertNewUser(UsersCompanion.insert(name: 'User'));
    return newUserId;
  } else {
    // If there is a user, return its ID
    return users[0].id;
  }
}
