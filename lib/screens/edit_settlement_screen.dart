import 'package:flutter/material.dart';
import 'package:payme/models/settlement.dart';

class EditSettlementScreen extends StatefulWidget {
  final Settlement settlement;
  const EditSettlementScreen({required this.settlement,});

  @override
  _EditSettlementScreenState createState() => _EditSettlementScreenState();
}

class _EditSettlementScreenState extends State<EditSettlementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("${widget.settlement.name}")),
      body: Center(
        child: Column(children:<Widget> [
          Text("TEST")
        ]),
      )
    );  }
}
