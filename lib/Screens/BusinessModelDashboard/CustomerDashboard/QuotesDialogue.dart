import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/GenericDialogueDashboard.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step5_CustomerQuotes/BcAddQuote.dart';


class CustomerQuotesDialogue extends StatefulWidget {
  final String dashboardCard;
  const CustomerQuotesDialogue({this.dashboardCard});
  @override
  _CustomerQuotesDialogueState createState() => _CustomerQuotesDialogueState(dashboardCard);
}

class _CustomerQuotesDialogueState extends State<CustomerQuotesDialogue> {
  final _firestore = Firestore.instance;
  String dashboardCard;
  _CustomerQuotesDialogueState(this.dashboardCard);
  @override
  Widget build(BuildContext context) {
    return DashboardDialogue(
      dashboardCard: dashboardCard,
      cardText: "Customer Quotes (on using the solution prototype)",
      heroTag: 'CustomerHeroTag',
      labelText: '',
      iconCard: Icons.person,
      firebaseRoute: 'Bc5_userFeedback/addQuotes/'+ addingNewQuote[0].ID,
      firebaseDocument: 'content',
      pushRoute: '/BusinessModelDashboard',
    );
  }
}

