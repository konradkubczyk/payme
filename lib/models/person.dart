
abstract class Person {
  int id;
  String name;
  String email;
  String? phoneNumber;
  String? bankAccountNumber;

  Person({
    required this.id,
    required this.name,
    required this.email,
    this.phoneNumber,
    this.bankAccountNumber,
  });
  
}
