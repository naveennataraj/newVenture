import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcFrameworkData.dart';
import 'package:iventure001/Data/ContentFrameworkMenu.dart';
import 'package:iventure001/Widgets/BCStepCard.dart';
import 'package:iventure001/Widgets/BCanvasIntroCard.dart';
import 'package:iventure001/Widgets/FrameworkCards.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

String ID;

class BCScreen extends StatefulWidget {


  @override
  _BCScreenState createState() => _BCScreenState();
}

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
];

class _BCScreenState extends State<BCScreen> {

  bool spinner = false;
  Timer _timer;

  List<int> bifStepList = [0, 2, 3, 6, 7, 9];
  final _firestore = Firestore.instance;
  int i = 0;
  bool firebaseStep0;
  bool firebaseStep1;
  bool firebaseStep2;
  bool firebaseStep3;
  bool firebaseStep4;
  bool firebaseStep5;
  bool firebaseStep6;
  bool firebaseStep7;
  bool firebaseStep8;
  bool firebaseStep9;
  //bool firebaseStep;

  @override
  void initState() {
    super.initState();

    if (currentUser != null && currentUser != '') {
      getDocuments();
    } else {
      //getFirebaseUser();
      //setState(() {
      _AnimatedFlutterLogoState();
      //});
      //if (currentUser != null && currentUser != '') {getDocuments();}
    }
  }

//  void getFirebaseUser() async {
//print('get firebase canvas');
//    for(int i=0; i>=2;) {
//      FirebaseUser firebaseUserMenu = await FirebaseAuth.instance.currentUser();
//      if (firebaseUserMenu == null) {
//        firebaseUserMenu = await FirebaseAuth.instance.onAuthStateChanged.first;
//        i=0;
//      } else if (firebaseUserMenu.email != null) {
//
//        i=3;
//        setState(() {
//          currentUser = firebaseUserMenu.email;
//          print("----friebase user Canvas --------- $currentUser");
//        });
//      }
//    }
//  }

  _AnimatedFlutterLogoState() {
    _timer = new Timer(const Duration(seconds: 2), () {
      setState(() {
        if (currentUser != null && currentUser != '') {
          getDocuments();
        }
      });
    });
  }

  void getDocuments() async {
    spinner = true;
    final document = await _firestore
        .collection(currentUser)
        .document('stepValidation')
        .get();

//    setState(() {
//      spinner = true;
//    });

    if (document.exists) {
      try {
        firebaseStep0 = document.data['bcStepsContent0'];
        firebaseStep1 = document.data['bcStepsContent1'];
        firebaseStep2 = document.data['bcStepsContent2'];
        firebaseStep3 = document.data['bcStepsContent3'];
        firebaseStep4 = document.data['bcStepsContent4'];
        firebaseStep5 = document.data['bcStepsContent5'];
        firebaseStep6 = document.data['bcStepsContent6'];
        firebaseStep7 = document.data['bcStepsContent7'];
        firebaseStep8 = document.data['bcStepsContent8'];
        firebaseStep9 = document.data['bcStepsContent9'];

        bcStepsContent[0].bcCompletionValidator = firebaseStep0;
        bcStepsContent[1].bcCompletionValidator = firebaseStep1;
        bcStepsContent[2].bcCompletionValidator = firebaseStep2;
        bcStepsContent[3].bcCompletionValidator = firebaseStep3;
        bcStepsContent[4].bcCompletionValidator = firebaseStep4;
        bcStepsContent[5].bcCompletionValidator = firebaseStep5;
        bcStepsContent[6].bcCompletionValidator = firebaseStep6;
        bcStepsContent[7].bcCompletionValidator = firebaseStep7;
        bcStepsContent[8].bcCompletionValidator = firebaseStep8;
        bcStepsContent[9].bcCompletionValidator = firebaseStep9;
        ID = document.documentID;
      } catch (e) {
        print(e);
      }
    }
    setState(() {
      spinner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    //getDocuments();
    return Scaffold(
      appBar: AppBar(
        title: Text('iVENTURE'),
        backgroundColor: Color(0XFFE95420),
      ),
      backgroundColor: Color(0XFFFAFAFA),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Breadcrumb(breads: breads, color: Color(0xFFE95420)),
              //distance from the bar to the tittle
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Blitz Canvas',
                  style: topHeadingTextStyle,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BCanvasIntroCard(menuContents[1]),
              SizedBox(height: 40.0),
              Padding(
                //padding: const EdgeInsets.only(left: 100, right: 100),
                padding: EdgeInsets.only(
                  left: (MediaQuery.of(context).size.width >= 1400)
                      ? 30
                      : (MediaQuery.of(context).size.width <= 750) ? 5 : 10,
                  right: (MediaQuery.of(context).size.width >= 1400)
                      ? 30
                      : (MediaQuery.of(context).size.width <= 750) ? 20 : 30,
                ),
                child:
//                (bifModel == true) // BIF Small Canvas
//                    ? GridView.builder(
//                        shrinkWrap: true,
//                        physics: NeverScrollableScrollPhysics(),
//                        itemCount: bifCanvasContent.length,
//                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                            mainAxisSpacing: 1,
//                            crossAxisSpacing: 1.5,
//                            //childAspectRatio: 2.5,
//                            //crossAxisCount: 3
//                            childAspectRatio:
//                                (MediaQuery.of(context).size.width >= 1400)
//                                    ? 2.3
//                                    : (MediaQuery.of(context).size.width <= 800)
//                                        ? 1.5
//                                        : 1.8,
//                            crossAxisCount:
//                                (MediaQuery.of(context).size.width >= 1400)
//                                    ? 3
//                                    : (MediaQuery.of(context).size.width <= 800)
//                                        ? 1
//                                        : 2),
//                        itemBuilder: (BuildContext context, int index) {
//                          return ModalProgressHUD(
//                            inAsyncCall: spinner,
//                            child: FrameworkCards(
//                                stepCompleteValidator:
//                                bifCanvasContent[index].bcCompletionValidator,
//                                //completeStep1: completeStep1,
//                                frameworkicon:
//                                bifCanvasContent[index].frameWorkIcon,
//                                frameworkStep: 'Step ' +
//                                    (index + 1).toString() +
//                                    bifCanvasContent[index].frameworkStep,
//                                frameworkdescrip:
//                                bifCanvasContent[index].frameWorkDescription,
//                                buttonText: bifCanvasContent[index].buttonText +
//                                    (index + 1).toString(),
//                                navigateTo: bifCanvasContent[index].navigateTo),
//                          );
//                        },
//                      )
//                    :
                GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: bcStepsContent.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 1,
                            crossAxisSpacing: 1.5,
                            //childAspectRatio: 2.5,
                            //crossAxisCount: 3
                            childAspectRatio:
                                (MediaQuery.of(context).size.width >= 1400)
                                    ? 2.3
                                    : (MediaQuery.of(context).size.width <= 800)
                                        ? 1.6
                                        : 1.8,
                            crossAxisCount:
                                (MediaQuery.of(context).size.width >= 1400)
                                    ? 3
                                    : (MediaQuery.of(context).size.width <= 800)
                                        ? 1
                                        : 2),
                        itemBuilder: (BuildContext context, int index) {
                          return ModalProgressHUD(
                            inAsyncCall: spinner,
                            child: FrameworkCards(
                                stepCompleteValidator:
                                    bcStepsContent[index].bcCompletionValidator,
                                //completeStep1: completeStep1,
                                frameworkicon:
                                    bcStepsContent[index].frameWorkIcon,
                                frameworkStep: 'Step ' +
                                    (index + 1).toString() +
                                    bcStepsContent[index].frameworkStep,
                                frameworkdescrip:
                                    bcStepsContent[index].frameWorkDescription,
                                buttonText: bcStepsContent[index].buttonText +
                                    (index + 1).toString(),
                                navigateTo: bcStepsContent[index].navigateTo),
                          );
                        },
                      ),
              ),
              SizedBox(height: 20.0),
//            Row(
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: <Widget>[
//                BcStepCard(bcStepsContent[0]),
//                BcStepCard(bcStepsContent[1]),
//              ],
//            ),
            ],
          ),
        ),
      ),
    );
  }
}

