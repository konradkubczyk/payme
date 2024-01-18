import 'package:payme/models/transaction.dart';
import 'package:payme/models/databaseProvider.dart';
import 'package:flutter/material.dart';
import '/database/database.dart';
class Account {
  int id;
  String name;
  String type;
  List<Transaction> transactions;

  Account({
    required this.id,
    required this.name,
    required this.type,
    required this.transactions,
  });
  
  static void addPerson(personName,personEmail,database) async{
  PeopleCompanion newPerson =
  PeopleCompanion.insert(name: personName, email: personEmail);
  await database.into(database.people).insert(newPerson);
  print("Test");
  (await database.select(database.people).get()).forEach(print);
  }
}
void getPerson(personName,personEmail,database) async {
// PeopleCompanion person = selectOnly((database)..where((people)=>people.email.equals(personEmail)));



  

}
