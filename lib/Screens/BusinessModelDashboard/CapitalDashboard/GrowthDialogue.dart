import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/GenericDialogueDashboard.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step9_ManagingGrowth/ContentBusinessGrowth.dart';

class GrowthDialogue extends StatefulWidget {
  final bool fromBufDashboard;
  final String dashboardCard;
  const GrowthDialogue({this.dashboardCard, this.fromBufDashboard});
  @override
  _GrowthDialogueState createState() => _GrowthDialogueState(dashboardCard);
}

class _GrowthDialogueState extends State<GrowthDialogue> {
  final _firestore = Firestore.instance;
  String dashboardCard;
  _GrowthDialogueState(this.dashboardCard);
  @override
  Widget build(BuildContext context) {
    return DashboardDialogue(
      dashboardCard: dashboardCard,
      cardText: "How we handle Growth",
      heroTag: '',
      labelText: 'Provide details on how the scaling aspect of the solution would be handled.',
      iconCard: Icons.rate_review,
      firebaseRoute: 'Bc9_managingGrowth',
      firebaseDocument: 'handleScaleLText',
      pushRoute: (widget.fromBufDashboard == true) ? '/BUFDashboard' : '/BusinessModelDashboard',
    );
  }
}
