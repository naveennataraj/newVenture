import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/ContentFrameworkMenu.dart';
import 'package:iventure001/Widgets/BCanvasIntroCard.dart';
import 'package:iventure001/Widgets/BCStepCard.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcFrameworkData.dart';
import 'package:iventure001/Widgets/FrameworkCards.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
// BreadCrumb
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
String ID;


class BIFCanvasFramework extends StatefulWidget {
  @override
  _BIFCanvasFrameworkState createState() => _BIFCanvasFrameworkState();
}


List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(
      label: "Blitz Innovation Framework ",
      route: '/BlitzInnovationFramework'),
  Bread(label: "Blitz Canvas ", route: '/BIFCanvasFramework'),
];
bool spinner = false;

class _BIFCanvasFrameworkState extends State<BIFCanvasFramework> {

  final _firestore = Firestore.instance
      .collection(currentUser)
      .document('stepValidation');

  bool firebaseStep0;
  bool firebaseStep1;
  bool firebaseStep2;
  bool firebaseStep3;
  bool firebaseStep4;
  bool firebaseStep5;
  //bool firebaseStep6;
//  bool firebaseStep7;
//  bool firebaseStep8;
//  bool firebaseStep9;
  //bool firebaseStep;

  @override
  void initState() {
    super.initState();

    if (currentUser != null) {
      getDocuments();
    }

  }

  void getDocuments() async {
    final document = await _firestore.get();
    spinner = true;
//    setState(() {
//      spinner = true;
//    });

    if (document.exists) {
      try {
        firebaseStep0 = document.data['bcStepsContent0'];
        firebaseStep1 = document.data['bcStepsContent2'];
        firebaseStep2 = document.data['bcStepsContent3'];
        firebaseStep3 = document.data['bcStepsContent6'];
        firebaseStep4 = document.data['bcStepsContent7'];
        firebaseStep5 = document.data['bcStepsContent9'];
        //firebaseStep6 = document.data['bcStepsContent6'];
//        firebaseStep7 = document.data['bcStepsContent7'];
//        firebaseStep8 = document.data['bcStepsContent8'];
//        firebaseStep9 = document.data['bcStepsContent9'];

        bifCanvasContent[0].bcCompletionValidator = firebaseStep0;
        bifCanvasContent[1].bcCompletionValidator = firebaseStep1;
        bifCanvasContent[2].bcCompletionValidator = firebaseStep2;
        bifCanvasContent[3].bcCompletionValidator = firebaseStep3;
        bifCanvasContent[4].bcCompletionValidator = firebaseStep4;
        bifCanvasContent[5].bcCompletionValidator = firebaseStep5;
        //bifCanvasContent[6].bcCompletionValidator = firebaseStep6;
//        bcStepsContent[7].bcCompletionValidator = firebaseStep7;
//        bcStepsContent[8].bcCompletionValidator = firebaseStep8;
//        bcStepsContent[9].bcCompletionValidator = firebaseStep9;
        ID = document.documentID;

      } catch (e) {
        print(e);
        setState(() {
          spinner = false;
        });
      }
    }
    setState(() {
      spinner = false;
    });
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
              SizedBox(height:40.0),
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
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: bifCanvasContent.length,
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
                      crossAxisCount: (MediaQuery.of(context).size.width >=
                          1400)
                          ? 3
                          : (MediaQuery.of(context).size.width <= 800) ? 1 : 2
                  ),
                  itemBuilder: (BuildContext context, int index) {


                    return ModalProgressHUD(
                      inAsyncCall: spinner,
                      child: FrameworkCards(
                          stepCompleteValidator:
                          bifCanvasContent[index].bcCompletionValidator,
                          //completeStep1: completeStep1,
                          frameworkicon: bifCanvasContent[index].frameWorkIcon,
                          frameworkStep:  bifCanvasContent[index].frameworkStep,
                          frameworkdescrip: bifCanvasContent[index].frameWorkDescription,
                          buttonText: bifCanvasContent[index].buttonText,
                          navigateTo: bifCanvasContent[index].navigateTo),
                    );
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

//
//class DoneRaisedButton extends StatelessWidget {
////  ReusableRaisedButton({@required this.routeTo, this.textButton});
////  final String routeTo;
////  final String textButton;
//
//  @override
//  Widget build(BuildContext context) {
//    return RaisedButton(
//      elevation: 5,
//      //hoverElevation: 10,
//      color: inactiveBlackColour,
//      onPressed: () {
//        //CHANGE IT
//        //Navigator.pushNamed(context, routeTo);
//      },
//      child: Icon(Icons.check, color: Colors.grey,),
//    );
//  }
//}

