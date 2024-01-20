import 'package:flutter/foundation.dart';
import 'package:payme/database/database.dart';

class Transaction {
  String id;  
  String title;
  double amount;
  DateTime date;
  String category;
  String? description;
  String contrahentId;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    this.description,
    required this.contrahentId
  });
  Stream<User> getTransaction(id,database)  {
// PeopleCompanion person = selectOnly((database)..where((people)=>people.email.equals(personEmail)));
return database.select(database.transactions)..where((Transaction)=>Transaction.id.equals(id).watchSingle());
}
  static void AddTransaction(name,amount,category,user,description,counterparty,settlement,account,database) async{
  TransactionsCompanion newUser = TransactionsCompanion.insert(
      name: name,
      user: user,
      amount: amount,
      category:category,
      description: description,
      counterparty:counterparty,
      settlement: settlement,
      account: account,
      date: DateTime.now()
  );
  database.insertNewUser(newUser);
  (await database.select(database.transactions).get()).forEach(print);
 

}
//static Future<List><User>>   getAllUsers(database){



//}
Future<List<User>> getAllTransactions(database) {
  return  database.select(database.transactions).get();

}


}
  


