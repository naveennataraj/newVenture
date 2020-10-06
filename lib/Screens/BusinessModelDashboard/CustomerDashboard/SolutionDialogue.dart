import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/GenericDialogueDashboard.dart';


class SolutionStandsDialogue extends StatefulWidget {
  final bool fromBufDashboard;
  final String dashboardCard;
  const SolutionStandsDialogue({this.dashboardCard, this.fromBufDashboard});
  @override
  _SolutionStandsDialogueState createState() => _SolutionStandsDialogueState(dashboardCard);
}

class _SolutionStandsDialogueState extends State<SolutionStandsDialogue> {
  final _firestore = Firestore.instance;
  String dashboardCard;
  _SolutionStandsDialogueState(this.dashboardCard);
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
      pushRoute: (widget.fromBufDashboard == true) ? '/BUFDashboard' : '/BusinessModelDashboard',
    );
  }
}

