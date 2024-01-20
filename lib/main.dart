import 'package:flutter/material.dart';
import 'package:payme/screens/home_screen.dart';
import 'package:payme/services/data_provider.dart';
import 'package:payme/services/database_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final database = AppDatabase();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => DatabaseProvider()),
    ChangeNotifierProvider(create: (_) => DataProvider())
  ], child: MyApp()));
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
      home: const HomeScreen(),
    );
  }
}
