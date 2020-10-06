import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/GenericDialogueDashboard.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step9_ManagingGrowth/ContentBusinessGrowth.dart';

class NorthMetricDialogue extends StatefulWidget {
  final bool fromBufDashboard;
  final String dashboardCard;
  const NorthMetricDialogue({this.dashboardCard, this.fromBufDashboard});
  @override
  _NorthMetricDialogueState createState() => _NorthMetricDialogueState(dashboardCard);
}

class _NorthMetricDialogueState extends State<NorthMetricDialogue> {
  final _firestore = Firestore.instance;
  String dashboardCard;
  _NorthMetricDialogueState(this.dashboardCard);
  @override
  Widget build(BuildContext context) {
    return DashboardDialogue(
      dashboardCard: dashboardCard,
      cardText: "North Star metric",
      heroTag: '',
      labelText: 'List the single most important metric for your business',
      iconCard: Icons.star,
      firebaseRoute: 'Bc10_metrics',
      firebaseDocument: 'metricSectionOne',
      pushRoute: (widget.fromBufDashboard == true) ? '/BUFDashboard' : '/BusinessModelDashboard',
    );
  }
}
