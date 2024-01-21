import 'package:drift/drift.dart';
import 'package:payme/database/database.dart';
import 'package:payme/models/person.dart';

/// Represents a friend, extending the functionality of the [Person] class.
class Friend extends Person {
  /// Constructor to initialize a [Friend] instance.
  ///
  /// Inherits properties from the [Person] class and extends it with additional
  /// information specific to a friend.
  Friend({
    required super.id,               // Inherits the 'id' property from the Person class.
    required super.name,             // Inherits the 'name' property from the Person class.
    required super.email,            // Inherits the 'email' property from the Person class.
    super.phoneNumber,               // Optional: Overrides the 'phoneNumber' property from the Person class.
    super.bankAccountNumber,         // Optional: Overrides the 'bankAccountNumber' property from the Person class.
  });
  static Future<int> addFriend(
  String personName,
  String personEmail,
  
  database,
) async {
  // Create a FriendsCompanion instance with the provided name and email
   FriendsCompanion newFriend =  await FriendsCompanion.insert(
    name: personName,
    email: Value(personEmail),
  
  );
  return (await database.insertNewFriend(newFriend));


}
static Future<Friend> getFriend(id, database) async {
    List<dynamic> test = (await database.getFriendById(id).get());
    dynamic dynamicUser = test[0];

    // Create and return a User instance based on database data.
    Friend user = Friend(
        name: dynamicUser.name,
        id: dynamicUser.id,
        email: dynamicUser.email,
        phoneNumber: dynamicUser.phoneNumber,
            );
    print(user);
    return user;
  }
}