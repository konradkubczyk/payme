// Import necessary packages and dependencies.
import 'package:drift/drift.dart';
import 'package:payme/database/database.dart';
import 'package:payme/models/account_type.dart';
import 'package:payme/models/transaction.dart' as model;

/// Represents a user account with associated information and functionalities.
class Account {
  // Unique identifier for the account.
  int id;

  // Name of the account.
  String name;

  // Type of the account (enum from 'account_type.dart').
  AccountType type;

  // List of transactions associated with the account.
  List<model.Transaction> transactions;

  /// Constructor to initialize an [Account] instance.
  Account({
    required this.id,
    required this.name,
    required this.type,
    required this.transactions,
  });

  /// Retrieves an account from the database based on its ID.
  static Future<Account> getAccount(id, database) async {
    List<dynamic> dynamicAccounts = (await database.getAccountById(id).get());
    
    dynamic dynamicAccount = dynamicAccounts[0];
    print((dynamicAccount));
    print((dynamicAccount.name));

    // Create and return an Account instance based on database data.
    Account account = Account(
        name: dynamicAccount.name,
        id: dynamicAccount.id,
        type: dynamicAccount.type,
        transactions: []);

    print(account);
    return account;
  }

  /// Retrieves all accounts from the database.
  static Future<List<Account>> getAllAccounts(database) async {
    List<Account> accounts = [];
    List<dynamic> dynamicAccounts = (await database.getAllAccounts());

    // Convert dynamic data from the database to Account instances.
    dynamicAccounts.forEach((account) {
      accounts.add(Account(
          name: account.name,
          id: account.id,
          type: account.type,
          transactions: []));
    });

    print(accounts);
    return accounts;
  }

  /// Retrieves accounts associated with a specific user ID from the database.
  static Future<List<Account>> getAccountsByUserId(userId, database) async {
    List<Account> accounts = [];
    List<dynamic> dynamicAccounts = (await database.getAccountsByUser(userId));

    // Convert dynamic data from the database to Account instances.
    dynamicAccounts.forEach((user) {
      accounts.add(Account(
          name: user.name,
          id: user.id,
          type: user.type,
          transactions: []));
    });

    print(accounts);
    return accounts;
  }

  /// Adds a new account to the database.
  static void addAccount(name, type, userId, database) async {
    AccountsCompanion newAccount =
        AccountsCompanion.insert(name: name, type: type, user: userId);
    database.insertNewAccount(newAccount);
  }

  /// Adds a new account to the database and returns its ID.
  static Future<int> addAccountReturnId(name, type, userId, database) async {
    AccountsCompanion newAccount =
        AccountsCompanion.insert(name: name, type: type, user: userId);

    return (await database.insertNewAccount(newAccount));
  }

  /// Updates the account information in the database.
  Future<void> update(AppDatabase database, int userId) async {
    var account = AccountsCompanion(
        id: Value(id),
        name: Value(name),
        type: Value(type),
        user: Value(userId));

    // Update the account information.
    await database.updateAccount(account);
  }

  /// Deletes the account from the database.
  Future<void> delete(AppDatabase database) async {
    var account = AccountsCompanion(id: Value(id));

    // Delete the account.
    await database.deleteAccount(account);
  }
}
