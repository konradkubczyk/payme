import 'package:flutter/material.dart';
import 'package:payme/database/database.dart';
import 'package:provider/provider.dart';

// This class is responsible for providing the database to other widgets to be accessible whenever it is needed
// First we create the instance of app from the database.dart file
class DatabaseProvider extends ChangeNotifier {

  final AppDatabase database;

  DatabaseProvider(this.database);

  static DatabaseProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<DatabaseProvider>(context, listen: listen);
  }
}
