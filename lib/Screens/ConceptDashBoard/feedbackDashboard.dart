import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/PreValidation/addDistributionMedium.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionIdeation/pickDetails.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionValidation/addQuote.dart';
import 'package:iventure001/Screens/ConceptDashBoard/solutionDashboard.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/DashboardLayout.dart';

import 'conceptDashboardNavigationBloc.dart';
import 'overViewDashboard.dart';

class feedbackDashBoard extends StatefulWidget with ConceptDashboardStates {
  final TextStyle headingStyle;
  final CrossAxisAlignment headingAlignment;
  final double sizedboxwidth;
  final double sizedboxheight;

  const feedbackDashBoard(
      {Key key,
      this.headingStyle,
      this.headingAlignment,
      this.sizedboxwidth,
      this.sizedboxheight});
  @override
  _feedbackDashBoardState createState() => _feedbackDashBoardState();
}

String event = '';
String medium = '';
String content = '';
bool feedbackspinner = false;

class _feedbackDashBoardState extends State<feedbackDashBoard> {
  final _firestore = Firestore.instance;
  void getDocument() async {
    feedbackspinner = true;
    final Detailsdocument = await _firestore
        .collection('$currentUser/SolutionIdeation/pickDetails')
        .getDocuments();
//    print("GEt method called");

    for (var Detailsmessage in Detailsdocument.documents) {
      PickDetailsArray = [];
      final checked = Detailsmessage.data['checked'];
      final Event = Detailsmessage.data['Event'];
      final Monetize = Detailsmessage.data['Monetize'];
      final PVP = Detailsmessage.data['PVP'];
      final Traits = Detailsmessage.data['Traits'];
      final TopPick = Detailsmessage.data['TopPick'];
      final ID = Detailsmessage.documentID;

      final fields = pickDetails(
          checked: checked,
          Event: Event,
          Monetize: Monetize,
          PVP: PVP,
          Traits: Traits,
          TopPick: TopPick,
          ID: ID);

      PickDetailsArray.add(fields);
    }
    setState(() {
      if (PickDetailsArray.length != 0) {
        event = PickDetailsArray[0].Event;
        monetize = PickDetailsArray[0].Monetize;
        pvp = PickDetailsArray[0].PVP;
      }
    });

    final mediumdocument = await _firestore
        .collection('$currentUser/PreValidation/addMedium')
        .getDocuments();
//    print("GEt method called");

    for (var mediummessage in mediumdocument.documents) {
      addMediumArray = [];
      final Medium = mediummessage.data['Medium'];
      final ID = mediummessage.documentID;

      final fields = addDistributionMedium(medium: Medium, ID: ID);

      addMediumArray.add(fields);
    }
    setState(() {
      if (addMediumArray.length != 0) {
        medium = addMediumArray[0].medium;
      }
    });

    final quotedocument = await _firestore
        .collection('$currentUser/SolutionValidation/Quote')
        .getDocuments();
//    print("GEt method called");

    for (var quotemessage in quotedocument.documents) {
      final Content = quotemessage.data['Content'];
      final CheckQuote = quotemessage.data['CheckQuote'];
      final ID = quotemessage.documentID;

      final card = addQuote(Content: Content, CheckQuote: CheckQuote, ID: ID);
      AddingNewQuote.add(card);
    }
    setState(() {
      feedbackspinner = false;
      if (AddingNewQuote.length != 0) {
        content = AddingNewQuote[0].Content;
      }
    });
  }

  @override
  void initState() {
    if (currentUser != null) {
      getDocument();
    } else {
      _AnimatedFlutterLogoState();
    }

    super.initState();
  }

  Timer _timer;

  _AnimatedFlutterLogoState() {
    _timer = new Timer(const Duration(seconds: 2), () {
      setState(() {
        if (currentUser != null && currentUser != '') {
          getDocument();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SubdivisionalDashBoardLayout(
      sizedboxwidth:
          (widget.sizedboxwidth != null) ? widget.sizedboxwidth : 100,
      headingAlignment: (widget.headingAlignment != null)
          ? widget.headingAlignment
          : CrossAxisAlignment.center,
      headingStyle: (widget.headingStyle != null)
          ? widget.headingStyle
          : topHeadingTextStyle,
      sizedboxheight:
          (widget.sizedboxheight != null) ? widget.sizedboxheight : 50,
      dashboardTitle: 'When the customers interacted with our solution',
      dashboardcards: <Widget>[
        DashboardCards(
          cardIcon: Icons.person,
          cardTitle: 'The customer problem is resolved.',
          cardNote: event,
          onTap: () {},
        ),
        DashboardCards(
          cardIcon: Icons.person,
          cardTitle: 'How we intend to deliver the solution',
          cardNote:
              'We plan to distribute our product via: $medium, as our primary medium.',
          cardButtonName: 'CHANGE DISTRIBUTION MEDIUM',
          onTap: () {
            Navigator.pushNamed(context, '/adddistributionmedium');
          },
        ),
        DashboardCards(
          cardIcon: Icons.attach_money,
          cardTitle: 'Customer Quotes (on using the solution prototype)',
          cardNote: content,
          cardButtonName: 'VIEW MORE QUOTES',
          onTap: () {
            Navigator.pushNamed(context, '/addquotes');
          },
        ),
      ],
    );
  }
}
