import 'package:drift/drift.dart';
import 'package:payme/database/database.dart';
import 'package:payme/models/account.dart' as model_account;
import 'package:payme/models/person.dart';

/// Represents a user with associated information and functionalities.
class User extends Person {
  // List of accounts associated with the user.
  List<model_account.Account> accounts;

  /// Constructor to initialize a [User] instance.
  ///
  /// Inherits properties from the [Person] class and extends it with additional
  /// information specific to a user.
  User({
    required super.id, // Inherits the 'id' property from the Person class.
    required super.name, // Inherits the 'name' property from the Person class.
    super.email, // Optional: Overrides the 'email' property from the Person class.
    super.phoneNumber, // Optional: Overrides the 'phoneNumber' property from the Person class.
    super.bankAccountNumber, // Optional: Overrides the 'bankAccountNumber' property from the Person class.
    required this.accounts, // List of accounts associated with the user.
  });

  /// Retrieves a user from the database based on their ID.
  static Future<User> getUser(id, database) async {
    List<dynamic> test = (await database.getUserById(id).get());
    dynamic dynamicUser = test[0];

    // Create and return a User instance based on database data.
    User user = User(
        name: dynamicUser.name,
        id: dynamicUser.id,
        email: dynamicUser.email,
        phoneNumber: dynamicUser.phoneNumber,
        accounts: await model_account.Account.getAccountsByUserId(
            dynamicUser.id, database));
    return user;
  }

  /// Gets the name of the user.
  String getName() {
    return name;
  }

  /// Adds a new user to the database.
  static Future<int> addUser(personName, personEmail, database) async {
    UsersCompanion newUser =
        UsersCompanion.insert(name: personName, email: personEmail);
    return (await database.insertNewUser(newUser));
  }

  /// Retrieves all users from the database.
  static Future<List<User>> getAllUsers(database) async {
    List<User> userList = [];
    List<dynamic> usersDynamic = (await database.getAllUser());

    // Convert dynamic data from the database to User instances.
    for (var user in usersDynamic) {
      userList.add(
          User(name: user.name, id: user.id, email: user.email, accounts: []));
    }

    return userList;
  }

  /// Updates user information in the database.
  static Future<void> update(
      userId, username, email, phoneNumber, database) async {
    await database.updateUser(UsersCompanion(
        id: Value(userId),
        name: Value(username),
        email: email != null ? Value(email) : const Value.absent(),
        phoneNumber:
            phoneNumber != null ? Value(phoneNumber) : const Value.absent()));
  }
}
