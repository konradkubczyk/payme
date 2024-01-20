import 'package:flutter/material.dart';
import 'package:payme/database/database.dart';

class Product {
  int id;
  String name;
  double price;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });
  static Future<Product> getProduct(id,database) async  {
// This function returns a user object by getting the corresponding user record from database
List<dynamic> test =(await database.getProductById(id).get());
dynamic test_1 =test[0];
print((test_1));
print((test_1.name));
Product product= Product(name: test_1.name,id:test_1.id,price:test_1.price,quantity: test_1.quantity);
print(product);
return product ;


}
String getName(){


return name;
}
static void AddProduct(name,quantity,price,settlement,database) async{
  ProductsCompanion newProduct = ProductsCompanion.insert(
      name: name,
      quantity: quantity,
      price:price,
      settlement: settlement

  );
  database.insertNewUser(newProduct);
  (await database.select(database.Products).get()).forEach(print);


}
//static Future<List><User>>   getAllUsers(database){



//}
Future<List<Product>> getAllProducts(database)async {
    List<Product> ProductList = [];
  List<dynamic> test =(await database.getAllProducts());
  (test.forEach((element) {ProductList.add(
    Product(name: element.name,id:element.id,price:element.price,quantity: element.quantity ));
    }));


 print(ProductList);
  return  ProductList;

}

}
