import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/DashboardLayout.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step4_UniqueSellingProposition/BcSellingProposition.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcAddFoundation/ContentBcAddFoundation.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/CustomerDashboard/SolutionDialogue.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/CustomerDashboard/ExcelDialogue.dart';
import 'package:iventure001/Screens/BUFDashboard/BufDashboardNavigationBloc.dart';
import 'dart:async';

class BufProductDashboard extends StatefulWidget with BufDashboardStates {
  final TextStyle headingStyle;
  final CrossAxisAlignment headingAlignment;
  final double sizedboxwidth;
  final double sizedboxheight;

  BufProductDashboard(
      {this.headingStyle,
        this.sizedboxwidth,
        this.headingAlignment,
        this.sizedboxheight});
  @override
  _BufProductDashboardState createState() => _BufProductDashboardState();
}

bool spinner = false;

class _BufProductDashboardState extends State<BufProductDashboard> {
  final _firestore = Firestore.instance;

//======= How our solution stands out =======
  String solutionStandOut;
  var ID;

//======= We excel at =======
  String excelAtDescription = '';
  List excelAtList = [];
  String excelID;
  List excelIDList = [];

  // Retrieve data from firebase
  void getDocuments() async {
    //final document = await _firestore.getDocuments();

    //======= How our solution stands out =======
    if (sellingPropositionArray.length != 0) {
      String propositionValidation = sellingPropositionArray[0].proposition;
      if (solutionStandOut == propositionValidation) {
        solutionStandOut = sellingPropositionArray[0].proposition;
      } else {
        final documentSolution = await _firestore
            .collection(currentUser)
            .document('Bc4_uniqueSellingProposition')
            .get();
        if (documentSolution.exists) {
          try {
            setState(() {
              solutionStandOut = documentSolution.data['proposition'];
              ID = documentSolution.documentID;
            });
          } catch (e) {
            print(e);
          }
          final fields =
          BcSellingProposition(proposition: solutionStandOut, ID: ID);
          sellingPropositionArray.insert(0, fields);
        }
      }
    } else {
      final documentSolution = await _firestore
          .collection(currentUser)
          .document('Bc4_uniqueSellingProposition')
          .get();
      if (documentSolution.exists) {
        try {
          setState(() {
            spinner = false;
            solutionStandOut = documentSolution.data['proposition'];
            ID = documentSolution.documentID;
          });
        } catch (e) {
          print(e);
        }
        final fields =
        BcSellingProposition(proposition: solutionStandOut, ID: ID);
        sellingPropositionArray.insert(0, fields);
      }
    }

    //======= We excel at =======
    final documentExcelAt = await _firestore
        .collection('$currentUser/Bc1_buildTheFoundation/addFoundations')
        .getDocuments();
    if (documentExcelAt != null) {
      foundationContent = [];
      for (var message in documentExcelAt.documents) {
        final title = message.data['title'];
        final description = message.data['description'];
        final featureType = message.data['featureType'];
        final ID = message.documentID;

        if (title == 'Core competence') {
          excelAtList.add(description);
          excelIDList.add(ID);
          excelID = excelIDList[0];

        }

        final card = ContentBcAddFoundation(
          title: title,
          description: description,
          featureType: featureType,
          ID: ID,
        );
        foundationContent.add(card);
      }
      setState(() {
        (excelAtList.length != 0)
            ? excelAtDescription = excelAtList[0]
            : excelAtDescription = 'Missing value';

      });
    }
  }

  final missingText = Text(
    'Missing value',
    style: TextStyle(
      fontSize: 15,
      fontFamily: 'OpenSans',
      color: Colors.red,
    ),
  );

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
      dashboardTitle: 'Why our product matters to the customer:',
      dashboardcards: <Widget>[
        Padding(
          padding: EdgeInsets.all((MediaQuery.of(context).size.width >= 1400)
              ? 50
              : (MediaQuery.of(context).size.width <= 750) ? 10 : 30),
          child: DashboardCards(
            cardIcon: Icons.vpn_key,
            cardTitle: 'We excel at:',
            cardNote: '$excelAtDescription',
            cardButtonName: 'VIEW FOUNDATIONAL DETAILS',
            onTap: () {
              Navigator.pushNamed(context, '/BCStep1AddDetails');
            },
            onEditTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => ExcelDialogue(
                  excelAt: excelAtDescription,
                  excelAtID: excelID,
                ),
              ).then((_) => setState(() {}));
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all((MediaQuery.of(context).size.width >= 1400)
              ? 50
              : (MediaQuery.of(context).size.width <= 750) ? 10 : 30),
          child: Hero(
            tag: 'solutionStandsOut',
            child: DashboardCards(
              cardIcon: Icons.call_split,
              cardTitle: 'How our solution stands out',
              cardNote: '$solutionStandOut',
              onTap: () {},
              onEditTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => SolutionStandsDialogue(
                    dashboardCard: solutionStandOut,
                  ),
                ).then((_) => setState(() {}));
              },
            ),
          ),
        ),
      ],
    );
  }
}
