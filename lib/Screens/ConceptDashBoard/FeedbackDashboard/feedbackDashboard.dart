import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/PreValidation/addDistributionMedium.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionIdeation/pickDetails.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionValidation/addQuote.dart';
import 'package:iventure001/Screens/BUFDashboard/BufDashboardNavigationBloc.dart';
import 'package:iventure001/Screens/ConceptDashBoard/FeedbackDashboard/customerProblemDialogue.dart';
import 'package:iventure001/Screens/ConceptDashBoard/FeedbackDashboard/quoteDialogue.dart';
import 'package:iventure001/Screens/ConceptDashBoard/FeedbackDashboard/solutionDeliveryDialogue.dart';
import 'package:iventure001/Screens/ConceptDashBoard/SolutionDashboard/solutionDashboard.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/DashboardLayout.dart';

import '../OverviewDashboard/overViewDashboard.dart';
import '../conceptDashboardNavigationBloc.dart';

class feedbackDashBoard extends StatefulWidget
    with ConceptDashboardStates, BufDashboardStates {
  final TextStyle headingStyle;
  final CrossAxisAlignment headingAlignment;
  final double sizedboxwidth;
  final double sizedboxheight;
  final bool inConceptDashboard;

  feedbackDashBoard(
      {Key key,
      this.headingStyle,
      this.headingAlignment,
      this.sizedboxwidth,
      this.sizedboxheight,
      this.inConceptDashboard});
  @override
  _feedbackDashBoardState createState() => _feedbackDashBoardState();
}

String event = '';
String medium = '';
String content = '';

class _feedbackDashBoardState extends State<feedbackDashBoard> {
  final _firestore = Firestore.instance;

  void getDocument() async {
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

    final quotedocument = await _firestore
        .collection('$currentUser/SolutionValidation/Quote')
        .getDocuments();
//    print("GEt method called");

    for (var quotemessage in quotedocument.documents) {
      AddingNewQuote = [];
      final Content = quotemessage.data['Content'];
      final CheckQuote = quotemessage.data['CheckQuote'];
      final ID = quotemessage.documentID;

      final card = addQuote(Content: Content, CheckQuote: CheckQuote, ID: ID);
      AddingNewQuote.add(card);
    }

    setState(() {
      if (AddingNewQuote.length != 0) {
//        print('setting up Quote card');
        content = AddingNewQuote[0].Content;
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
  }

  @override
  void initState() {
//    print('init called');
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
        Padding(
          padding: EdgeInsets.all((MediaQuery.of(context).size.width >= 1400)
              ? 50
              : (MediaQuery.of(context).size.width <= 750) ? 10 : 30),
          child: DashboardCards(
            cardIcon: Icons.assignment_turned_in,
            cardTitle: 'The customer problem is resolved.',
            cardNote: event,
            onTap: () {},
            onEditTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => customerProblemDialogue(
                  event: event,
                  inConceptDashboard: widget.inConceptDashboard,
                ),
              ).then((value) => setState(() {}));
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all((MediaQuery.of(context).size.width >= 1400)
              ? 50
              : (MediaQuery.of(context).size.width <= 750) ? 10 : 30),
          child: DashboardCards(
            cardIcon: Icons.local_shipping,
            cardTitle: 'How we intend to deliver the solution',
            cardNote:
                'We plan to distribute our product via: $medium, as our primary medium.',
            cardButtonName: 'CHANGE DISTRIBUTION MEDIUM',
            onTap: () {
              Navigator.pushNamed(context, '/adddistributionmedium');
            },
//            editableCard: false,
            onEditTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => solutionDeliveryDialogue(
                  medium: medium,
                  inConceptDashboard: widget.inConceptDashboard,
                ),
              ).then((_) => setState(() {}));
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all((MediaQuery.of(context).size.width >= 1400)
              ? 50
              : (MediaQuery.of(context).size.width <= 750) ? 10 : 30),
          child: DashboardCards(
            cardIcon: Icons.record_voice_over,
            cardTitle: 'Customer Quotes (on using the solution prototype)',
            cardNote: content,
            cardButtonName: 'VIEW MORE QUOTES',
            onTap: () {
              Navigator.pushNamed(context, '/addquotes');
            },
//              onEditTap: () {
//                showDialog(
//                  context: context,
//                  builder: (BuildContext context) => solutionDeliveryDialogue(
//                    medium: medium,
//                  ),
//                ).then((_) => setState(() {}));
//              }
            onEditTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => quoteDialogue(
                  quote: content,
                  inConceptDashboard: widget.inConceptDashboard,
                ),
              ).then((_) => setState(() {}));
            },
          ),
        ),
      ],
    );
  }
}
