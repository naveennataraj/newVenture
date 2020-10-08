import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionFormulation/addCompetingProduct.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionFormulation/addProductFeature.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionIdeation/pickDetails.dart';
import 'package:iventure001/Screens/BUFDashboard/BufDashboardNavigationBloc.dart';
import 'package:iventure001/Screens/ConceptDashBoard/SolutionDashboard/monetizeDialogue.dart';
import 'package:iventure001/Screens/ConceptDashBoard/SolutionDashboard/oneFeatrueDialogue.dart';
import 'package:iventure001/Screens/ConceptDashBoard/SolutionDashboard/twoFeatrueDialogue.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/DashboardLayout.dart';

import '../FeedbackDashboard/feedbackDashboard.dart';
import '../OverviewDashboard/overViewDashboard.dart';
import '../conceptDashboardNavigationBloc.dart';
import 'competitionDialogue.dart';

class solutionDashBoard extends StatefulWidget
    with ConceptDashboardStates, BufDashboardStates {
  final TextStyle headingStyle;
  final CrossAxisAlignment headingAlignment;
  final double sizedboxwidth;
  final double sizedboxheight;
  final bool inConceptDashboard;

  const solutionDashBoard(
      {Key key,
      this.headingStyle,
      this.headingAlignment,
      this.sizedboxwidth,
      this.sizedboxheight,
      this.inConceptDashboard});

  @override
  _solutionDashBoardState createState() => _solutionDashBoardState();
}

String productName = '';
String monetize = '';
String featureName1 = '';
String featureName2 = '';
String features = '';
bool solutionspinner = false;

class _solutionDashBoardState extends State<solutionDashBoard> {
  final _firestore = Firestore.instance;
  void getDocument() async {
    solutionspinner = true;
    final competingProductdocument = await _firestore
        .collection('$currentUser/SolutionFormulation/competingProducts')
        .getDocuments();
//    print("GEt method called");

    for (var competingProductmessage in competingProductdocument.documents) {
      AddingNewCompetingProduct = [];
      final ProductName = competingProductmessage.data['ProductName'];
      final OrgName = competingProductmessage.data['OrgName'];
      final Features = competingProductmessage.data['Features'];
      final CurrentOffering = competingProductmessage.data['CurrentOffering'];
      final ID = competingProductmessage.documentID;

      final card = addCompetingProduct(
          CurrentOffering: CurrentOffering,
          Features: Features,
          OrgName: OrgName,
          ProductName: ProductName,
          ID: ID);
      AddingNewCompetingProduct.add(card);
    }

    setState(() {
      productName = AddingNewCompetingProduct[0].ProductName;
      features = AddingNewCompetingProduct[0].Features;
    });

    solutionspinner = true;
    final productFeaturesdocument = await _firestore
        .collection('$currentUser/SolutionFormulation/productFeatures')
        .getDocuments();
//    print("GEt method called");
    AddingNewProductFeature = [];
    for (var productFeaturesmessage in productFeaturesdocument.documents) {
      final FeatureTitle = productFeaturesmessage.data['FeatureTitle'];
      final FeatureDescription =
          productFeaturesmessage.data['FeatureDescription'];
      final FeatureChecked = productFeaturesmessage.data['FeatureChecked'];
      final FeatureType = productFeaturesmessage.data['FeatureType'];
      final ID = productFeaturesmessage.documentID;

      final card = addProductFeature(
          FeatureTitle: FeatureTitle,
          FeatureDescription: FeatureDescription,
          FeatureChecked: FeatureChecked,
          FeatureType: FeatureType,
          ID: ID);
      AddingNewProductFeature.add(card);
    }

    setState(() {
      solutionspinner = false;
      if (AddingNewProductFeature.length == 1) {
        featureName1 = AddingNewProductFeature[0].FeatureTitle;
      } else {
        featureName1 = AddingNewProductFeature[0].FeatureTitle;
        featureName2 = AddingNewProductFeature[1].FeatureTitle;
      }
    });

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
        event = PickDetailsArray[0].Event;
        pvp = PickDetailsArray[0].PVP;
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
      dashboardTitle: 'Our Solution',
      dashboardcards: <Widget>[
        Padding(
          padding: EdgeInsets.all((MediaQuery.of(context).size.width >= 1400)
              ? 50
              : (MediaQuery.of(context).size.width <= 750) ? 10 : 30),
          child: DashboardCards(
            cardIcon: Icons.leak_add,
            cardTitle: 'What we learnt from our competition',
            cardNote:
                'Our competitor $productName, offers features such as $features',
            cardButtonName: 'REVIEW OTHER COMPETITORS',
            onTap: () {
              Navigator.pushNamed(context, '/currentmarketplayers');
            },
            onEditTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => competitionDialogue(
                  inConceptDashboard: widget.inConceptDashboard,
                  features: features,
                  productName: productName,
                ),
              ).then((_) => setState(() {}));
            },
          ),
        ),
        (AddingNewProductFeature.length >= 2)
            ? Padding(
                padding: EdgeInsets.all(
                    (MediaQuery.of(context).size.width >= 1400)
                        ? 50
                        : (MediaQuery.of(context).size.width <= 750) ? 10 : 30),
                child: DashboardCards(
                  cardIcon: Icons.assignment_returned,
                  cardTitle: 'List of planned features (for the solution)',
                  cardNote:
                      'For the initial release, we plan to include the following features: $featureName1 , $featureName2',
                  cardButtonName: 'VIEW ALL FEATURES',
                  onTap: () {
                    Navigator.pushNamed(context, '/addproductfeatures');
                  },
                  onEditTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => twoFeatureDialogue(
                        inConceptDashboard: widget.inConceptDashboard,
                        featureName1: featureName1,
                        featureName2: featureName2,
                      ),
                    ).then((_) => setState(() {}));
                  },
                ),
              )
            : Padding(
                padding: EdgeInsets.all(
                    (MediaQuery.of(context).size.width >= 1400)
                        ? 50
                        : (MediaQuery.of(context).size.width <= 750) ? 10 : 30),
                child: DashboardCards(
                  cardIcon: Icons.assignment_returned,
                  cardTitle: 'List of planned features (for the solution)',
                  cardNote:
                      'For the initial release, we plan to include the following features: $featureName1',
                  cardButtonName: 'VIEW ALL FEATURES',
                  onTap: () {
                    Navigator.pushNamed(context, '/addproductfeatures');
                  },
                  onEditTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => oneFeatureDialogue(
                        inConceptDashboard: widget.inConceptDashboard,
                        featureName1: featureName1,
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
            cardIcon: Icons.attach_money,
            cardTitle: 'How we make money',
            cardNote:
                '$monetize. This strategy will be integrated into the early desings of the solution.',
            onTap: () {},
            onEditTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => monetizeDialogue(
                  inConceptDashboard: widget.inConceptDashboard,
                  monetize: monetize,
                ),
              ).then((_) => setState(() {}));
            },
          ),
        ),
      ],
    );
  }
}
