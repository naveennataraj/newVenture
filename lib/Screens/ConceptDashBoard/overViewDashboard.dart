import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionIdeation/pickDetails.dart';
import 'package:iventure001/Screens/ConceptDashBoard/CustomerDashboard/customerDashboard.dart';
import 'package:iventure001/Screens/ConceptDashBoard/NextStepsDashboard/nextStepsDashboard.dart';
import 'package:iventure001/Screens/ConceptDashBoard/SolutionDashboard/solutionDashboard.dart';
import 'package:iventure001/Screens/ConceptDashBoard/conceptDashboardNavigationBloc.dart';

import 'FeedbackDashboard/feedbackDashboard.dart';

class overViewDashBoard extends StatefulWidget with ConceptDashboardStates {
  @override
  _overViewDashBoardState createState() => _overViewDashBoardState();
}

String pvp = '';

class _overViewDashBoardState extends State<overViewDashBoard> {
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
        monetize = PickDetailsArray[0].Monetize;
        pvp = PickDetailsArray[0].PVP;
        event = PickDetailsArray[0].Event;
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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              width: 100,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Concept DashBoard',
                        style: topHeadingTextStyle,
                        //TextStyle(fontSize: 60),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        width: 800,
                        color: Colors.white,
                        child: Material(
                          elevation: 20,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.card_giftcard),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Tasks using E-Method (Primary Solution Offering)',
                                          style: cardTitleTextStyle,
                                          //TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                        ),
                                      ),
                                      Icon(Icons.edit),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: SizedBox(
                                    height: 30,
                                  ),
                                ),
                                Text(
                                  pvp,
                                  style: cardBodyTextStyle,
                                  //TextStyle(fontSize: 18),
                                ),
                                Flexible(
                                  child: SizedBox(
                                    height: 30,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20.0, bottom: 20),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'VIEW WIREFRAME',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0XFFE95420),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                  customerDashBoard(
                    sizedboxheight: 0,
                    sizedboxwidth: 0,
                    headingStyle: sideHeadingTextStyle,
                    headingAlignment: CrossAxisAlignment.start,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                  solutionDashBoard(
                    sizedboxheight: 0,
                    sizedboxwidth: 0,
                    headingStyle: sideHeadingTextStyle,
                    headingAlignment: CrossAxisAlignment.start,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                  feedbackDashBoard(
                    sizedboxheight: 0,
                    sizedboxwidth: 0,
                    headingStyle: sideHeadingTextStyle,
                    headingAlignment: CrossAxisAlignment.start,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                  nextStepsDashBoard(
                    sizedboxheight: 0,
                    sizedboxwidth: 0,
                    headingStyle: sideHeadingTextStyle,
                    headingAlignment: CrossAxisAlignment.start,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
