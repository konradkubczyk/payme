import 'package:payme/database/database.dart';

/// Represents a product with associated information and functionalities.
class Product {
  // Unique identifier for the product.
  int id;

  // Name of the product.
  String name;

  // Price of the product.
  double price;

  // Quantity of the product.
  int quantity;

  /// Constructor to initialize a [Product] instance.
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });

  /// Retrieves a product from the database based on its ID.
  static Future<Product> getProduct(id, database) async {
    List<dynamic> dynamicProducts = (await database.getProductById(id).get());
    dynamic dynamicProduct = dynamicProducts[0];

    // Create and return a Product instance based on database data.
    Product product = Product(
        name: dynamicProduct.title,
        id: dynamicProduct.id,
        price: dynamicProduct.price,
        quantity: dynamicProduct.quantity);
    return product;
  }

  /// Gets the name of the product.
  String getName() {
    return name;
  }

  /// Adds a new product to the database.
  static void addProduct(name, quantity, price, settlement, database) async {
    ProductsCompanion newProduct = ProductsCompanion.insert(
        name: name, quantity: quantity, price: price, settlement: settlement);
    database.insertNewUser(newProduct);
    (await database.select(database.Products).get());
  }

  /// Retrieves all products from the database.
  Future<List<Product>> getAllProducts(database) async {
    List<Product> productList = [];
    List<dynamic> test = (await database.getAllProducts());

    // Convert dynamic data from the database to Product instances.
    for (var element in test) {
      productList.add(Product(
          name: element.title,
          id: element.id,
          price: element.price,
          quantity: element.quantity));
    }
    return productList;
  }
}
