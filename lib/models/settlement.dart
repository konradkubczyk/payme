import 'package:payme/database/database.dart';
import 'package:payme/models/friend.dart';
import 'package:payme/models/product.dart';
import 'package:payme/models/transaction.dart';

class Settlement {
  int id;
  String name;
  List<Friend>? friends;
  List<Transaction>? transactions;
  List<Product>? products;
  DateTime date;

  Settlement({
    required this.id,
    required this.name,
    this.friends,
    this.transactions,
    this.products,
    required this.date,
  });
  
Stream<Settlement> getSettlementById(id,database)  {
// PeopleCompanion person = selectOnly((database)..where((people)=>people.email.equals(personEmail)));
return database.select(database.settlements)..where((settlement)=>settlement.id.equals(id).watchSingle());
}
String getName(){


return name;
}
static void AddSettlement(name,database) async{
  SettlementsCompanion newSettlement = SettlementsCompanion.insert(
      name: name,
      date:DateTime.now(),
  );
  database.insertNewUser(newSettlement);
  (await database.select(database.Settlements).get()).forEach(print);


}
//static Future<List><User>>   getAllUsers(database){



//}
Future<List<User>> getAllUsers(database) {
  return  database.select(database.users).get();

}


}


