import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionFormulation/addWirframeLink.dart';
import 'package:iventure001/Widgets/GenericStepValidationButtonBIF.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:url_launcher/url_launcher.dart';

class AddWireframeLink extends StatefulWidget {
  @override
  _AddWireframeLinkState createState() => _AddWireframeLinkState();
}

class _AddWireframeLinkState extends State<AddWireframeLink> {
  List<Bread> breads = [
    Bread(label: "Home ", route: '/'),
    Bread(
        label: "Blitz Innovation Framework ",
        route: '/BlitzInnovationFramework'),
    Bread(label: "Add Product Goals ", route: '/addproductgoals'),
    Bread(label: "Add Product Feature ", route: '/addproductfeatures'),
    Bread(label: "Add Competing Products ", route: '/currentmarketplayers'),
    Bread(label: "Add Wireframe Link ", route: '/addwireframelink'),
  ];

  bool spinner = false;
  final _firestore = Firestore.instance;

  var WireFrameLinklabelColor = Color(0XFF919191);
  bool validWireFrameLink = true;
  var WireFrameLinkTextController = TextEditingController();
  final WireFrameLinkFocusNode = new FocusNode();
  String WireFrameLink;

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

  void getDocument() async {
    spinner = true;
    final document = await _firestore
        .collection('$currentUser/SolutionFormulation/addWireframeLink')
        .getDocuments();
//    print("GEt method called");

    for (var message in document.documents) {
      addWireframeLinkArray = [];
      final wireframeLink = message.data['wireframeLink'];
      final ID = message.documentID;

      final fields = addWireframeLink(wireframeLink: wireframeLink, ID: ID);

      addWireframeLinkArray.add(fields);
    }
    setState(() {
      spinner = false;
      if (addWireframeLinkArray.length != 0) {
        WireFrameLinkTextController =
            TextEditingController(text: addWireframeLinkArray[0].wireframeLink);
      }
    });
  }

  update() {
    print("Update method called");
    _firestore
        .collection('$currentUser/SolutionFormulation/addWireframeLink')
        .document(addWireframeLinkArray[0].ID)
        .updateData({
      'wireframeLink': WireFrameLinkTextController.text,
      'Sender': currentUser,
    });
  }

  add() {
    print("add method called");
    _firestore
        .collection('$currentUser/SolutionFormulation/addWireframeLink')
        .add({
      'wireframeLink': WireFrameLinkTextController.text,
      'Sender': currentUser,
    });
  }

  @override
  void initState() {
//    spinner = true;

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
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Breadcrumb(breads: breads, color: Color(0xFFE95420)),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      //height: MediaQuery.of(context).size.height * .40,
                      margin: EdgeInsets.only(top: 40.0),
                      width: 600,
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
                              "Add the link to the Product Wireframe, if we have one handy:",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          NoteCard(
                            Note:
                                "Tip: For the prefered solution concept, a wireframe can be developed using a service such as AdobeXD or Marvel App. The purpose of this is to have the End user(s) interact with it, with the goal of eventually collecting feedback from them.",
                          ),
                          FlatButton(
                            onPressed: () {
                              launch(
                                  ' https://www.smashingmagazine.com/2018/03/guide-wireframing-prototyping/');
                            },
                            child: Text('Learn More About Wireframes'),
                          ),
                          TextFieldWidget(
                            labelText:
                                "If the wireframe is already created, please enter the",
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
                                GenericStepButtonBIF(
                                  buttonName: 'COMPLETE STEP',
//                                    routeName: '/addpainpoints',
                                  step: 3,
                                  stepBool: true,
                                  widget: (WireFrameLinkTextController.text ==
                                          '')
                                      ? () {
                                          validator();
                                        }
                                      : () {
                                          if (addWireframeLinkArray.length !=
                                              0) {
                                            update();
                                          } else {
                                            add();
                                          }
//                                          bcpData[3].CompletionValidator = true;
//                                          print(bcpData[3].CompletionValidator);
                                          (WireFrameLinkTextController.text !=
                                                  '')
                                              ? Navigator.pushNamed(context,
                                                  '/BlitzInnovationFramework')
                                              : {};
                                        },
                                ),
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
                      dotsCount: 4,
                      position: 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
