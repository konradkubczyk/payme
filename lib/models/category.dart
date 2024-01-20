class Category {
  int id;
  String name;

  Category({
    required this.id,
    required this.name,
  });

  static Future<List<Category>> getAllCategories(database) async {
    List<Category> categoryList = [];
    List<dynamic> test = (await database.getAllCategories());
    (test.forEach((element) {
      categoryList.add(Category(name: element.name, id: element.id));
    }));

    print(categoryList);
    return categoryList;
  }
}
