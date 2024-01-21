import 'package:flutter/material.dart';
import 'package:payme/models/settlement.dart';
import 'package:payme/screens/edit_settlement_screen.dart';
import 'package:payme/screens/settlements_list_screen.dart';

class SettlementDetailsScreen extends StatelessWidget {
  final Settlement settlement;
  const SettlementDetailsScreen({required this.settlement, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("${settlement.name}"),
      ),body: Center(
        child: Column(children: [
          Text(settlement.name),
          Text("${settlement.date}"),
            Text("${settlement.id}"),
            Text("${settlement.friends}")
        ]),
      ),
      
    );
  }
}
