import 'package:flutter/foundation.dart';
import 'package:payme/database/database.dart';
import 'package:payme/models/category.dart' as model_category;

class Transaction { 
  int id;
  String title;
  double amount;
  DateTime date;
  model_category.Category? category;
  String? description;
//  String contrahentId;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    this.category,
    this.description,
    // TODO NIE WIEM CZY JEST SENS ŻEBY TO TU BYŁO 
   // required this.contrahentId
  });
static Future<Transaction> getTransaction(id,database) async  {
// This function returns a user object by getting the corresponding user record from database
List<dynamic> test =(await database.getTransactionById(id).get());
dynamic element =test[0];
print((element));
print((element.title));
Transaction transaction= Transaction(id:element.id,title: element.name,description:element.description,
    date:element.date,amount:element.amount,category: element.category );
print(transaction);
return transaction;


}
  static void AddTransaction(name,amount,category,user,description,counterparty,settlement,account,database) async{
  TransactionsCompanion newTransaction = TransactionsCompanion.insert(
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
  database.insertNewTransaction(newTransaction);
  (await database.select(database.transactions).get()).forEach(print);
 

}
//static Future<List><User>>   getAllUsers(database){
//}
static Future<List<Transaction>>getAllTransactions(database) async{
  List<Transaction> transactionList = [];
  List<dynamic> test =(await database.getAllTransactions());
  (test.forEach((element) { transactionList.add(
    Transaction(id:element.id,title: element.name,description:element.description,
    date:element.date,amount:element.amount,category: element.category ));
    }));


 print(transactionList);
  return  transactionList;

}
static Future<List<Transaction>>getAllUserTransactions(id,database) async{
  List<Transaction> transactionList = [];
  List<dynamic> test =(await database.getTransactionsByUser(id));
  (test.forEach((element) { transactionList.add(
    Transaction(id:element.id,title: element.name,description:element.description,
    date:element.date,amount:element.amount,category: element.category ));
    }));


 print(transactionList);
  return  transactionList;

}



}
  


