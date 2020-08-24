import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:iventure001/Widgets/HeadBackMenu.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcAddFoundation/ContentBcCollectFoundation.dart';

String customerProblems = '';

class BcStep1CollectionAspects extends StatefulWidget {
  @override
  _BcStep1CollectionAspectsState createState() =>
      _BcStep1CollectionAspectsState();
}

String ID;

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
  Bread(label: "Foundational Aspects", route: '/BCStep1CollectAspects'),
];

class _BcStep1CollectionAspectsState extends State<BcStep1CollectionAspects> {
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

  final _firestore = Firestore.instance
      .collection(currentUser)
      .document('Bc1_buildTheFoundation');
  bool spinner = false;

  //String missionTextFirebase;
  // variables to save mission and vision values
  String fireMissionData;
  String fireVisionData;
  // animation controller
  //AnimationController controller;

  validator() {
    setState(() {
      missionTextController.text.isEmpty
          ? validMission = false
          : validMission = true;
      missionTextController.text.isEmpty
          ? missionLabelColor = Color(0xFFF53E70)
          : missionLabelColor = Color(0xFF919191);
      visionTextController.text.isEmpty
          ? validVision = false
          : validVision = true;
      visionTextController.text.isEmpty
          ? visionLabelColor = Color(0xFFF53E70)
          : visionLabelColor = Color(0xFF919191);
    });
  }

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
          spinner = false;
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
    } else{
      _firestore.collection(currentUser).document('Bc1_buildTheFoundation').setData(
          {}
      );
    }

    final fields = ContentBcStep1CollectionFoundation(
        descriptionMission: missionText,
        descriptionVision: visionText,
        ID: ID);
    collectionBcStep1Content.insert(0, fields);
  }


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
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Breadcrumb(
                breads: breads,
                color: Color(0xFFE95420),
              ),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            "Let's collect some details on the foundational aspects of the business",
                            style: cardTitleTextStyle,
                            //TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                      TextFieldWidget(
                        labelText:
                            'Provide a mission statement for the business venture',
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
                                widget: updateFirebase,
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            GenericStepButton(
                              buttonName: 'GO NEXT',
                              //pageValidation: (missionTextController.text == '') ? true : false,
                              step: 0,
                              stepBool: false,
                              widget:
                                (missionTextController.text == '' ||
                                    visionTextController.text == '' )
                                    ? () {
                                        validator();
                                      }
                                    : () {
                                (missionTextController.text != '' || visionTextController.text != '') ? Navigator.pushNamed(context, '/BCStep1AddDetails'): print('works');

                                  if (fireMissionData != missionTextController.text ||
                                      fireVisionData != visionTextController.text) {
                                    updateFirebase();
                                  }

                                }
                                  //onTap,

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


  void updateFirebase() {
    _firestore.updateData({
      'mission': missionTextController.text,
      'vision': visionTextController.text,
      'Sender': currentUser,
    });
    fireMissionData = missionTextController.text;
    fireVisionData = visionTextController.text;

  }

}
