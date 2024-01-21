import 'package:payme/database/database.dart';
import 'package:payme/models/friend.dart' as model_friend;
import 'package:payme/models/product.dart' as model_product;
import 'package:payme/models/transaction.dart' as model_transaction;

class Settlement {
  int id;
  String name;
  List<model_friend.Friend>? friends;
  List<model_transaction.Transaction>? transactions;
  List<model_product.Product>? products;
  DateTime date;

  Settlement({
    required this.id,
    required this.name,
    this.transactions,
    this.friends,
    this.products,
    required this.date,
  });

  static Future<Settlement> getSettlement(id, database) async {
    List<dynamic> test = (await database.getSettlementById(id).get());
    dynamic test_1 = test[0];
    print((test_1));
    print((test_1.title));
    Settlement settlement =
        Settlement(name: test_1.title, id: test_1.id, date: test_1.date);
    print(settlement);
    return settlement;
  }

  String getName() {
    return name;
  }

  static void addSettlement(name, database) async {
    SettlementsCompanion newSettlement = SettlementsCompanion.insert(
      name: name,
      date: DateTime.now(),
    );
    database.insertNewUser(newSettlement);
    (await database.select(database.Settlements).get()).forEach(print);
  }

  Future<List<Settlement>> getAllSettlements(database) async {
    List<Settlement> settlementList = [];
    List<dynamic> test = (await database.getAllSettlements());
    (test.forEach((element) {
      settlementList.add(
          Settlement(name: element.title, id: element.id, date: element.date));
    }));

    print(settlementList);
    return settlementList;
  }
}
