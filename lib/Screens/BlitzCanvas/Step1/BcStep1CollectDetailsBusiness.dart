import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcAddFoundation/ContentBcCollectFoundation.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:iventure001/Widgets/HeadBackMenu.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:iventure001/Widgets/BcFoundationalAspects.dart';

String customerProblems = '';

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
  Bread(label: "Foundational Aspects", route: '/BCStep1CollectAspects'),
];

class BcStep1CollectionAspects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BcFoundationalAspects(
      breads: breads,
      headBackRoute: '/BCHomeView',
      goNextRoute: '/BCStep1AddDetails',
    );
  }
}




//
//class BcStep1CollectionAspects extends StatefulWidget {
//  final bool bifModel;
//  BcStep1CollectionAspects({this.bifModel});
//  @override
//  _BcStep1CollectionAspectsState createState() =>
//      _BcStep1CollectionAspectsState(bifModel);
//}
//
//class _BcStep1CollectionAspectsState extends State<BcStep1CollectionAspects> {
//  bool bifModel;
//  _BcStep1CollectionAspectsState(this.bifModel);
//
//  String ID;
//  List<Bread> breads = [
//    Bread(label: "Home ", route: '/'),
//    Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
//    Bread(label: "Foundational Aspects", route: '/BCStep1CollectAspects'),
//  ];
//
//  List<Bread> breadsBIF = [
//    Bread(label: "Home ", route: '/'),
//    Bread(label: "Blitz Innovation Framework ", route: '/BlitzInnovationFramework'),
//    Bread(label: "Blitz Canvas ", route: '/BIFCanvasFramework'),
//    Bread(label: "Foundational Aspects", route: '/BCStep1CollectAspects'),
//  ];
//
//
//  var missionLabelColor = Color(0XFF919191);
//  bool validMission = true;
//  var missionTextController = TextEditingController();
//  final missionFocusNode = new FocusNode();
//  String missionText;
//
//  var visionLabelColor = Color(0XFF919191);
//  bool validVision = true;
//  var visionTextController = TextEditingController();
//  final visionFocusNode = new FocusNode();
//  String visionText;
//
//  final _firestore = Firestore.instance
//      .collection(currentUser)
//      .document('Bc1_buildTheFoundation');
//  bool spinner = false;
//
//  //String missionTextFirebase;
//  // variables to save mission and vision values
//  String fireMissionData;
//  String fireVisionData;
//  // animation controller
//  //AnimationController controller;
//
//  validator() {
//    setState(() {
//      missionTextController.text.isEmpty
//          ? validMission = false
//          : validMission = true;
//      missionTextController.text.isEmpty
//          ? missionLabelColor = Color(0xFFF53E70)
//          : missionLabelColor = Color(0xFF919191);
//      visionTextController.text.isEmpty
//          ? validVision = false
//          : validVision = true;
//      visionTextController.text.isEmpty
//          ? visionLabelColor = Color(0xFFF53E70)
//          : visionLabelColor = Color(0xFF919191);
//    });
//  }
//
//  void initState() {
//    super.initState();
//    getDocuments();
//    print('step1$bifModel');
//  }
//
//  void getDocuments() async {
//    spinner = true;
//    final document = await _firestore.get();
//
//    if (document.exists) {
//      missionText = document.data['mission'];
//      visionText = document.data['vision'];
//      fireMissionData = document.data['mission'];
//      fireVisionData = document.data['vision'];
//      ID = document.documentID;
//      missionTextController.text = missionText;
//      visionTextController.text = visionText;
//
//      final fields = ContentBcStep1CollectionFoundation(
//          descriptionMission: missionText,
//          descriptionVision: visionText,
//          ID: ID);
//      collectionBcStep1Content.insert(0, fields);
//
//      setState(() {
//        spinner = false;
//        if (collectionBcStep1Content.length != 0) {
//          missionTextController =
//              TextEditingController(text: collectionBcStep1Content[0].descriptionMission);
//          visionTextController =
//              TextEditingController(text: collectionBcStep1Content[0].descriptionVision);
////          ImportanceTextController =
////              TextEditingController(text: ProblemStudyArray[0].importance);
//        }
//        });
//
//    } else{
//      _firestore.collection(currentUser).document('Bc1_buildTheFoundation').setData(
//          {}
//      );
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Color(0XFFFAFAFA),
//      appBar: PreferredSize(
//        preferredSize: Size.fromHeight(60.0),
//        child: NavigationBar(),
//      ),
//      body: ModalProgressHUD(
//        inAsyncCall: spinner,
//        child: SingleChildScrollView(
//          child: Column(
//            children: <Widget>[
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Wrap(
//                  children: [
//                    Breadcrumb(
//                       breads: breads,
//                      color: Color(0xFFE95420),
//                    ),
//                  ],
//                ),
//              ),
//              Center(
//                child: Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: [
//                      Container(
//                        margin: EdgeInsets.only(top: 40.0),
//                        width: 600,
//                        decoration: BoxDecoration(
//                          color: Colors.white,
//                          boxShadow: [
//                            BoxShadow(
//                              color: Colors.grey,
//                              offset: Offset(0.0, 1.0), //(x,y)
//                              blurRadius: 2.0,
//                            ),
//                          ],
//                        ),
//                        child: Column(
//                          children: <Widget>[
//                            Padding(
//                                padding: EdgeInsets.symmetric(vertical: 10.0),
//                                child: Text(
//                                  "Let's collect some details on the foundational aspects of the business",
//                                  style: cardTitleTextStyle,
//                                  //TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                                  textAlign: TextAlign.center,
//                                )),
//                            TextFieldWidget(
//                              labelText:
//                              'Provide a mission statement for the business venture',
//                              myTextController: missionTextController,
//                              myFocusNode: missionFocusNode,
//                              validText: validMission,
//                              maxLines: 3,
//                              textCollecter: missionText,
//                              helperText: '',
//                              labelcolour: missionLabelColor,
//                            ),
//                            TextFieldWidget(
//                              labelText:
//                              'Provide a vision for the business venture to work towards',
//                              myTextController: visionTextController,
//                              myFocusNode: visionFocusNode,
//                              validText: validVision,
//                              maxLines: 3,
//                              textCollecter: visionText,
//                              helperText: '',
//                              labelcolour: visionLabelColor,
//                            ),
//                            Padding(
//                              padding: const EdgeInsets.all(30.0),
//                              child: Row(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: [
//                                  headBackButtton(
//                                    routeName: '/BCHomeView',
//                                    widget: updateFirebase,
//                                  ),
//                                  SizedBox(
//                                    width: 50,
//                                  ),
//                                  GenericStepButton(
//
//                                      buttonName: 'GO NEXT',
//                                      //pageValidation: (missionTextController.text == '') ? true : false,
//                                      step: 0,
//                                      stepBool: false,
//                                      widget:
//                                      (missionTextController.text == '' ||
//                                          visionTextController.text == '' )
//                                          ? () {
//                                        validator();
//                                      }
//                                          : () {
//                                        (missionTextController.text != '' && visionTextController.text != '') ? Navigator.pushNamed(context, '/BCStep1AddDetails'): print('works');
//
//                                        if (fireMissionData != missionTextController.text ||
//                                            fireVisionData != visionTextController.text) {
//                                          updateFirebase();
//                                        }
//
//                                      }
//                                  ),
//                                ],
//                              ),
//                            )
//                          ],
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//              SizedBox(
//                height: 20,
//              ),
//              DotsIndicator(
//                decorator: DotsDecorator(
//                  activeColor: const Color(0xFFE95420),
//                ),
//                dotsCount: 2,
//                position: 0,
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//
//
//  void updateFirebase() {
//    _firestore.updateData({
//      'mission': missionTextController.text,
//      'vision': visionTextController.text,
//      'Sender': currentUser,
//    });
//    fireMissionData = missionTextController.text;
//    fireVisionData = visionTextController.text;
//
//  }
//
//}
