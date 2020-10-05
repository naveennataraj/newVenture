import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Screens/BUFDashboard/BufDashboardNavigationBloc.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcAddFoundation/ContentBcCollectFoundation.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/BcOverviewDialogue.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:iventure001/Screens/ConceptDashBoard/CustomerDashboard/customerDashboard.dart';
import 'package:iventure001/Screens/ConceptDashBoard/FeedbackDashboard/feedbackDashboard.dart';
import 'package:iventure001/Screens/ConceptDashBoard/SolutionDashboard/solutionDashboard.dart';
import 'package:iventure001/Screens/BUFDashboard/ProductDashboard/ProductDashboard.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/BcMarketDashboard.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/BcMoneyDashboard.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/BcMoneyDashboard.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/BcMetricsDashboard.dart';
import 'package:iventure001/Screens/ConceptDashBoard/NextStepsDashboard/nextStepsDashboard.dart';
class BufOverviewDashboard extends StatefulWidget with BufDashboardStates {
  @override
  _BufOverviewDashboardState createState() => _BufOverviewDashboardState();
}

class _BufOverviewDashboardState extends State<BufOverviewDashboard> {
  final _firestore = Firestore.instance;
  bool spinner = false;
  String missionText;
  String visionText;
  String ID;
  void getContent()  {
    spinner = true;
    String missionValidation = collectionBcStep1Content[0].descriptionMission;
    String visionValidation = collectionBcStep1Content[0].descriptionVision;

    if (missionText == missionValidation && visionText == visionValidation ) {
      missionText = collectionBcStep1Content[0].descriptionMission;
      visionText= collectionBcStep1Content[0].descriptionVision;
    } else {
      getDocuments();
    }
  }
// Retrieve data from firebase
  void getDocuments() async {
    spinner = true;
    final document = await _firestore.collection(currentUser)
        .document('Bc1_buildTheFoundation').get();

    if (document.exists) {
      try {
        setState(() {
          spinner = false;
          missionText = document.data['mission'];
          visionText = document.data['vision'];
          ID = document.documentID;
        });
      } catch (e) {
        print(e);
      }
    }
    final fields = ContentBcStep1CollectionFoundation(
        descriptionMission: missionText,
        descriptionVision: visionText,
        ID: ID);
    collectionBcStep1Content.insert(0, fields);
    setState(() {
      spinner = false;
    });
  }
  @override
  void initState() {
    if (currentUser != null) {
      (collectionBcStep1Content.length != 0)
          ? getContent()
          : getDocuments();
    } else {
      _AnimatedFlutterLogoState();
    }

    super.initState();
  }

  Timer _timer;

  _AnimatedFlutterLogoState() {
    spinner = true;
    _timer = new Timer(const Duration(seconds: 2), () {
      setState(() {
        if (currentUser != null && currentUser != '') {
          getDocuments();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ModalProgressHUD(
        inAsyncCall: spinner,
        child: SingleChildScrollView(
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
                            'Product and Business Model Dashboard',
                            style: topHeadingTextStyle,
                            //TextStyle(fontSize: 60),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
//                  SizedBox(
//                    height: 0,
//                  ),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          Icon(Icons.import_contacts),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Our purpose and Who we are',
                                              style: cardTitleTextStyle,
                                              //TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                            ),
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) =>
                                                        CompetitorDialogue(
                                                          descriptionMission: missionText,
                                                          descriptionVision: visionText,
                                                        )
                                                ).then(
                                                        (value) => setState(() {}));
                                              },
                                              child: Icon(Icons.edit)),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      child: SizedBox(
                                        height: 20,
                                      ),
                                    ),
                                    Text(
                                      'Our Mission: $missionText',
                                      style: cardBodyTextStyle,
                                      maxLines: 4,
                                      //TextStyle(fontSize: 18),
                                    ),
                                    Flexible(
                                      child: SizedBox(
                                        height: 20,
                                      ),
                                    ),
                                    Text(
                                      'Our Vision: $visionText           ',
                                      style: cardBodyTextStyle,
                                      maxLines: 4,
                                      //TextStyle(fontSize: 18),
                                    ),
                                    Flexible(
                                      child: SizedBox(
                                        height: 20,
                                      ),
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
                      BufProductDashboard(
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
                      BcMarketStrategy(
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
                      BcMoneyDashboard (
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
                      BcMetricsDashboard(
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
        ),
      ),
    );
  }
}
