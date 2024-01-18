import 'package:flutter/material.dart';
import '/database/database.dart';

class DatabaseProvider extends ChangeNotifier{
// This class is responsible for providing the database to other widgets to be accesible whenerever it is needed
// First i create the instance of app from the database.dart file 
final database = AppDatabase();
// this is a function that handles the addidtion of a new person to the database
void addToDatabase(userName) async{

  PeopleCompanion newPerson =
  PeopleCompanion.insert(name: userName, email: "new.user@example.com");
  await database.into(database.people).insert(newPerson);
  print("Test");
  (await database.select(database.people).get()).forEach(print);
  



  }




}