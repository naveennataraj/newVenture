import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/GenericDialogueDashboard.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step8_Synergies/ContentSynergies.dart';



class SynergyDialogue extends StatefulWidget {
  final String dashboardCard;
  const SynergyDialogue({this.dashboardCard});
  @override
  _SynergyDialogueState createState() => _SynergyDialogueState(dashboardCard);
}

class _SynergyDialogueState extends State<SynergyDialogue> {
  final _firestore = Firestore.instance;
  String dashboardCard;
  _SynergyDialogueState(this.dashboardCard);
  @override
  Widget build(BuildContext context) {
    return DashboardDialogue(
      dashboardCard: dashboardCard,
      heroTag: '',
      cardText: "How we Synergize",
      labelText: 'Please provide a detailed description of the synergy',
      iconCard: Icons.call_split,
      firebaseRoute: 'Bc8_synergies/addSynergies/'+ addingNewSynergies[0].ID,
      firebaseDocument: 'synergyDescription',
      pushRoute: '/BusinessModelDashboard',
    );
  }
}

