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

class _BcCustomerDashboardState extends State<BcCustomerDashboard> {

  final _firestore = Firestore.instance;
  //======= What is our Primary Value Proposition? =======
  String valueProposition= '';
  List valuePropositionList = [];
//======= How our solution stands out =======
  String solutionStandOut;
  String ID;
//======= Customer Quotes (on using the solution prototype) =======
  String customerQuotes = '';
//======= We excel at =======
  String excelAt;
  List excelAtList = [];


  void initState() {
    super.initState();
     getDocuments();
  }



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
        final elementDescription =
        message.data['elementDescription'];
        final elementChecked = message.data['elementChecked'];
        final ID = message.documentID;

        if (elementTitle == 'Value proposition') {
          valuePropositionList.add(elementDescription);
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
        (valuePropositionList.length !=0 || valueProposition != '') ?
        valueProposition= valuePropositionList[0]
            :
        valueProposition= 'Missing value';
      });

    }

    //======= How our solution stands out =======
    if(sellingPropositionArray.length != 0) {
      String propositionValidation = sellingPropositionArray[0].proposition;
      if (solutionStandOut == propositionValidation ) {
        solutionStandOut = sellingPropositionArray[0].proposition;
    } else {
        final documentSolution = await _firestore.collection(currentUser).document('Bc4_uniqueSellingProposition').get();
        if (documentSolution.exists) {
          try {
            setState(() {
              solutionStandOut = documentSolution.data['proposition'];
              ID = documentSolution.documentID;
            });
          } catch (e) {
            print(e);
          }
          final fields = BcSellingProposition(
              proposition: solutionStandOut,
              ID: ID);
          sellingPropositionArray.insert(0,fields);
        }
      }
    } else {
      final documentSolution = await _firestore.collection(currentUser).document('Bc4_uniqueSellingProposition').get();
      if (documentSolution.exists) {
        try {
          setState(() {
            solutionStandOut = documentSolution.data['proposition'];
            ID = documentSolution.documentID;
          });
        } catch (e) {
          print(e);
        }
        final fields = BcSellingProposition(
            proposition: solutionStandOut,
            ID: ID);
        sellingPropositionArray.insert(0,fields);
      }
    }


    //======= Customer Quotes (on using the solution prototype) =======
    final documentCustomerQuotes = await _firestore.collection('$currentUser/Bc5_userFeedback/addQuotes')
        .getDocuments();
    if (documentCustomerQuotes != null) {
      addingNewQuote = [];
      for (var message in documentCustomerQuotes.documents) {
        final content = message.data['content'];
        final checkQuote =
        message.data['checkQuote'];
        final ID = message.documentID;

        final card = BcAddQuote(
          content: content,
          checkQuote: checkQuote,
          ID: ID,
        );
        addingNewQuote.add(card);
        customerQuotes = addingNewQuote.first.content;
      }
      setState(() {
        if (addingNewQuote.length != 0 || customerQuotes != '') {
          customerQuotes = addingNewQuote[0].content;
        } else {
          customerQuotes = 'Missing value';
        }
      });
    }
//    if((addingNewQuote.length != 0)) {
//      customerQuotes = addingNewQuote.first.content;
//    } else {customerQuotes= 'Missing value';}

    //======= We excel at =======
    final documentExcelAt = await _firestore.collection('$currentUser/Bc1_buildTheFoundation/addFoundations')
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
        }

        final card = ContentBcAddFoundation(
          title: title,
          description: description,
          featureType: featureType,
          ID: ID,
        );
        foundationContent.add(card);
      }
    }
  }


  final missingText = Text('Missing value', style: TextStyle(fontSize: 15,
    fontFamily: 'OpenSans',
    color: Colors.red,),);
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
        DashboardCards(
          cardIcon: Icons.new_releases,
          cardTitle: 'What is our Primary Value Proposition?',
          cardNote: '$valueProposition',
          cardButtonName: 'VIEW WIREFRAME',
          onTap: () {},
        ),
        DashboardCards(
          cardIcon: Icons.call_split,
          cardTitle: 'How our solution stands out',
          cardNote:
          '$solutionStandOut',
          onTap: () {},
        ),
        DashboardCards(
          cardIcon: Icons.person,
          cardTitle:
          'Customer Quotes (on using the solution prototype)',
          cardNote: '$customerQuotes',
          cardButtonName: 'VIEW MORE QUOTES',
          onTap: () {},
        ),
        DashboardCards(
          cardIcon: Icons.vpn_key,
          cardTitle: 'We excel at:',
          cardNote:
          'Developing models for prediction based on relevant data',
          cardButtonName: 'VIEW FOUNDATIONAL DETAILS',
          onTap: () {},
        ),
        DashboardCards(
          cardIcon: Icons.trending_up,
          cardTitle:
          'Other offerings planned',
          cardNote:
          'Calendar Sync - Syncs ToDo items with a calendar and allows for meeting scheduling and meeting notes',
          cardButtonName: 'REVIEW MORE SUCH OFFERINGS',
          onTap: () {},
        )
      ],
    );
  }
}
