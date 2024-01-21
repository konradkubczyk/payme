import 'package:flutter/material.dart';
import 'package:payme/models/user.dart';
import 'package:payme/screens/accounts_list_screen.dart';
import 'package:payme/screens/profile_screen.dart';
import 'package:payme/screens/settlements_list_screen.dart';
import 'package:payme/services/data_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    AccountsListScreen(),
    SettlementsListScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedIndex: _currentIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.wallet),
            label: 'Accounts',
          ),
          NavigationDestination(
            icon: Icon(Icons.balance),
            label: 'Settlements',
          ),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
