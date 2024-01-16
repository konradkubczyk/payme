import 'package:flutter/material.dart';
import 'package:payme/models/settlement.dart';

class SettlementListItem extends StatelessWidget {
  final Settlement settlement;

  SettlementListItem(this.settlement);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(settlement.name),
      subtitle: Text('Date: ${settlement.date.toString()}'),
    );
  }
}
