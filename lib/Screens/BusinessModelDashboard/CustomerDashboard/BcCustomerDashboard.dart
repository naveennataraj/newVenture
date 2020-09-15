import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/DashboardLayout.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/BusinessModelDashboadBloc.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step4_UniqueSellingProposition/BcSellingProposition.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step7_BusinessModelElements/ContentBcElements.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step5_CustomerQuotes/BcAddQuote.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcAddFoundation/ContentBcAddFoundation.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step9_ManagingGrowth/ContentParallelSolution.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step2_StudyingTheUser/ContentLink.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/CustomerDashboard/SolutionDialogue.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/CustomerDashboard/QuotesDialogue.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/CustomerDashboard/ParallelDialogue.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/CustomerDashboard/PropositionDialogue.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/CustomerDashboard/ExcelDialogue.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class BcCustomerDashboard extends StatefulWidget with ConceptDashboardStates {
  final TextStyle headingStyle;
  final CrossAxisAlignment headingAlignment;
  final double sizedboxwidth;
  final double sizedboxheight;

  BcCustomerDashboard(
      {this.headingStyle,
      this.sizedboxwidth,
      this.headingAlignment,
      this.sizedboxheight});

  @override
  _BcCustomerDashboardState createState() => _BcCustomerDashboardState();
}

bool spinner = false;

class _BcCustomerDashboardState extends State<BcCustomerDashboard> {
  final _firestore = Firestore.instance;
  //======= What is our Primary Value Proposition? =======
  String valueProposition = '';
  List valuePropositionList = [];
  String propositionID;
  List propositionIDList = [];
  String linkWireframe = '';

//======= How our solution stands out =======
  String solutionStandOut;
  var ID;
//======= Customer Quotes (on using the solution prototype) =======
  String customerQuotes = '';
//======= We excel at =======
  String excelAtDescription = '';
  List excelAtList = [];
  String excelID;
  List excelIDList = [];
//======= Offering Planned  =======
  String offeringPlanned = '';

  // Retrieve data from firebase
  void getDocuments() async {
    //final document = await _firestore.getDocuments();

    //======= What is our Primary Value Proposition? =======
    final documentProposition = await _firestore
        .collection('$currentUser/Bc7_businessModelElements/addElements')
        .getDocuments();
    if (documentProposition != null) {
      addingNewBusinessElement = [];
      for (var message in documentProposition.documents) {
        final elementTitle = message.data['elementTitle'];
        final elementDescription = message.data['elementDescription'];
        final elementChecked = message.data['elementChecked'];
        final ID = message.documentID;

        if (elementTitle == 'Value proposition') {
          valuePropositionList.add(elementDescription);
          propositionIDList.add(ID);
          propositionID =propositionIDList[0];
        }

        final card = ContentBcElements(
          elementTitle: elementTitle,
          elementDescription: elementDescription,
          elementChecked: elementChecked,
          ID: ID,
        );
        addingNewBusinessElement.add(card);
      }
      setState(() {
        spinner = false;
        (addingNewBusinessElement.length != 0)
            ? valueProposition = valuePropositionList[0]
            : valueProposition = 'Missing value';
      });
    }

    // Getting the link
      final documentLink = await _firestore
          .collection(currentUser)
          .document('Bc2_studyingTheUser')
          .get();
      if (documentLink.exists) {
          setState(() {
            linkWireframe = documentLink.data['userProfile'];
            ID = documentLink.documentID;
          });

        final fields =
        AddUserProfileLink(link: linkWireframe, ID: ID);
          userLink.insert(0, fields);
      }



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

    //======= Customer Quotes (on using the solution prototype) =======
    final documentCustomerQuotes = await _firestore
        .collection('$currentUser/Bc5_userFeedback/addQuotes')
        .getDocuments();
    if (documentCustomerQuotes != null) {
      addingNewQuote = [];
      for (var message in documentCustomerQuotes.documents) {
        final content = message.data['content'];
        final checkQuote = message.data['checkQuote'];
        final ID = message.documentID;

        final card = BcAddQuote(
          content: content,
          checkQuote: checkQuote,
          ID: ID,
        );
        addingNewQuote.add(card);
      }
      setState(() {
        if (addingNewQuote.length != 0) {
          customerQuotes = addingNewQuote[0].content;
        } else {
          customerQuotes = 'Missing value';
        }
      });
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
    //======= Offering Planned  =======
    final documentOfferingPlanned = await _firestore
        .collection('$currentUser/Bc9_managingGrowth/addConcepts')
        .getDocuments();
    if (documentOfferingPlanned != null) {
      AddingNewParallelInnovations = [];
      for (var message in documentOfferingPlanned.documents) {
        final Name = message.data['Name'];
        final Description = message.data['Description'];
        final CheckedSolution = message.data['CheckedSolution'];
        final ID = message.documentID;

        final card = ContentParallelSolution(
          Name: Name,
          Description: Description,
          CheckedSolution: CheckedSolution,
          ID: ID,
        );
        AddingNewParallelInnovations.add(card);
      }
      setState(() {
        (AddingNewParallelInnovations.length != 0)
            ? offeringPlanned = AddingNewParallelInnovations[0].Description
            : offeringPlanned = 'Missing value';
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
          child: Hero(
            tag: 'valueProposition',
            child: DashboardCards(
              cardIcon: Icons.new_releases,
              cardTitle: 'What is our Primary Value Proposition?',
              cardNote: '$valueProposition',
              cardButtonName: 'VIEW WIREFRAME',
              onTap: () {
                launch(linkWireframe);
              },
              onEditTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => PropositionDialogue(
                    valueProposition: valueProposition,
                      propositionID: propositionID
                  ),
                ).then((_) => setState(() {}));
              },
            ),
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
        Padding(
          padding: EdgeInsets.all((MediaQuery.of(context).size.width >= 1400)
              ? 50
              : (MediaQuery.of(context).size.width <= 750) ? 10 : 30),
          child: Hero(
            tag: 'CustomerHeroTag',
            child: DashboardCards(
              cardIcon: Icons.person,
              cardTitle: 'Customer Quotes (on using the solution prototype)',
              cardNote: '$customerQuotes',
              cardButtonName: 'VIEW MORE QUOTES',
              onTap: () {
                Navigator.pushNamed(context, '/BCStep5CustomersQuotes');
              },
              onEditTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => CustomerQuotesDialogue(
                    dashboardCard: customerQuotes,
                  ),
                ).then((_) => setState(() {}));
              },
            ),
          ),
        ),
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
            tag: 'ParallelHeroTag',
            child: DashboardCards(
              cardIcon: Icons.trending_up,
              cardTitle: 'Other offerings planned',
              cardNote: '$offeringPlanned',
              cardButtonName: 'REVIEW MORE SUCH OFFERINGS',
              onTap: () {
                Navigator.pushNamed(context, '/BCStep9CreatingEcosystems');
              },
              onEditTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => ParallelDialogue(
                    dashboardCard: offeringPlanned,
                  ),
                ).then((_) => setState(() {}));
              },
            ),
          ),
        )
      ],
    );
  }
}
