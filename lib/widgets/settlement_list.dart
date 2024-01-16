import 'package:flutter/material.dart';
import 'package:payme/models/settlement.dart';
import 'package:payme/widgets/settlement_list_item.dart';

class SettlementList extends StatelessWidget {
  final List<Settlement> settlements;

  SettlementList(this.settlements);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: settlements.length,
      itemBuilder: (context, index) {
        return SettlementListItem(settlements[index]);
      },
    );
  }
}
