import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/GenericDialogueDashboard.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step9_ManagingGrowth/ContentParallelSolution.dart';


class ParallelDialogue extends StatefulWidget {
  final String dashboardCard;
  const ParallelDialogue({this.dashboardCard});
  @override
  _ParallelDialogueState createState() => _ParallelDialogueState(dashboardCard);
}

class _ParallelDialogueState extends State<ParallelDialogue> {
  final _firestore = Firestore.instance;
  String dashboardCard;
  _ParallelDialogueState(this.dashboardCard);
  @override
  Widget build(BuildContext context) {
    return DashboardDialogue(
      dashboardCard: dashboardCard,
      cardText: "Other offerings planned",
      heroTag: 'ParallelHeroTag',
      labelText: '',
      iconCard: Icons.person,
      firebaseRoute: 'Bc9_managingGrowth/addConcepts/'+ AddingNewParallelInnovations[0].ID,
      firebaseDocument: 'Description',
      pushRoute: '/BusinessModelDashboard',
    );
  }
}
