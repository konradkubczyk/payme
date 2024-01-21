import 'package:drift/drift.dart';
import 'package:payme/database/database.dart';
import 'package:payme/models/category.dart' as model_category;

class Transaction {
  int id;
  String title;
  double amount;
  DateTime date;
  model_category.Category? category;
  String? description;
  int account;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    this.category,
    this.description,
    required this.account,
    // TODO: NIE WIEM CZY JEST SENS ŻEBY TO TU BYŁO
    // required this.contrahentId
  });

  static Future<Transaction> getTransaction(id, database) async {
    List<dynamic> dynamicTransactions =
        (await database.getTransactionById(id).get());
    dynamic dynamicTransaction = dynamicTransactions[0];
    print((dynamicTransaction));
    print((dynamicTransaction.title));
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

  static void addTransaction(title, amount, category, user, description,
      counterparty, settlement, account, database) async {
    TransactionsCompanion newTransaction = TransactionsCompanion.insert(
        title: title,
        user: user,
        amount: amount,
        category: category,
        description: description,
        // counterparty: counterparty,
        // settlement: settlement,
        account: account,
        date: DateTime.now());
    database.insertNewTransaction(newTransaction);
    (await database.select(database.transactions).get()).forEach(print);
  }

  static Future<List<Transaction>> getAllTransactions(database) async {
    List<Transaction> transactions = [];
    List<dynamic> dynamicTransactions = (await database.getAllTransactions());
    (dynamicTransactions.forEach((transaction) {
      transactions.add(Transaction(
          id: transaction.id,
          title: transaction.title,
          description: transaction.description,
          date: transaction.date,
          amount: transaction.amount,
          category: transaction.category,
          account: transaction.account));
    }));

    print(transactions);
    return transactions;
  }

  static Future<List<Transaction>> getTransactionsByUserId(
      userId, database) async {
    List<Transaction> transactions = [];
    List<dynamic> dynamicTransactions =
        (await database.getTransactionsByUser(userId));
    (dynamicTransactions.forEach((transaction) {
      transactions.add(Transaction(
          id: transaction.id,
          title: transaction.title,
          description: transaction.description,
          date: transaction.date,
          amount: transaction.amount,
          category: transaction.category,
          account: transaction.account));
    }));

    print(transactions);
    return transactions;
  }

  static Future<List<Transaction>> getTransactionsByAccountId(
      accountId, database) async {
    List<Transaction> transactionList = [];
    List<dynamic> transactions =
        (await database.getTransactionsByAccount(accountId));
    (transactions.forEach((transaction) {
      transactionList.add(Transaction(
          id: transaction.id,
          title: transaction.title,
          description: transaction.description,
          date: transaction.date,
          amount: transaction.amount,
          category: transaction.category,
          account: transaction.account));
    }));

    print(transactionList);
    return transactionList;
  }

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
    await database.updateTransaction(transaction);
  }

  Future<void> delete(AppDatabase database) async {
    var transaction = TransactionsCompanion(id: Value(id));
    await database.deleteTransaction(transaction);
  }
}
