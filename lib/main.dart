import 'package:flutter/material.dart';
import 'package:payme/database/database.dart';
import 'package:payme/models/dataProvider.dart';
import 'package:provider/provider.dart';

import 'models/databaseProvider.dart';
import 'package:payme/screens/home_screen.dart';
import 'widgets/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  // final database = AppDatabase();
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => DatabaseProvider()),ChangeNotifierProvider(create: (_) => DataProvider())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
