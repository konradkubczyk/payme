import 'package:flutter/material.dart';
import 'package:payme/models/user.dart';
import 'package:payme/services/data_provider.dart';
import 'package:payme/services/database_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  //String userName=DataProvider().userName
  int localUserId=0;
  String _userName="";
  String _userEmail="";
  Future<void> loginUser(DatabaseProvider databaseProvider, DataProvider dataProvider) async {

    localUserId = dataProvider.userId;

     await User.update(localUserId, nameController.text, emailController.text, databaseProvider.database);
    // Set the userId in DataProvider
  
    _userName= await getUserName(databaseProvider, dataProvider);
    _userEmail = await getUserEmail(databaseProvider, dataProvider);
    // ???? jeżeli callujemy 2 razy to wtedy odrazu dziala jesli nie
    updateState(databaseProvider, dataProvider);
    //updateState(databaseProvider, dataProvider);

  }
    Future<String> getUserName(DatabaseProvider databaseProvider, DataProvider dataProvider) async {
User user= await User.getUser(localUserId,databaseProvider.database);
    String userName = user.name;
    dataProvider.userName = userName;
    print("Logged in with userId: $localUserId");
    print("DataProvider name ${dataProvider.userName}");
    return userName;
    }Future<String> getUserEmail(DatabaseProvider databaseProvider, DataProvider dataProvider) async {
User user= await User.getUser(localUserId,databaseProvider.database);
    String email = user.email as String;
    print("Logged in with userId: $localUserId");
    
    return email;
    }
  void updateState(databaseProvider,dataProvider){
    setState(() {
      _userName = dataProvider.userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<DatabaseProvider, DataProvider>(
        builder: (context, databaseProvider, dataProvider, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            //
            // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
            // action in the IDE, or press "p" in the console), to see the
            // wireframe for each widget.
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Hello",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 50)),
              Text("Welcome to our PayMe app",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 25)),
              Text("You can use this app to follow your account, your expanses and earnings aswell as settling group expenses with friends"),
              Text("Please enter in your preferred user name and your email (we promise not to contact for marketing purposes)"),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your username',
                ),
              ),
              TextField(
                controller: emailController,
                enableSuggestions: true,
                autocorrect: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your email address',
                ),
              ),
              FilledButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  iconColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  //dataProvider.userId=User.AddUser(nameController.text,emailController.text,databaseProvider.database) as int;
                  loginUser(databaseProvider, dataProvider);
                 // User.getUser(5, databaseProvider.database);
                  print(User.getAllUsers(databaseProvider.database));
                },
                child: const Text('Update your data'),
              ),
              Text("You set your user name  to: $_userName"),
              Text("You set your Email to: $_userEmail")
            ],
          ),
        ),

      );
    });
  }
}
