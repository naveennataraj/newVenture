import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/StudyTheUser/addUserPersona.dart';
import 'package:iventure001/Widgets/GenericStepValidationButtonBIF.dart';
import 'package:iventure001/Widgets/HeadBackMenu.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AddUserPersona extends StatefulWidget {
  @override
  _AddUserPersonaState createState() => _AddUserPersonaState();
}

class _AddUserPersonaState extends State<AddUserPersona> {
  List<Bread> breads = [
    Bread(label: "Home ", route: '/'),
    Bread(
        label: "Blitz Innovation Framework ",
        route: '/BlitzInnovationFramework'),
    Bread(label: "Add User Persona ", route: '/adduserpersona'),
  ];

  bool spinner = false;
  final _firestore = Firestore.instance;

  bool validUserPersona = true;
  var UserPersonalabelColor = Color(0XFF919191);
  var UserPersonaTextController = TextEditingController();
  final UserPersonaFocusNode = new FocusNode();
  String UserPersona;

  validator() {
    setState(() {
      UserPersonaTextController.text.isEmpty
          ? validUserPersona = false
          : validUserPersona = true;
      UserPersonaTextController.text.isEmpty
          ? UserPersonalabelColor = Color(0xFFF53E70)
          : UserPersonalabelColor = Color(0xFF919191);
    });
  }

  void getDocument() async {
    spinner = true;
    final document = await _firestore
        .collection('$currentUser/StudyingTheUser/UserPersona')
        .getDocuments();
//    print("GEt method called");

    for (var message in document.documents) {
      UserPersonaArray = [];
      final Link = message.data['Link'];
      final ID = message.documentID;

      final fields = addUserPersona(link: Link, ID: ID);

      UserPersonaArray.add(fields);
      print('Get Method called');
    }
    setState(() {
      spinner = false;

      if (UserPersonaArray.length != 0) {
        UserPersonaTextController =
            TextEditingController(text: UserPersonaArray[0].link);
      }
    });
  }

  update() {
    print("Update method called");
    _firestore
        .collection('$currentUser/StudyingTheUser/UserPersona')
        .document(UserPersonaArray[0].ID)
        .updateData({
      'Link': UserPersonaTextController.text,
      'Sender': currentUser,
    });
  }

  add() {
    print("add method called");
    _firestore.collection('$currentUser/StudyingTheUser/UserPersona').add({
      'Link': UserPersonaTextController.text,
      'Sender': currentUser,
    });
  }

  @override
  void initState() {
    if (demoSelected == true) {
      UserPersonaTextController =
          TextEditingController(text: DemoUserPersonaArray[0].link);
    }
    if (currentUser != null) {
      getDocument();
    } else {
      _AnimatedFlutterLogoState();
    }
    super.initState();
  }

  Timer _timer;

  _AnimatedFlutterLogoState() {
    _timer = new Timer(const Duration(seconds: 1), () {
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
        child: NavigationBar(
          routeName: '/adduserpersona',
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(children: [
                  Breadcrumb(breads: breads, color: Color(0xFFE95420))
                ]),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                'Add details of the foundational aspects of the business',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )),
                          TextFieldWidget(
                            labelText:
                                "Please provide a link to the User's Persona",
                            maxLines: 1,
                            validText: validUserPersona,
                            myFocusNode: UserPersonaFocusNode,
                            myTextController: UserPersonaTextController,
                            textCollecter: UserPersona,
                            helperText: '',
                            labelcolour: UserPersonalabelColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                headBackButtton(
                                  routeName: '/BlitzInnovationFramework',
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                GenericStepButtonBIF(
                                  buttonName: 'GO NEXT',
//                                    routeName: '/addpainpoints',
                                  step: 1,
                                  stepBool: false,
                                  widget: (demoSelected == true)
                                      ? () {
                                          Navigator.pushNamed(context,
                                              '/adduserenvironmentdetails');
                                        }
                                      : (UserPersonaTextController.text == '')
                                          ? () {
                                              validator();
                                            }
                                          : () {
                                              (UserPersonaTextController.text !=
                                                      '')
                                                  ? Navigator.pushNamed(context,
                                                      '/adduserenvironmentdetails')
                                                  : null;
                                              if (UserPersonaArray.length !=
                                                  0) {
                                                update();
                                              } else {
                                                add();
                                              }
//                                          bcpData[1].CompletionValidator =
//                                              false;
                                            },
                                ),
                              ],
                            ),
                          )
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
                      position: 0,
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
