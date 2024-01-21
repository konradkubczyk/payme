/// Represents an abstract person with basic information.
abstract class Person {
  // Unique identifier for the person.
  int id;

  // Name of the person.
  String name;

  // Email address of the person (nullable).
  String? email;

  // Phone number of the person (nullable).
  String? phoneNumber;

  // Bank account number of the person (nullable).
  String? bankAccountNumber;

  /// Constructor to initialize a [Person] instance with basic information.
  ///
  /// The [id] and [name] parameters are required, while [email], [phoneNumber],
  /// and [bankAccountNumber] are optional and can be null.
  Person({
    required this.id,
    required this.name,
    this.email,
    this.phoneNumber,
    this.bankAccountNumber,
  });
}
