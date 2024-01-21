/// Represents a category with associated information and functionalities.
class Category {
  // Unique identifier for the category.
  int id;

  // Name of the category.
  String name;

  /// Constructor to initialize a [Category] instance.
  Category({
    required this.id,
    required this.name,
  });

  /// Retrieves all categories from the database.
  static Future<List<Category>> getAllCategories(database) async {
    List<Category> categoryList = [];
    List<dynamic> test = (await database.getAllCategories());

    // Convert dynamic data from the database to Category instances.
    test.forEach((element) {
      categoryList.add(Category(name: element.name, id: element.id));
    });

    // Print the list of categories (for testing or debugging purposes).
    print(categoryList);
    
    return categoryList;
  }
}
