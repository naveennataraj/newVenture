import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/StudyTheProblem/problemStudy.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/StudyTheUser/addUserEnvironment.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/StudyTheUser/addUserPersona.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/StudyTheUser/addUserStoriesData.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/DashboardLayout.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:url_launcher/url_launcher.dart';

import 'conceptDashboardNavigationBloc.dart';

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

String ageStart = '';
String ageEnd = '';
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
    if (UserEnvironmentArray.length == 0) {
      customercard1spinner = true;
      final UserEnvironmentdocument = await _firestore
          .collection('$currentUser/StudyingTheUser/UserEnvironment')
          .getDocuments();
//    print("GEt method called");

      for (var UserEnvironmentmessage in UserEnvironmentdocument.documents) {
        UserEnvironmentArray = [];
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
        ageStart = UserEnvironmentArray[0].ageRangeStart.toInt().toString();
        ageEnd = UserEnvironmentArray[0].ageRangeEnd.toInt().toString();
        problemDomain = UserEnvironmentArray[0].ProblemDrop;
      });
    }
    if (ProblemStudyArray.length == 0) {
      final problemStudydocument = await _firestore
          .collection('$currentUser/StudyTheProblem/problemStudy')
          .getDocuments();
//      print("GEt method called");

      for (var problemStudymessage in problemStudydocument.documents) {
        ProblemStudyArray = [];
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
    }
    if (AddingNewUserStory.length == 0) {
      final userStorydocument = await _firestore
          .collection('$currentUser/StudyingTheUser/userStory')
          .getDocuments();
      print("GEt method called");

      for (var userStorydocumentmessage in userStorydocument.documents) {
        AddingNewUserStory = [];
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
    }
    if (UserPersonaArray.length == 0) {
      final document = await _firestore
          .collection('$currentUser/StudyingTheUser/UserPersona')
          .getDocuments();
//    print("GEt method called");

      for (var message in document.documents) {
        UserPersonaArray = [];
        final Link = message.data['Link'];
        final ID = message.documentID;

        final fields = addUserPersona(link: Link, ID: ID);

        UserPersonaArray.add(fields);
        print('Get Method called');
      }
      setState(() {
        if (UserPersonaArray.length != 0) {
          personaLink = UserPersonaArray[0].link;
        }
        customercard1spinner = false;
      });
    }
  }

  @override
  void initState() {
    getDocument();
    super.initState();
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
        ModalProgressHUD(
          inAsyncCall: customercard1spinner,
          child: DashboardCards(
            cardIcon: Icons.person,
            cardTitle: 'Who are our customers?',
            cardNote:
                'Urban dwellers who are employed and aged between $ageStart and $ageEnd years . Solution is aimed at $problemDomain market segment(s).',
            cardButtonName: 'VIEW PERSONA',
            onTap: () {
              launch(personaLink);
            },
          ),
        ),
        ModalProgressHUD(
          inAsyncCall: customercard1spinner,
          child: DashboardCards(
            cardIcon: Icons.person,
            cardTitle: 'Customer Pain Point (Primary)',
            cardNote: problem,
            cardButtonName: 'EXPLORE OTHER PAIN POINTS',
            onTap: () {
              Navigator.pushNamed(context, '/addpainpoints');
            },
          ),
        ),
        ModalProgressHUD(
          inAsyncCall: customercard1spinner,
          child: DashboardCards(
            cardIcon: Icons.person,
            cardTitle: 'Needs of our user(s)',
            cardNote: userStory,
            cardButtonName: 'VIEW OTHER USER STORIES',
            onTap: () {
              Navigator.pushNamed(context, '/addstoriespainpoints');
            },
          ),
        ),
      ],
    );
  }
}
