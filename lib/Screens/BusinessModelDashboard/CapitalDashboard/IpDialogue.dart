import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/GenericDialogueDashboard.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step7_BusinessModelElements/ContentBcIntellectualAssets.dart';

class IpDialogue extends StatefulWidget {
  final bool fromBufDashboard;
  final String dashboardCard;
  const IpDialogue({this.dashboardCard, this.fromBufDashboard});
  @override
  _IpDialogueState createState() => _IpDialogueState(dashboardCard);
}

class _IpDialogueState extends State<IpDialogue> {
  final _firestore = Firestore.instance;
  String dashboardCard;
  _IpDialogueState(this.dashboardCard);
  @override
  Widget build(BuildContext context) {
    return DashboardDialogue(
      dashboardCard: dashboardCard,
      cardText: "IP Properties",
      heroTag: '',
      labelText: 'What is the nature of intellectual property you are trying to protect?',
      iconCard: Icons.folder_special,
      firebaseRoute: 'Bc7_businessModelElements/addIntellectualProperties/'+ addingIntellectualAssets[0].ID,
      firebaseDocument: 'intellectualCode',
      pushRoute: (widget.fromBufDashboard == true) ? '/BUFDashboard' : '/BusinessModelDashboard',
    );
  }
}

