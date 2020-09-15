import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/DashboardLayout.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step7_BusinessModelElements/ContentBcIntellectualAssets.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/BusinessModelDashboadBloc.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step9_ManagingGrowth/ContentBusinessGrowth.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/CapitalDashboard/IpDialogue.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/CapitalDashboard/GrowthDialogue.dart';

class BcMoneyDashboard extends StatefulWidget with ConceptDashboardStates {
  final TextStyle headingStyle;
  final CrossAxisAlignment headingAlignment;
  final double sizedboxwidth;
  final double sizedboxheight;

  BcMoneyDashboard(
      {this.headingStyle,
      this.sizedboxwidth,
      this.headingAlignment,
      this.sizedboxheight});

  @override
  _BcMoneyDashboardState createState() => _BcMoneyDashboardState();
}

class _BcMoneyDashboardState extends State<BcMoneyDashboard> {
  final _firestore = Firestore.instance;

//  void initState() {
//    super.initState();
//    getDocuments();
//  }
  //======= IP Properties =======
  String ipProperties = '';
  //======= Handle Growth =======
  String handleGrowth;

  void getDocuments() async {
    //======= Make Money =======

    //======= IP Properties =======
    final documentIpProperties = await _firestore
        .collection(
            '$currentUser/Bc7_businessModelElements/addIntellectualProperties')
        .getDocuments();
    if (documentIpProperties != null) {
      addingIntellectualAssets = [];
      for (var message in documentIpProperties.documents) {
        final intellectualProperty = message.data['intellectualProperty'];
        final intellectualCode = message.data['intellectualCode'];
        final intellectualDetails = message.data['intellectualDetails'];
        final ID = message.documentID;

        final card = ContentBcIntellectualAssets(
          intellectualProperty: intellectualProperty,
          intellectualCode: intellectualCode,
          intellectualDetails: intellectualDetails,
          ID: ID,
        );
        addingIntellectualAssets.add(card);
      }
      setState(() {
        (addingIntellectualAssets.length != 0)
            ? ipProperties = addingIntellectualAssets[0].intellectualCode
            : ipProperties = 'Missing value';
      });
    }

    //======= Handle Growth =======
    final documentHandleGrowth = await _firestore
        .collection(currentUser)
        .document('Bc9_managingGrowth')
        .get();
    if (documentHandleGrowth.exists) {
      businessGrowthContent = [];
      final handleScaleLText = documentHandleGrowth.data['handleScaleLText'];
      final selectedStrategyOption =
          documentHandleGrowth.data['selectedStrategyOption'];
      final ID = documentHandleGrowth.documentID;

      final fields = ContentBusinessGrowth(
          handleScaleLText: handleScaleLText,
          selectedStrategyOption: selectedStrategyOption,
          ID: ID);
      businessGrowthContent.insert(0, fields);

      setState(() {
        handleGrowth = businessGrowthContent[0].handleScaleLText;
      });
    }
  }

  // Refresh
  @override
  void initState() {
    if (currentUser != null) {
      getDocuments();
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
          getDocuments();
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
      dashboardTitle: 'How we make money and manage capital:',
      dashboardcards: <Widget>[
        Padding(
          padding: EdgeInsets.all((MediaQuery.of(context).size.width >= 1400)
              ? 50
              : (MediaQuery.of(context).size.width <= 750) ? 10 : 30),
          child: DashboardCards(
            cardIcon: Icons.attach_money,
            cardTitle: 'How we make money.',
            cardNote:
                'We plan to monetize this innovation via advertising. This strategy will be integrated into the early desings of the solution.',
            onTap: () {},
          ),
        ),
        Padding(
          padding: EdgeInsets.all((MediaQuery.of(context).size.width >= 1400)
              ? 50
              : (MediaQuery.of(context).size.width <= 750) ? 10 : 30),
          child: DashboardCards(
            cardIcon: Icons.folder_special,
            cardTitle: 'IP Properties',
            cardNote: '$ipProperties',
            cardButtonName: 'VIEW ALL IP PROPERTIES',
            onTap: () {
              Navigator.pushNamed(context, '/BCStep7IntellectualAssets');
            },
            onEditTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => IpDialogue(
                  dashboardCard: ipProperties,
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
            cardIcon: Icons.rate_review,
            cardTitle: 'How we handle Growth',
            cardNote: '$handleGrowth',
            onTap: () {},
            onEditTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => GrowthDialogue(
                  dashboardCard: handleGrowth,
                ),
              ).then((_) => setState(() {}));
            },
          ),
        ),
      ],
    );
  }
}
