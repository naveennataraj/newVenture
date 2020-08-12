import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:iventure001/Widgets/HeadBackMenu.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcFrameworkData.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';

String customerProblems = '';

class BcStep1CollectionAspects extends StatefulWidget {
  @override
  _BcStep1CollectionAspectsState createState() =>
      _BcStep1CollectionAspectsState();
}

var missionLabelColor = Color(0XFF919191);
bool validMission = true;
final missionTextController = TextEditingController();
final missionFocusNode = new FocusNode();
String missionText;

var visionLabelColor = Color(0XFF919191);
bool validVision = true;
final visionTextController = TextEditingController();
final visionFocusNode = new FocusNode();
String visionText;

String ID;
bool spinner = false;

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
  Bread(label: "Foundational Aspects", route: '/BCStep1CollectAspects'),
];

class _BcStep1CollectionAspectsState extends State<BcStep1CollectionAspects> with SingleTickerProviderStateMixin {
  final _firestore = Firestore.instance.collection(currentUser).document('Bc1_buildTheFoundation');

  //String missionTextFirebase;
  // variables to save mission and vision values
  String fireMissionData;
  String fireVisionData;
  // animation controller
  AnimationController controller;


  void initState() {
    super.initState();
    getDocuments();
  }

  void getDocuments() async {
    spinner = true;
    final document = await _firestore.get();

    if (document.exists) {
      try {
        setState(() {
          missionText = document.data['mission'];
          visionText = document.data['vision'];
          fireMissionData = document.data['mission'];
          fireVisionData = document.data['vision'];
          ID = document.documentID;
          missionTextController.text = missionText;
          visionTextController.text = visionText;
        });
      } catch (e) {
        print(e);
      }
    }

    setState(() {
      spinner = false;
    });

  }

  // validate Mission and vision exists
//  validator() {
//    setState(() {
//      controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
//      missionTextController.text.isEmpty ? validMission = false : validMission = true;
//      missionTextController.text.isEmpty
//          ? missionLabelColor = Color(0xFFF53E70)
//          : missionLabelColor = Color(0xFF919191);
//      print("(Validator is called)");
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFAFAFA),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: NavigationBar(),
      ),
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Center(
          child: Column(
            children: <Widget> [
              Breadcrumb(breads: breads, color: Color(0xFFE95420),),
            Container(
              margin: EdgeInsets.only(top: 40.0),
              width: MediaQuery.of(context).size.width * .40,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 2.0,
                  ),
                ],
              ),

              child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            "Let's collect some details on the foundational aspects of the business",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                      TextFieldWidget(
                        labelText:
                            'Provide a mission statement for the business adventure',
                        myTextController: missionTextController,
                        myFocusNode: missionFocusNode,
                        validText: validMission,
                        maxLines: 1,
                        textCollecter: missionText,
                        helperText: '',
                        labelcolour: missionLabelColor,
                      ),
                      TextFieldWidget(
                        labelText:
                            'Provide a vision for the business venture to work towards',
                        myTextController: visionTextController,
                        myFocusNode: visionFocusNode,
                        validText: validVision,
                        maxLines: 3,
                        textCollecter: visionText,
                        helperText: '',
                        labelcolour: visionLabelColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            headBackButtton(
                              routeName: '/BCHomeView',
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            GenericStepButton(
                              buttonName: 'GO NEXT',
                                routeName: '/BCStep1AddDetails',
                                step: 0,
                                stepBool: false,
                                widget: onTap,

//                          OnTap: () {
//                             if (fireMissionData != missionTextController.text || fireVisionData != visionTextController.text ) {
//                              _firestore.setData({
//                                'mission': missionTextController.text,
//                                'vision': visionTextController.text,
//                                'Sender': "tester@gmail.com",
//                                'updatedAt': timestamp,
//                              });
//                            }
//
//                            bcStepsContent[0].bcCompletionValidator = false;
//                            fireMissionData = missionTextController.text;
//                            fireVisionData = visionTextController.text;
////                            bcpData[6].CompletionValidator = false;
//                            //Navigator.pushNamed(context, '/BCStep1AddDetails');
//                          },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
              ),
            ),
              SizedBox(
                height: 20,
              ),
              DotsIndicator(
                decorator: DotsDecorator(
                  activeColor: const Color(0xFFE95420),
                ),
                dotsCount: 2,
                position: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }


  void onTap() {
    if (fireMissionData != missionTextController.text || fireVisionData != visionTextController.text ) {
      _firestore.setData({
        'mission': missionTextController.text,
        'vision': visionTextController.text,
        'Sender': currentUser,
      });
    }
    fireMissionData = missionTextController.text;
    fireVisionData = visionTextController.text;
  }
}
