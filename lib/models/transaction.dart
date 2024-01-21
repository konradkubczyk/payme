import 'package:drift/drift.dart';
import 'package:payme/database/database.dart';
import 'package:payme/models/category.dart' as model_category;

/// Represents a financial transaction with associated information and functionalities.
class Transaction {
  // Unique identifier for the transaction.
  int id;

  // Title or description of the transaction.
  String title;

  // Amount involved in the transaction.
  double amount;

  // Date and time when the transaction occurred.
  DateTime date;

  // Category associated with the transaction (nullable).
  model_category.Category? category;

  // Additional description or details about the transaction (nullable).
  String? description;

  // Account ID associated with the transaction.
  int account;

  /// Constructor to initialize a [Transaction] instance.
  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    this.category,
    this.description,
    required this.account,
  });

  /// Retrieves a transaction from the database based on its ID.
  static Future<Transaction> getTransaction(id, database) async {
    List<dynamic> dynamicTransactions =
        (await database.getTransactionById(id).get());
    dynamic dynamicTransaction = dynamicTransactions[0];
    print((dynamicTransaction));
    print((dynamicTransaction.title));

    // Create and return a Transaction instance based on database data.
    Transaction transaction = Transaction(
        id: dynamicTransaction.id,
        title: dynamicTransaction.title,
        description: dynamicTransaction.description,
        date: dynamicTransaction.date,
        amount: dynamicTransaction.amount,
        category: dynamicTransaction.category,
        account: dynamicTransaction.account);
    print(transaction);
    return transaction;
  }

  /// Adds a new transaction to the database.
  static void addTransaction(title, amount, category, user, description,
      counterparty, settlement, account, database) async {
    TransactionsCompanion newTransaction = TransactionsCompanion.insert(
        title: title,
        user: user,
        amount: amount,
        category: category,
        description: description,
        account: account,
        date: DateTime.now());
    database.insertNewTransaction(newTransaction);
    (await database.select(database.transactions).get()).forEach(print);
  }

  /// Retrieves all transactions from the database.
  static Future<List<Transaction>> getAllTransactions(database) async {
    List<Transaction> transactions = [];
    List<dynamic> dynamicTransactions = (await database.getAllTransactions());

    // Convert dynamic data from the database to Transaction instances.
    dynamicTransactions.forEach((transaction) {
      transactions.add(Transaction(
          id: transaction.id,
          title: transaction.title,
          description: transaction.description,
          date: transaction.date,
          amount: transaction.amount,
          category: transaction.category,
          account: transaction.account));
    });

    // Print the list of transactions (for testing or debugging purposes).
    print(transactions);
    return transactions;
  }

  /// Retrieves transactions associated with a specific user ID from the database.
  static Future<List<Transaction>> getTransactionsByUserId(
      userId, database) async {
    List<Transaction> transactions = [];
    List<dynamic> dynamicTransactions =
        (await database.getTransactionsByUser(userId));
    dynamicTransactions.forEach((transaction) {
      transactions.add(Transaction(
          id: transaction.id,
          title: transaction.title,
          description: transaction.description,
          date: transaction.date,
          amount: transaction.amount,
          category: transaction.category,
          account: transaction.account));
    });

    // Print the list of transactions (for testing or debugging purposes).
    print(transactions);
    return transactions;
  }

  /// Retrieves transactions associated with a specific account ID from the database.
  static Future<List<Transaction>> getTransactionsByAccountId(
      accountId, database) async {
    List<Transaction> transactionList = [];
    List<dynamic> transactions =
        (await database.getTransactionsByAccount(accountId));
    transactions.forEach((transaction) {
      transactionList.add(Transaction(
          id: transaction.id,
          title: transaction.title,
          description: transaction.description,
          date: transaction.date,
          amount: transaction.amount,
          category: transaction.category,
          account: transaction.account));
    });

    // Print the list of transactions (for testing or debugging purposes).
    print(transactionList);
    return transactionList;
  }

  /// Adds a new transaction to the database and returns its ID.
  static Future<int> addTransactionReturnId(title, userId, amount, categoryId,
      description, counterparty, accountId, database) async {
    TransactionsCompanion newTransaction = TransactionsCompanion.insert(
        title: title,
        user: userId,
        amount: amount,
        category: categoryId ?? const Value.absent(),
        description: Value(description),
        account: accountId,
        date: DateTime.now());

    return (await database.insertNewTransaction(newTransaction));
  }

  /// Updates transaction information in the database.
  Future<void> update(AppDatabase database, int userId) async {
    var transaction = TransactionsCompanion(
        id: Value(id),
        title: Value(title),
        user: Value(userId),
        amount: Value(amount),
        category: Value((category) as int?),
        description: Value(description),
        account: Value(account),
        date: Value(DateTime.now()));

    print(transaction.toString());

    await database.updateTransaction(transaction);
  }

  /// Deletes the transaction from the database.
  Future<void> delete(AppDatabase database) async {
    var transaction = TransactionsCompanion(id: Value(id));
    await database.deleteTransaction(transaction);
  }
}
