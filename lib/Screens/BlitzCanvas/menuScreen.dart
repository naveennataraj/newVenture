import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/ContentFrameworkMenu.dart';
import 'package:iventure001/Widgets/BCanvasIntroCard.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/BCStepCard.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcFrameworkData.dart';
import 'package:iventure001/Widgets/FrameworkCards.dart';

const userUid = "tester@gmail.com";
String ID;

class BCScreen extends StatefulWidget {
  @override
  _BCScreenState createState() => _BCScreenState();
}



class _BCScreenState extends State<BCScreen> {
  //final _firestore = Firestore.instance;
  final _firestore = Firestore.instance
      .collection(userUid)
      .document('stepValidation');
  int count = 0;


  @override
  void initState() {
    super.initState();
    getDocuments();
  }


  void getDocuments() async {
    final document = await _firestore.get();

    if (document.exists) {
      try {
        setState(() {
          bcStepsContent[0].bcCompletionValidator = document.data['bcStepsContent0'];
          bcStepsContent[1].bcCompletionValidator = document.data['bcStepsContent1'];
          bcStepsContent[2].bcCompletionValidator = document.data['bcStepsContent2'];
          bcStepsContent[3].bcCompletionValidator = document.data['bcStepsContent3'];
          bcStepsContent[4].bcCompletionValidator = document.data['bcStepsContent4'];
          bcStepsContent[5].bcCompletionValidator = document.data['bcStepsContent5'];
          bcStepsContent[6].bcCompletionValidator = document.data['bcStepsContent6'];
          bcStepsContent[7].bcCompletionValidator = document.data['bcStepsContent7'];
          bcStepsContent[8].bcCompletionValidator = document.data['bcStepsContent8'];
          bcStepsContent[9].bcCompletionValidator = document.data['bcStepsContent9'];

          ID = document.documentID;
        });
      } catch (e) {
        print(e);
      }

    }
  }

  @override
  Widget build(BuildContext context) {
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
              //distance from the bar to the tittle
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Blitz Canvas',
                  style: TextStyle(fontSize: 60),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BCanvasIntroCard(menuContents[1]),
              SizedBox(height:40.0),
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: GridView.builder(
                  shrinkWrap: true,
                  //physics: NeverScrollableScrollPhysics(),
                  itemCount: bcStepsContent.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 1.5,
                      crossAxisSpacing: 1.5,
                      childAspectRatio: 2.5,
//                      mainAxisSpacing: 15,
//                      crossAxisSpacing: 1,
//                      childAspectRatio: 1.5,
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
//
                    return FrameworkCards(
                        stepCompleteValidator:
                        bcStepsContent[index].bcCompletionValidator,
                        //completeStep1: completeStep1,
                        frameworkicon: bcStepsContent[index].frameWorkIcon,
                        frameworkStep: bcStepsContent[index].frameworkStep,
                        frameworkdescrip: bcStepsContent[index].frameWorkDescription,
                        buttonText: bcStepsContent[index].buttonText,
                        navigateTo: bcStepsContent[index].navigateTo);
                  },
                ),
              ),
              SizedBox(height:20.0),
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
      child: Icon(Icons.check, color: Colors.grey,),
    );
  }
}

