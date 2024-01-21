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
  List<int> _friendIdsList=[];
  var friendsNames = "";

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
      friendsNames = friendsNames + friend.name + " ";
    friendsNames = friendsNames + (friend.email ?? "") + " ,";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.settlement.name}"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          Text("Settlement name: ${widget.settlement.name}"),
          Text("Description ${widget.settlement.description}"),
          Text("Value: ${widget.settlement.value} pln"),
          Text("date of input${widget.settlement.date}"),
          Text("internal id${widget.settlement.id}"),
          Text("Friends: ${friendsNames}")
        ]),
      ),
    );
  }
}