//class BCScreen extends StatelessWidget {
//  final _firestore = Firestore.instance;
//
//
//  //final bool StudyTheProblem;
//
//  //BCScreen({this.StudyTheProblem});
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('iVENTURE'),
//        backgroundColor: Color(0XFFE95420),
//      ),
//      backgroundColor: Color(0XFFFAFAFA),
//      body: SingleChildScrollView(
//        child: Center(
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisSize: MainAxisSize.max,
//            children: <Widget>[
//              //distance from the bar to the tittle
//              SizedBox(height: 20),
//              Padding(
//                padding: const EdgeInsets.all(12.0),
//                child: Text(
//                  'Blitz Canvas',
//                  style: TextStyle(fontSize: 60),
//                ),
//              ),
//              SizedBox(
//                height: 20,
//              ),
//              BCanvasIntroCard(menuContents[1]),
//              SizedBox(height:40.0),
//              Padding(
//                padding: const EdgeInsets.only(left: 100, right: 100),
//                child: GridView.builder(
//                  shrinkWrap: true,
//                  //physics: NeverScrollableScrollPhysics(),
//                  itemCount: bcStepsContent.length,
//                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                      mainAxisSpacing: 1.5,
//                      crossAxisSpacing: 1.5,
//                      childAspectRatio: 2.5,
////                      mainAxisSpacing: 15,
////                      crossAxisSpacing: 1,
////                      childAspectRatio: 1.5,
//                      crossAxisCount: 3),
//                  itemBuilder: (BuildContext context, int index) {
////
//                    return FrameworkCards(
//                        stepCompleteValidator:
//                        bcStepsContent[index].bcCompletionValidator,
//                      //completeStep1: completeStep1,
//                        frameworkicon: bcStepsContent[index].frameWorkIcon,
//                        frameworkStep: bcStepsContent[index].frameworkStep,
//                        frameworkdescrip: bcStepsContent[index].frameWorkDescription,
//                        buttonText: bcStepsContent[index].buttonText,
//                        navigateTo: bcStepsContent[index].navigateTo);
//                  },
//                ),
//              ),
//              SizedBox(height:20.0),
////            Row(
////              crossAxisAlignment: CrossAxisAlignment.center,
////              children: <Widget>[
////                BcStepCard(bcStepsContent[0]),
////                BcStepCard(bcStepsContent[1]),
////              ],
////            ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}

class DoneRaisedButton extends StatelessWidget {
//  ReusableRaisedButton({@required this.routeTo, this.textButton});
//  final String routeTo;
//  final String textButton;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 5,
      //hoverElevation: 10,
      color: inactiveBlackColour,
      onPressed: () {
        //CHANGE IT
        //Navigator.pushNamed(context, routeTo);
      },
      child: Icon(
        Icons.check,
        color: Colors.grey,
      ),
    );
  }
}
