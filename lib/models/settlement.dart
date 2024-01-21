import 'package:drift/drift.dart';
import 'package:payme/database/database.dart';
import 'package:payme/models/friend.dart' as model_friend;
import 'package:payme/models/product.dart' as model_product;
import 'package:payme/models/transaction.dart' as model_transaction;

/// Represents a financial settlement with associated information and functionalities.
class Settlement {
  // Unique identifier for the settlement.
  int id;

  // Name of the settlement.
  String name;

  // List of friends associated with the settlement (nullable).
  List<model_friend.Friend>? friends;

  // List of transactions associated with the settlement (nullable).
  List<model_transaction.Transaction>? transactions;

  // List of products associated with the settlement (nullable).
  List<model_product.Product>? products;

  // Date and time when the settlement occurred.
  DateTime date;
  double? value;
  String? description;

  /// Constructor to initialize a [Settlement] instance.
  Settlement({
    required this.id,
    required this.name,
    this.transactions,
    this.friends,
    this.products,
    required this.date,
    this.value,
    this.description
  });

  /// Retrieves a settlement from the database based on its ID.
  static Future<Settlement> getSettlement(id, database) async {
    List<dynamic> test = (await database.getSettlementById(id).get());
    dynamic test_1 = test[0];
    print((test_1));
    print((test_1.title));

    // Create and return a Settlement instance based on database data.
    Settlement settlement =
        Settlement(name: test_1.title, id: test_1.id, date: test_1.date);
    print(settlement);
    return settlement;
  }

  /// Gets the name of the settlement.
  String getName() {
    return name;
  }

  /// Adds a new settlement to the database.
  static void addSettlement(name,value,description, database) async {
    var doubleValue = double.parse((value));
    SettlementsCompanion newSettlement = SettlementsCompanion.insert(
      name: name,
      date: DateTime.now(),
      value: doubleValue as double,
      description: Value(description),
  
    );
    database.insertNewSettlement(newSettlement);
   // (await database.select(database.Settlements).get()).forEach(print);
  }

  /// Retrieves all settlements from the database.
  static Future<List<Settlement>> getAllSettlements(database) async {
    List<Settlement> settlementList = [];
    List<dynamic> test = (await database.getAllSettlements());

    // Convert dynamic data from the database to Settlement instances.
    test.forEach((element) {
      settlementList.add(
          Settlement(name: element.name, id: element.id, date: element.date,value: element.value,description: element.description));
    });

    // Print the list of settlements (for testing or debugging purposes).
    print(settlementList);
    return settlementList;
  }
}
