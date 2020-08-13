import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcFrameworkData.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';

class BcAddWireframeLink extends StatefulWidget {
  @override
  _BcAddWireframeLinkState createState() => _BcAddWireframeLinkState();
}

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
  Bread(label: "Product Goals", route: '/BCStep3Goals'),
  Bread(label: "Product Features", route: '/BCStep3FeatureProduct'),
  Bread(label: "High Fidelity Wireframes", route: '/BCStep3WireFrameLink'),
];


String ID;

class _BcAddWireframeLinkState extends State<BcAddWireframeLink> {


  bool spinner = false;
  final _firestore = Firestore.instance
      .collection(currentUser)
      .document('Bc3_definingTheSolution');
  String linkWireframe;

  var WireFrameLinklabelColor = Color(0XFF919191);
  bool validWireFrameLink = true;
  var WireFrameLinkTextController = TextEditingController();
  final WireFrameLinkFocusNode = new FocusNode();
  String WireFrameLink;

  void initState() {
    super.initState();
    (linkWireframe == null) ? getDocuments() : print('data exists');
  }

  void getDocuments() async {
    final document = await _firestore.get();

    if (document.exists) {
      try {
        setState(() {
          WireFrameLink = document.data['wireFrameLink'];
          linkWireframe = document.data['wireFrameLink'];
          ID = document.documentID;
          WireFrameLinkTextController.text = WireFrameLink;
        });
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
    return Scaffold(
      backgroundColor: Color(0XFFFAFAFA),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: NavigationBar(),
      ),
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Breadcrumb(breads: breads, color: Color(0xFFE95420),),
                  Container(
                    //height: MediaQuery.of(context).size.height * .40,
                    margin: EdgeInsets.only(top: 40.0),
                    width: MediaQuery.of(context).size.width * .40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            "Adding High Fidelity Wireframes, if we have one handy:",
                            style:
                            TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        NoteCard(
                          Note:
                          "Tip: For the prefered solution concept, a wireframe can be developed using a service such as AdobeXD or Marvel App. The purpose of this is to have the End user(s) interact with it, with the goal of eventually collecting feedback from them. In this section, please add the High Fidelity wireframe of the product concept, which will include details such as colors and graphics and will be representative of the final product that will be shipped to the customer.",
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text('Learn More About Wireframes'),
                        ),
                        TextFieldWidget(
                          labelText:
                          "Please enter the link to the High Fidelity wireframe below",
                          maxLines: 1,
                          validText: validWireFrameLink,
                          myFocusNode: WireFrameLinkFocusNode,
                          myTextController: WireFrameLinkTextController,
                          textCollecter: WireFrameLink,
                          helperText: '',
                          labelcolour: WireFrameLinklabelColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              headBackButtton(),
                              SizedBox(
                                width: 50,
                              ),
                              GenericStepButton(
                                  buttonName: 'COMPLETE STEP 3',
                                  routeName: '/BCHomeView',
                                  step: 2,
                                  stepBool: true,
                                  widget:  futureValue

//                          OnTap: () {
//                            if (linkWireframe !=
//                                WireFrameLinkTextController.text) {
//                              _firestore.setData({
//                                'wireFrameLink':
//                                    WireFrameLinkTextController.text,
//                              });
//                            }
//                            bcStepsContent[2].bcCompletionValidator = true;
//                            Navigator.pushNamed(context, '/BCHomeView');
//                          },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DotsIndicator(
                      decorator: DotsDecorator(
                        activeColor: const Color(0xFFE95420),
                      ),
                      dotsCount: 3,
                      position: 2
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void futureValue() {
    if (linkWireframe != WireFrameLinkTextController.text) {
      _firestore.setData({'wireFrameLink': WireFrameLinkTextController.text,
                              });
                            }
  }

}


