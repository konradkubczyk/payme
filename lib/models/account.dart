import 'package:drift/src/runtime/data_class.dart';
import 'package:payme/database/database.dart';
import 'package:payme/models/transaction.dart' as model;
import 'package:payme/models/databaseProvider.dart';
import 'package:flutter/material.dart';
class Account {
  int id;
  String name;
  String type;
  List<model.Transaction> transactions;

  Account({
    required this.id,
    required this.name,
    required this.type,
    required this.transactions,
  });
 
static Future<Account> getAccount(id,database) async  {

List<dynamic> test =(await database.getAccountById(id).get());

//print(s);
dynamic test_1 =test[0];
print((test_1));
print((test_1.name));
//TODO DODAJ ACCOUNTS OGARNIANIE 
Account user= Account(name: test_1.name,id:test_1.id,type:test_1.type,transactions: []);

//print((await database.select(database.users).get()));   
//print((await database.select(database.users)..where((a) => a.users.id.equals(id))));
//(await database.select(database.users).get()).forEach(print);

print(user);
//(await database.select(database.users)..where((a) =>a.email.equals(personEmail)).getSingle().forEach(print));
return user;}




static Future<List<Account>>getAllAccounts(database) async{
  List<Account> Accounts = [];
  List<dynamic> test =(await database.getAllAccounts());
  (test.forEach((element) {Accounts.add(
    Account(name: element.name,id:element.id,type:element.type,transactions: []));}));

 print(Accounts);
  return  Accounts;
}
//print((await database.select(database.users).get()));   
//print((await database.select(database.users)..where((a) => a.users.id.equals(id))));
//(await database.select(database.users).get()).forEach(print);

static Future<List<Account>> getAccountsbyUserId(userId,database) async{

List<Account> Accounts = [];
List<dynamic> test =(await database.getAccountsByUser(userId));
  (test.forEach((element) {Accounts.add(
    Account(name: element.name,id:element.id,type:element.type,transactions: []));}));

 print(Accounts);
  return  Accounts;

}
static void AddAccount(name,type,userId,database) async{
  AccountsCompanion newAccount= AccountsCompanion.insert(
      name: name,
      type: type,
      user: userId
  );
  database.insertNewAccount(newAccount);
  //(await database.select(database.users).get()).forEach(print);
  //print(database.getUserById(1));

}

}