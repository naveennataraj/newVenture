import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/GenericDialogueDashboard.dart';


class ReduceReworkDialogue extends StatefulWidget {
  final String dashboardCard;
  const ReduceReworkDialogue({this.dashboardCard});
  @override
  _ReduceReworkDialogueState createState() => _ReduceReworkDialogueState(dashboardCard);
}

class _ReduceReworkDialogueState extends State<ReduceReworkDialogue> {
  final _firestore = Firestore.instance;
  String dashboardCard;
  _ReduceReworkDialogueState(this.dashboardCard);
  @override
  Widget build(BuildContext context) {
    return DashboardDialogue(
      dashboardCard: dashboardCard,
      cardText: "What is our Primary Value Proposition?",
      heroTag: 'solutionStandsOut',
      labelText: 'Describe the problem that the customer is facing',
      iconCard: Icons.call_split,
      firebaseRoute: 'Bc4_uniqueSellingProposition',
      firebaseDocument: 'proposition',
      pushRoute: '/BusinessModelDashboard',
    );
  }
}




