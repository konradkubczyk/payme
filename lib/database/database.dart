import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:payme/models/account_type.dart';

part 'database.g.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(max: 60)();

  TextColumn get email => text().nullable()();

  TextColumn get phoneNumber => text().withLength(min: 9, max: 11).nullable()();

  TextColumn get bankAccountNumber =>
      text().withLength(min: 26, max: 26).nullable()();
}

class Friends extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(max: 60)();

  TextColumn get email => text().nullable()();

  TextColumn get phoneNumber => text().withLength(min: 9, max: 11).nullable()();

  TextColumn get bankAccountNumber =>
      text().withLength(min: 26, max: 26).nullable()();

  IntColumn get settlement => integer().references(Settlements, #id)();
}

@DataClassName("Category")
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(max: 50)();
}

class Accounts extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(max: 50)();

  TextColumn get type => textEnum<AccountType>()();

  IntColumn get user => integer().references(Users, #id)();
}

class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(max: 50)();

  RealColumn get amount => real()();

  DateTimeColumn get date => dateTime()();

  IntColumn get category => integer().nullable().references(Categories, #id)();

  IntColumn get user => integer().references(Users, #id)();

  TextColumn get description => text().nullable().withLength(max: 500)();

  TextColumn get counterparty => text().nullable().withLength(max: 100)();

  IntColumn get settlement => integer().references(Settlements, #id)();

  IntColumn get account => integer().references(Accounts, #id)();
}

class Settlements extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(max: 50)();

  DateTimeColumn get date => dateTime()();
}

class Products extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(max: 50)();

  RealColumn get price => real()();

  IntColumn get quantity => integer()();

  IntColumn get settlement => integer().references(Settlements, #id)();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(tables: [
  Users,
  Friends,
  Categories,
  Accounts,
  Transactions,
  Settlements,
  Products
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future insertNewUser(UsersCompanion user) => into(users).insert(user);
  Future updateUser(UsersCompanion user) =>
      update(users).replace(user);

  Future getAllUser() => select(users).get();

  Future getUserCount() => select(users).get().then((value) => value.length);

  SingleSelectable getUserById(int id) =>
      select(users)..where((tbl) => tbl.id.equals(id));

  Future getAllCategories() => select(categories).get();

  Future insertNewAccount(AccountsCompanion account) =>
      into(accounts).insert(account);

  Future updateAccount(AccountsCompanion account) =>
      update(accounts).replace(account);

  Future deleteAccount(AccountsCompanion account) =>
      delete(accounts).delete(account);

  Future getAllAccounts() => select(accounts).get();

  SingleSelectable getAccountById(int id) =>
      select(accounts)..where((tbl) => tbl.id.equals(id));

  Future getAccountsByUser(int userId) =>
      (select(accounts)..where((tbl) => tbl.user.equals(userId))).get();

  Future insertNewTransaction(TransactionsCompanion transaction) =>
      into(transactions).insert(transaction);

  Future getAllTransactions() => select(transactions).get();

  SingleSelectable getTransactionById(int id) =>
      select(transactions)..where((tbl) => tbl.id.equals(id));

  Future getTransactionsByUser(int userId) =>
      (select(transactions)..where((tbl) => tbl.user.equals(userId))).get();

  Future insertNewSettlement(SettlementsCompanion settlement) =>
      into(settlements).insert(settlement);

  Future getAllSettlements() => select(settlements).get();

  SingleSelectable getSettlementById(int id) =>
      select(settlements)..where((tbl) => tbl.id.equals(id));

  Future insertNewProduct(ProductsCompanion product) =>
      into(products).insert(product);

  Future getAllProducts() => select(products).get();

  SingleSelectable getProductById(int id) =>
      select(products)..where((tbl) => tbl.id.equals(id));
}