import 'package:payme/database/database.dart';

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
  static void addPerson(personName,personEmail,database) async{
  
}
void getPerson(personName,personEmail,database) async {
// PeopleCompanion person = selectOnly((database)..where((people)=>people.email.equals(personEmail)));



  

}
}
