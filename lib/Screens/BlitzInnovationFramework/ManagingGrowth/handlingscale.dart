import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/ManagingGrowth/handlingScale.dart';
import 'package:iventure001/Data/CardData.dart';
import 'package:iventure001/Widgets/GoNextButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class handlingScale extends StatefulWidget {
  @override
  _handlingScaleState createState() => _handlingScaleState();
}

class _handlingScaleState extends State<handlingScale> {
  List<Bread> breads = [
    Bread(label: "Home ", route: '/'),
    Bread(
        label: "Blitz Innovation Framework ",
        route: '/BlitzInnovationFramework'),
    Bread(label: "Handling Scale ", route: '/handlingscale'),
  ];

  var HandlingScalelabelColor = Color(0XFF919191);
  bool validHandlingScale = true;
  var HandlingScaleTextController = TextEditingController();
  final HandlingScaleFocus = new FocusNode();
  String HandlingScale;

  bool spinner = false;
  final _firestore = Firestore.instance;

  validator() {
    setState(() {
      HandlingScaleTextController.text.isEmpty
          ? validHandlingScale = false
          : validHandlingScale = true;
      HandlingScaleTextController.text.isEmpty
          ? HandlingScalelabelColor = Color(0xFFF53E70)
          : HandlingScalelabelColor = Color(0xFF919191);
    });
  }

  void getDocument() async {
    spinner = true;
    final document = await _firestore
        .collection('$currentUser/ManagingGrowth/handlingScale')
        .getDocuments();
//    print("GEt method called");

    for (var message in document.documents) {
      HandlingScaleArray = [];
      final Scale = message.data['Scale'];
      final ID = message.documentID;

      final fields = addHandlingScale(Scale: Scale, ID: ID);

      HandlingScaleArray.add(fields);
      print('Get Method called');
      print(HandlingScaleArray[0].Scale);
    }
    setState(() {
      spinner = false;

      if (HandlingScaleArray.length != 0) {
        HandlingScaleTextController =
            TextEditingController(text: HandlingScaleArray[0].Scale);
      }
    });
  }

  update() {
    print("Update method called");
    _firestore
        .collection('$currentUser/ManagingGrowth/handlingScale')
        .document(HandlingScaleArray[0].ID)
        .updateData({
      'Scale': HandlingScaleTextController.text,
      'Sender': currentUser,
    });
  }

  add() {
    print("add method called");
    _firestore.collection('$currentUser/ManagingGrowth/handlingScale').add({
      'Scale': HandlingScaleTextController.text,
      'Sender': currentUser,
    });
  }

  @override
  void initState() {
    getDocument();
    super.initState();
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
                              "How would we handle scale (as the product grows)",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          NoteCard(
                              Note:
                                  'Tip: If the product sells well, How would you handle scale?\nA few typical responses include:\n"I intend to use a cloud service provider such as AWS, Firebase or Azure."\n"I intend to hire a team dedicated to handle server infrastructure."\n"I intend to outsource all tasks concerning this matter."'),
                          TextFieldWidget(
                            labelText: "How would you handle scale?",
                            maxLines: 2,
                            validText: validHandlingScale,
                            myFocusNode: HandlingScaleFocus,
                            myTextController: HandlingScaleTextController,
                            textCollecter: HandlingScale,
                            helperText: '',
                            labelcolour: HandlingScalelabelColor,
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
                                goNextButton(
                                  OnTap: (HandlingScaleTextController.text ==
                                          '')
                                      ? () {
                                          validator();
                                        }
                                      : () {
                                          if (HandlingScaleArray.length != 0) {
                                            update();
                                          } else {
                                            add();
                                          }
                                          bcpData[6].CompletionValidator =
                                              false;
                                          print(bcpData[6].CompletionValidator);
                                          Navigator.pushNamed(context,
                                              '/addparallelinnovations');
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
