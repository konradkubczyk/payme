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
}
