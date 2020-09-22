import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Stu3_DefiningTheSolution/BcWireframeLink.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';


class BcHighFidelityWireframe extends StatefulWidget {
  final List breads;
  final String goNextRoute;
  final int dotsCount;
  final double intPosition;

  BcHighFidelityWireframe({this.breads, this.goNextRoute, this.dotsCount, this.intPosition});
  @override
  _BcHighFidelityWireframeState createState() => _BcHighFidelityWireframeState(breads, goNextRoute, dotsCount, intPosition);
}

class _BcHighFidelityWireframeState extends State<BcHighFidelityWireframe> {
  String ID;
  List breads;
  String goNextRoute;
  int dotsCount;
  double intPosition;
  _BcHighFidelityWireframeState(this.breads, this.goNextRoute, this.dotsCount, this.intPosition);

  bool spinner = false;
  final _firestore = Firestore.instance;
  String linkWireframe;

  var WireFrameLinklabelColor = Color(0XFF919191);
  bool validWireFrameLink = true;
  var WireFrameLinkTextController = TextEditingController();
  final WireFrameLinkFocusNode = new FocusNode();
  String WireFrameLink;

//  void initState() {
//    super.initState();
//    (linkWireframe == null) ? getDocuments() : print('data exists');
//  }

  @override
  void initState() {
    if (currentUser != null) {
      (linkWireframe == null) ? getDocuments() : print('data exists');
    } else {
      _AnimatedFlutterLogoState();
    }
    super.initState();
  }


  void getDocuments() async {
    spinner = true;
    final document = await _firestore.collection(currentUser)
        .document('Bc3_definingTheSolution').get();

    if (document.exists) {
      try {
        setState(() {
          WireFrameLink = document.data['wireFrameLink'];
          linkWireframe = document.data['wireFrameLink'];
          ID = document.documentID;
          WireFrameLinkTextController.text = WireFrameLink;

          addWireframeLinkArray = [];
          final fields = AddWireframeLink(
              wireframeLink: WireFrameLink,
              ID: ID);
          addWireframeLinkArray.insert(0, fields);

        });
      } catch (e) {
        print(e);
      }
    }else{
      _firestore.collection(currentUser).document('Bc3_definingTheSolution').setData(
          {}
      );
    }
    setState(() {
      spinner = false;
    });
  }


  validator() {
    setState(() {
      WireFrameLinkTextController.text.isEmpty
          ? validWireFrameLink = false
          : validWireFrameLink = true;
      WireFrameLinkTextController.text.isEmpty
          ? WireFrameLinklabelColor = Color(0xFFF53E70)
          : WireFrameLinklabelColor = Color(0xFF919191);
    });
  }

  Timer _timer;

  _AnimatedFlutterLogoState() {
    spinner = true;
    _timer = new Timer(const Duration(seconds: 2), () {
      setState(() {
        if (currentUser != null && currentUser != '') {
          getDocuments();
        }
      });
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(children: [
                  Breadcrumb(breads: breads, color: Color(0xFFE95420))
                ],),
              ),
              Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //height: MediaQuery.of(context).size.height * .40,
                          margin: EdgeInsets.only(top: 40.0),
                          width: 600,//MediaQuery.of(context).size.width * .40,
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
                                        buttonName: 'COMPLETE STEP',
                                        //routeName: '/BCHomeView',
                                        step: 2,
                                        stepBool: true,
                                        widget:  (WireFrameLinkTextController.text == '')
                                            ? () {
                                          validator();
                                        }
                                            : () {
                                          (WireFrameLinkTextController.text != '') ? Navigator.pushNamed(context, goNextRoute): {};

                                          if (linkWireframe != WireFrameLinkTextController.text) {
                                            _firestore.collection(currentUser)
                                                .document('Bc3_definingTheSolution').setData({'wireFrameLink': WireFrameLinkTextController.text,
                                            });
                                          }

                                        }

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
                      ],),
                  )
              ),
              SizedBox(
                height: 20,
              ),
              DotsIndicator(
                  decorator: DotsDecorator(
                    activeColor: const Color(0xFFE95420),
                  ),
                  dotsCount: dotsCount,
                  position: intPosition
              ),

            ],
          ),
        ),
      ),
    );
  }
}
