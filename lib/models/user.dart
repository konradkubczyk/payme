import 'package:drift/drift.dart';
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
static Future<User> getUser(id,database) async  {
// PeopleCompanion person = selectOnly((database)..where((people)=>people.email.equals(personEmail)));

List<dynamic> test =(await database.getUserById(id).get());

//print(s);
dynamic test_1 =test[0];
print((test_1));
print((test_1.name));
//TODO DODAJ ACCOUNTS OGARNIANIE 
User user= User(name: test_1.name,id:test_1.id,email: test_1.email,accounts: []);

//print((await database.select(database.users).get()));   
//print((await database.select(database.users)..where((a) => a.users.id.equals(id))));
//(await database.select(database.users).get()).forEach(print);

print(user);
print("Po tescie");//await database.select(database.users)..where((tbl) => tbl.id.equals(id));
//(await database.select(database.users)..where((a) =>a.email.equals(personEmail)).getSingle().forEach(print));
return user;


}
String getName(){


  return this.name;
}
static void AddUser(personName,personEmail,database) async{
  UsersCompanion newUser = UsersCompanion.insert(
      name: personName,
      email: personEmail
  );
  database.insertNewUser(newUser);
  //(await database.select(database.users).get()).forEach(print);
  //print(database.getUserById(1));

}
//static Future<List><User>>   getAllUsers(database){



//}
static Future<List<User>>getAllUsers(database) async{
  List<User> userList = [];
  List<dynamic> test =(await database.getAllUser());
  (test.forEach((element) {userList.add(
    User(name: element.name,id:element.id,email: element.email,accounts: []));
    }));


 print(userList);
  return  userList;

}




}
