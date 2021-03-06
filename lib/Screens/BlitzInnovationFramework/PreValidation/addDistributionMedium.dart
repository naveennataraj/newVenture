import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/PreValidation/addDistributionMedium.dart';
import 'package:iventure001/Data/CardData.dart';
import 'package:iventure001/Widgets/GenericStepValidationButtonBIF.dart';
import 'package:iventure001/Widgets/HeadBackMenu.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AddDistributionMedium extends StatefulWidget {
  @override
  _AddDistributionMediumState createState() => _AddDistributionMediumState();
}

class _AddDistributionMediumState extends State<AddDistributionMedium> {
  List<Bread> breads = [
    Bread(label: "Home ", route: '/'),
    Bread(
        label: "Blitz Innovation Framework ",
        route: '/BlitzInnovationFramework'),
    Bread(
        label: "Add Evangelists and Early Adopters ",
        route: '/addevangelistsandearlyadopters'),
    Bread(label: "Add Distribution Medium ", route: '/adddistributionmedium'),
  ];

  bool spinner = false;
  final _firestore = Firestore.instance;

  var MediumlabelColor = Color(0XFF919191);
  bool validMedium = true;
  var MediumTextController = TextEditingController();
  final MediumFocus = new FocusNode();
  String Medium;

  validator() {
    setState(() {
      MediumTextController.text.isEmpty
          ? validMedium = false
          : validMedium = true;
      MediumTextController.text.isEmpty
          ? MediumlabelColor = Color(0xFFF53E70)
          : MediumlabelColor = Color(0xFF919191);
    });
  }

  void getDocument() async {
    spinner = true;
    final document = await _firestore
        .collection('$currentUser/PreValidation/addMedium')
        .getDocuments();
//    print("GEt method called");

    for (var message in document.documents) {
      addMediumArray = [];
      final Medium = message.data['Medium'];
      final ID = message.documentID;

      final fields = addDistributionMedium(medium: Medium, ID: ID);

      addMediumArray.add(fields);
    }
    setState(() {
      spinner = false;
      if (addMediumArray.length != 0) {
        MediumTextController =
            TextEditingController(text: addMediumArray[0].medium);
      }
    });
  }

  update() {
    print("Update method called");
    _firestore
        .collection('$currentUser/PreValidation/addMedium')
        .document(addMediumArray[0].ID)
        .updateData({
      'Medium': MediumTextController.text,
      'Sender': currentUser,
    });
  }

  add() {
    print("add method called");
    _firestore.collection('$currentUser/PreValidation/addMedium').add({
      'Medium': MediumTextController.text,
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
                              "What medium will we be using to share the product concept?",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          TextFieldWidget(
                            labelText:
                                "What medium would you choose to share the wireframes with users?",
                            maxLines: 1,
                            validText: validMedium,
                            myFocusNode: MediumFocus,
                            myTextController: MediumTextController,
                            textCollecter: Medium,
                            helperText:
                                ' *An appropriate medium, if selected will help the early adopters and other users with quicker access to the solution concept\nand subsequently provide feedback more quickly',
                            labelcolour: MediumlabelColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                headBackButtton(
                                  routeName: '/addevangelistsandearlyadopters',
                                ),
                                SizedBox(
                                  width: 50,
                                ),
//                                CompleteStepButton(
//                                  OnTap: (MediumTextController.text == '')
//                                      ? () {
//                                          validator();
//                                        }
//                                      : () {
//                                          if (addMediumArray.length != 0) {
//                                            update();
//                                          } else {
//                                            add();
//                                          }
//                                          bcpData[4].CompletionValidator = true;
//                                          print(bcpData[4].CompletionValidator);
//                                          Navigator.pushNamed(context,
//                                              '/BlitzInnovationFramework');
//                                        },
//                                ),
                                GenericStepButtonBIF(
                                  buttonName: 'COMPLETE STEP',
//                                    routeName: '/addpainpoints',
                                  step: 4,
                                  stepBool: true,
                                  widget: (MediumTextController.text == '')
                                      ? () {
                                          validator();
                                        }
                                      : () {
                                          (MediumTextController.text != '')
                                              ? Navigator.pushNamed(context,
                                                  '/BlitzInnovationFramework')
                                              : {};
                                          if (addMediumArray.length != 0) {
                                            update();
                                          } else {
                                            add();
                                          }
                                          bcpData[4].CompletionValidator = true;
                                          print(bcpData[4].CompletionValidator);
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
                      dotsCount: 2,
                      position: 1,
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
