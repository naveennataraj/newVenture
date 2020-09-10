import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/StudyTheProblem/problemStudy.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/StudyTheUser/addUserEnvironment.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/StudyTheUser/addUserPersona.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/StudyTheUser/addUserStoriesData.dart';
import 'package:iventure001/Screens/ConceptDashBoard/CustomerDashboard/customerPainPointDialogue.dart';
import 'package:iventure001/Screens/ConceptDashBoard/CustomerDashboard/needOfUsersDialogue.dart';
import 'package:iventure001/Screens/ConceptDashBoard/CustomerDashboard/ourCustomerDialogue.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/DashboardLayout.dart';
import 'package:url_launcher/url_launcher.dart';

import '../conceptDashboardNavigationBloc.dart';

class customerDashBoard extends StatefulWidget with ConceptDashboardStates {
  final TextStyle headingStyle;
  final CrossAxisAlignment headingAlignment;
  final double sizedboxwidth;
  final double sizedboxheight;
  customerDashBoard(
      {this.headingStyle,
      this.sizedboxwidth,
      this.headingAlignment,
      this.sizedboxheight});

  @override
  _customerDashBoardState createState() => _customerDashBoardState();
}

int ageStart = 0;
int ageEnd = 99;
String problemDomain = '';
String problem = '';
String userStory = '';
String personaLink = '';
bool customercard1spinner = false;

class _customerDashBoardState extends State<customerDashBoard> {
  final _firestore = Firestore.instance;

  UserStory(int index) {
    String A = AddingNewUserStory[index].Asa;
    String B = AddingNewUserStory[index].IWantTo;
    String C = AddingNewUserStory[index].SoThat;

    return 'As a $A, I want to $B so that $C';
  }

  void getDocument() async {
    customercard1spinner = true;
    final UserEnvironmentdocument = await _firestore
        .collection('$currentUser/StudyingTheUser/UserEnvironment')
        .getDocuments();
//    print("GEt method called");
    UserEnvironmentArray = [];
    for (var UserEnvironmentmessage in UserEnvironmentdocument.documents) {
      final double Start = UserEnvironmentmessage.data['AgeStart'];
      final double End = UserEnvironmentmessage.data['AgeEnd'];
      final ProblemDropdownValue =
          UserEnvironmentmessage.data['ProblemDropdownValue'];

      final EnvironmentDropdownValue =
          UserEnvironmentmessage.data['EnvironmentDropdownValue'];

      final Issues = UserEnvironmentmessage.data['Issues'];
      final Details = UserEnvironmentmessage.data['Details'];
      final ID = UserEnvironmentmessage.documentID;

      final fields = addUserEnvironment(
          ageRangeStart: Start,
          ageRangeEnd: End,
          ProblemDrop: ProblemDropdownValue,
          EnvironmentDrop: EnvironmentDropdownValue,
          issues: Issues,
          detail: Details,
          ID: ID);

      UserEnvironmentArray.add(fields);
//        print('Get Method called');
    }

    setState(() {
      ageStart = UserEnvironmentArray[0].ageRangeStart.toInt();
      ageEnd = UserEnvironmentArray[0].ageRangeEnd.toInt();
      problemDomain = UserEnvironmentArray[0].ProblemDrop;
    });

    final problemStudydocument = await _firestore
        .collection('$currentUser/StudyTheProblem/problemStudy')
        .getDocuments();
//      print("GEt method called");
    ProblemStudyArray = [];
    for (var problemStudymessage in problemStudydocument.documents) {
      final Title = problemStudymessage.data['Title'];
      final Problem = problemStudymessage.data['Problem'];
      final Importance = problemStudymessage.data['Importance'];
      final ID = problemStudymessage.documentID;

      final fields = problemStudy(
          title: Title, problem: Problem, importance: Importance, ID: ID);

      ProblemStudyArray.add(fields);
    }
    setState(() {
      if (ProblemStudyArray.length != 0) {
        problem = ProblemStudyArray[0].problem;
      }
    });

    final userStorydocument = await _firestore
        .collection('$currentUser/StudyingTheUser/userStory')
        .getDocuments();
//      print("GEt method called");
    AddingNewUserStory = [];
    for (var userStorydocumentmessage in userStorydocument.documents) {
      final Asa = userStorydocumentmessage.data['Asa'];
      final IWantTo = userStorydocumentmessage.data['IWantTo'];
      final SoThat = userStorydocumentmessage.data['SoThat'];
      final ID = userStorydocumentmessage.documentID;

      final card =
          addUserStories(Asa: Asa, IWantTo: IWantTo, SoThat: SoThat, ID: ID);
      AddingNewUserStory.add(card);
    }
    setState(() {
      if (AddingNewUserStory.length != 0) {
        userStory = UserStory(0);
      }
    });

    final document = await _firestore
        .collection('$currentUser/StudyingTheUser/UserPersona')
        .getDocuments();
//    print("GEt method called");
    UserPersonaArray = [];
    for (var message in document.documents) {
      final Link = message.data['Link'];
      final ID = message.documentID;

      final fields = addUserPersona(link: Link, ID: ID);

      UserPersonaArray.add(fields);
//        print('Get Method called');
    }
    setState(() {
      customercard1spinner = false;
      if (UserPersonaArray.length != 0) {
        personaLink = UserPersonaArray[0].link;
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
      dashboardTitle: 'Studying the customer and the problem space',
      dashboardcards: <Widget>[
        Padding(
          padding: EdgeInsets.all((MediaQuery.of(context).size.width >= 1400)
              ? 50
              : (MediaQuery.of(context).size.width <= 750) ? 10 : 30),
          child: Hero(
            tag: 'ourCustomer',
            child: DashboardCards(
              cardIcon: Icons.face,
              cardTitle: 'Who are our customers?',
              cardNote:
                  'Urban dwellers who are employed and aged between $ageStart and $ageEnd years . Solution is aimed at $problemDomain market segment(s).',
              cardButtonName: 'VIEW PERSONA',
              onTap: () {
                launch(personaLink);
              },
              onEditTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => ourCustomerDialogue(
                    ageStart: ageStart,
                    ageEnd: ageEnd,
                    problemDomain: problemDomain,
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
            cardIcon: Icons.person_pin,
            cardTitle: 'Customer Pain Point (Primary)',
            cardNote: problem,
            cardButtonName: 'EXPLORE OTHER PAIN POINTS',
            onTap: () {
              Navigator.pushNamed(context, '/addpainpoints');
            },
            onEditTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => customerPainPointDialogue(
                  problem: problem,
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
            cardIcon: Icons.supervisor_account,
            cardTitle: 'Needs of our user(s)',
            cardNote: userStory,
            cardButtonName: 'VIEW OTHER USER STORIES',
            onTap: () {
              Navigator.pushNamed(context, '/addstoriespainpoints');
            },
            onEditTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => needOfUsersDialogue(
                  Asa: AddingNewUserStory[0].Asa,
                  IwantTo: AddingNewUserStory[0].IWantTo,
                  SothatIcan: AddingNewUserStory[0].SoThat,
                ),
              ).then((_) => setState(() {}));
            },
          ),
        ),
      ],
    );
  }
}
