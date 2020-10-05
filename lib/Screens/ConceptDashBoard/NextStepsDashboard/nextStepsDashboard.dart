import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/ManagingGrowth/addparallelinnovations.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionValidation/reviewcustomerrequirements.dart';
import 'package:iventure001/Screens/ConceptDashBoard/NextStepsDashboard/parallelDialogue.dart';
import 'package:iventure001/Screens/ConceptDashBoard/NextStepsDashboard/solutionFitDialogue.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/DashboardLayout.dart';
import 'package:iventure001/Screens/BUFDashboard/BufDashboardNavigationBloc.dart';

import '../conceptDashboardNavigationBloc.dart';

class nextStepsDashBoard extends StatefulWidget with ConceptDashboardStates, BufDashboardStates {
  final TextStyle headingStyle;
  final CrossAxisAlignment headingAlignment;
  final double sizedboxwidth;
  final double sizedboxheight;

  const nextStepsDashBoard(
      {this.headingStyle,
      this.headingAlignment,
      this.sizedboxwidth,
      this.sizedboxheight});
  @override
  _nextStepsDashBoardState createState() => _nextStepsDashBoardState();
}

DateTime selectedDate;
String date = '';
String ppName = '';
String ppDescription = '';
bool nextstepsspinner = false;

class _nextStepsDashBoardState extends State<nextStepsDashBoard> {
  final _firestore = Firestore.instance;

  void getDocument() async {
    nextstepsspinner = true;
    final reviewdocument = await _firestore
        .collection('$currentUser/SolutionValidation/reviewDate')
        .getDocuments();
//    print("GEt method called");

    for (var reviewmessage in reviewdocument.documents) {
      addRequirementsArray = [];
      final selectedDate = reviewmessage.data['ReviewDate'];
      final ID = reviewmessage.documentID;

      final fields = reviewCustomerrequirements(
          SelectedDate: selectedDate.toDate(), ID: ID);

      addRequirementsArray.add(fields);
    }
    setState(() {
      if (addRequirementsArray.length != 0) {
        selectedDate = addRequirementsArray[0].SelectedDate;
        final df = new DateFormat('dd-MMM-yyyy');
        date = df.format(selectedDate);
      }
    });

    final parallelInnovationsdocument = await _firestore
        .collection('$currentUser/ManagingGrowth/parallelInnovations')
        .getDocuments();
//    print("GEt method called");

    for (var parallelInnovationsmessage
        in parallelInnovationsdocument.documents) {
      AddingNewParallelInnovations = [];
      final Name = parallelInnovationsmessage.data['Name'];
      final Description = parallelInnovationsmessage.data['Description'];
      final CheckedSolution =
          parallelInnovationsmessage.data['CheckedSolution'];
      final ID = parallelInnovationsmessage.documentID;

      final card = addparallelinnovations(
          Name: Name,
          Description: Description,
          CheckedSolution: CheckedSolution,
          ID: ID);
      AddingNewParallelInnovations.add(card);
    }
    setState(() {
      nextstepsspinner = false;
      if (AddingNewParallelInnovations.length != 0) {
        ppName = AddingNewParallelInnovations[0].Name;
        ppDescription = AddingNewParallelInnovations[0].Description;
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
      dashboardTitle: 'Planning the next steps...',
      dashboardcards: <Widget>[
        Padding(
          padding: EdgeInsets.all((MediaQuery.of(context).size.width >= 1400)
              ? 50
              : (MediaQuery.of(context).size.width <= 750) ? 10 : 30),
          child: DashboardCards(
            cardIcon: Icons.rate_review,
            cardTitle: 'Problem-Solution fit review',
            cardNote:
                'The Customer problem always keeps evolving. We need to check back for relevance of problem-solution fit. The date for the next review is : $date',
            cardButtonName: 'RESCHEDULE',
            onTap: () {
              Navigator.pushNamed(context, '/reviewcustomerrequirements');
            },
            onEditTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => solutionFitDialogue(
                  selectedDate: selectedDate,
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
            cardIcon: Icons.next_week,
            cardTitle: 'Parallel Products',
            cardNote:
                'At present, we can think of this additional product concept which can one of the we can think of these parallel innovations which can be of value to our customer base: \n $ppName - $ppDescription',
            cardButtonName: 'REVIEW MORE SUCH SOLUTIONS',
            onTap: () {
              Navigator.pushNamed(context, '/addparallelinnovations');
            },
            onEditTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => parallelDialogue(
                  solutionName: ppName,
                  solutionDescription: ppDescription,
                ),
              ).then((_) => setState(() {}));
            },
          ),
        ),
      ],
    );
  }
}
