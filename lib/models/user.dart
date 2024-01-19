import 'package:payme/database/database.dart';
import 'package:payme/models/account.dart' as model_account;
import 'package:payme/models/person.dart';

class User extends Person {
  List<model_account.Account> accounts;

  User({
    required super.id,
    required super.name,
    required super.email,
    super.phoneNumber,
    super.bankAccountNumber,
    required this.accounts,
  });

  static void AddUser(personName,personEmail,database) async{
  UsersCompanion newUser = UsersCompanion.insert(
      name: personName,
      email: personEmail
  );
  database.insertNewUser(newUser);
  (await database.select(database.users).get()).forEach(print);
  print(database.getUserById(1));

}
Stream<User> getUser(personName,personEmail,database)  {
// PeopleCompanion person = selectOnly((database)..where((people)=>people.email.equals(personEmail)));
return database.select(database.Users)..where((person)=>person.email.equals(personEmail).watchSingle());


  

}

}