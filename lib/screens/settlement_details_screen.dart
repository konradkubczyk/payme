import 'package:flutter/material.dart';
import 'package:payme/models/settlement.dart';
import 'package:payme/screens/edit_settlement_screen.dart';
import 'package:payme/screens/settlements_list_screen.dart';
import 'package:payme/models/friend.dart';
import 'package:payme/services/data_provider.dart';

class SettlementDetailsScreen extends StatefulWidget {
  final Settlement settlement;

  SettlementDetailsScreen({required this.settlement, Key? key}) : super(key: key);

  @override
  _SettlementDetailsScreenState createState() => _SettlementDetailsScreenState();
}

class _SettlementDetailsScreenState extends State<SettlementDetailsScreen> {
  List<int> _friendIdsList = [];
  List<String> friendsNames = [];

  @override
  void initState() {
    super.initState();
    getSettlementFriends(DataProvider.of(context, listen: false).database);
  }

  void getSettlementFriends(database) async {
    _friendIdsList = await database.getFriendIdsBySettlementId(widget.settlement.id);
    for (final friendId in _friendIdsList) {
      GetFriendsNamesFromId(friendId, database);
    }
  }

  void GetFriendsNamesFromId(id, database) async {
    Friend friend = await Friend.getFriend(id, database);
    setState(() {
      friendsNames.add(friend.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.settlement.name}"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Settlement name: ${widget.settlement.name}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("Description: ${widget.settlement.description}"),
            SizedBox(height: 8),
            Text("Value: ${widget.settlement.value} PLN"),
            SizedBox(height: 8),
            Text("Date of input: ${widget.settlement.date}"),
            SizedBox(height: 8),
            Text("Internal ID: ${widget.settlement.id}"),
            SizedBox(height: 16),
            Text(
              "Friends:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: friendsNames.map((friendName) {
                return Text("• $friendName");
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
