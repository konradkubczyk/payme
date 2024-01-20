import 'package:flutter/material.dart';
import 'package:payme/database/database.dart';

class DatabaseProvider extends ChangeNotifier {
// This class is responsible for providing the database to other widgets to be accesible whenerever it is needed
// First i create the instance of app from the database.dart file
  final database = AppDatabase();
// this is a function that handles the addidtion of a new person to the database
// in the future it will also check if the user has already registered an account
}
