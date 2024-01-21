import 'package:drift/drift.dart';
import 'package:payme/database/database.dart';
import 'package:payme/models/account_type.dart';
import 'package:payme/models/transaction.dart' as model;

class Account {
  int id;
  String name;
  AccountType type;
  List<model.Transaction> transactions;

  Account({
    required this.id,
    required this.name,
    required this.type,
    required this.transactions,
  });

  static Future<Account> getAccount(id, database) async {
    List<dynamic> dynamicAccounts = (await database.getAccountById(id).get());

    dynamic dynamicAccount = dynamicAccounts[0];
    print((dynamicAccount));
    print((dynamicAccount.name));
    Account account = Account(
        name: dynamicAccount.name,
        id: dynamicAccount.id,
        type: dynamicAccount.type,
        transactions: []);

    print(account);
    return account;
  }

  static Future<List<Account>> getAllAccounts(database) async {
    List<Account> accounts = [];
    List<dynamic> dynamicAccounts = (await database.getAllAccounts());
    (dynamicAccounts.forEach((account) {
      accounts.add(Account(
          name: account.name,
          id: account.id,
          type: account.type,
          transactions: []));
    }));

    print(accounts);
    return accounts;
  }

  static Future<List<Account>> getAccountsByUserId(userId, database) async {
    List<Account> accounts = [];
    List<dynamic> dynamicAccounts = (await database.getAccountsByUser(userId));
    (dynamicAccounts.forEach((user) {
      accounts.add(Account(
          name: user.name,
          id: user.id,
          type: user.type,
          transactions: []));
    }));

    print(accounts);
    return accounts;
  }

  static void addAccount(name, type, userId, database) async {
    AccountsCompanion newAccount =
        AccountsCompanion.insert(name: name, type: type, user: userId);
    database.insertNewAccount(newAccount);
  }

  static Future<int> addAccountReturnId(name, type, userId, database) async {
    AccountsCompanion newAccount =
        AccountsCompanion.insert(name: name, type: type, user: userId);

    return (await database.insertNewAccount(newAccount));
  }

  Future<void> update(AppDatabase database, int userId) async {
    var account = AccountsCompanion(
        id: Value(id),
        name: Value(name),
        type: Value(type),
        user: Value(userId));

    // Update the account information
    await database.updateAccount(account);
  }

  Future<void> delete(AppDatabase database) async {
    var account = AccountsCompanion(id: Value(id));

    // Delete the account
    await database.deleteAccount(account);
  }
}