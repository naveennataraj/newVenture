import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step4_UniqueSellingProposition/BcSellingProposition.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:dots_indicator/dots_indicator.dart';

class BcTouchPoints extends StatefulWidget {
  final List breads;
  final String completeButtonRoute;
  BcTouchPoints({this.breads, this.completeButtonRoute});
  @override
  _BcTouchPointsState createState() => _BcTouchPointsState(breads, completeButtonRoute);
}

class _BcTouchPointsState extends State<BcTouchPoints> {
  List breads;
  String completeButtonRoute;
  _BcTouchPointsState(this.breads, this.completeButtonRoute);

  final _firestore = Firestore.instance;
  bool spinner = false;
  String ID;

  String fireTouchData;
  String fireCapitalizeData;
  String fireGrowthData;

  var keyTouchLabelColor = Color(0XFF919191);
  bool validKeyTitle = true;
  final keyTouchTextController = TextEditingController();
  final keyTouchFocusNode = new FocusNode();
  String keyTouchText;

  var capitalizeLabelColor = Color(0XFF919191);
  bool validCapitalize = true;
  final capitalizeTextController = TextEditingController();
  final capitalizeFocusNode = new FocusNode();
  String capitalizeText;

  var growthLabelColor = Color(0XFF919191);
  bool validGrowth = true;
  final growthTextController = TextEditingController();
  final growthFocusNode = new FocusNode();
  String growthText;

  @override
  void initState() {
    if (currentUser != null) {
      (fireTouchData == null ||
          fireCapitalizeData == null ||
          fireGrowthData == null)
          ? getDocuments()
          : {};
    } else {
      _AnimatedFlutterLogoState();
    }
    super.initState();
  }

//  void initState() {
//    super.initState();
//    (fireTouchData == null ||
//        fireCapitalizeData == null ||
//        fireGrowthData == null)
//        ? getDocuments()
//        : {};
//  }

  void getDocuments() async {
    spinner = true;
    final document = await _firestore.collection(currentUser)
        .document('Bc4_uniqueSellingProposition').get();

    if (document.exists) {
      try {
        setState(() {
          keyTouchText = document.data['keyTouchText'];
          capitalizeText = document.data['capitalizeText'];
          growthText = document.data['growthText'];
          fireTouchData = document.data['keyTouchText'];
          fireCapitalizeData = document.data['capitalizeText'];
          fireGrowthData = document.data['growthText'];
          ID = document.documentID;
          keyTouchTextController.text = keyTouchText;
          capitalizeTextController.text = capitalizeText;
          growthTextController.text = growthText;
        });
      } catch (e) {
        print(e);
      }
      final fields = BcSellingProposition(
          keyTouchText: keyTouchText,
          capitalizeText: capitalizeText,
          growthText: growthText,
          ID: ID);

      sellingPropositionArray.add(fields);
    }
    setState(() {
      spinner = false;
    });
  }

  validator() {
    setState(() {
      keyTouchTextController.text.isEmpty
          ? validKeyTitle = false
          : validKeyTitle = true;
      keyTouchTextController.text.isEmpty
          ? keyTouchLabelColor = Color(0xFFF53E70)
          : keyTouchLabelColor = Color(0xFF919191);
      capitalizeTextController.text.isEmpty
          ? validCapitalize = false
          : validCapitalize = true;
      capitalizeTextController.text.isEmpty
          ? capitalizeLabelColor = Color(0xFFF53E70)
          : capitalizeLabelColor = Color(0xFF919191);
      growthTextController.text.isEmpty
          ? validGrowth = false
          : validGrowth = true;
      growthTextController.text.isEmpty
          ? growthLabelColor = Color(0xFFF53E70)
          : growthLabelColor = Color(0xFF919191);
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
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                                    "The Customer Touchpoints",
                                    style: TextStyle(
                                        fontSize: 22, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  )),
                              TextFieldWidget(
                                labelText:
                                'What is the key touchpoint you wish to capitalize on?',
                                myTextController: keyTouchTextController,
                                myFocusNode: keyTouchFocusNode,
                                validText: validKeyTitle,
                                maxLines: 3,
                                textCollecter: keyTouchText,
                                helperText: '',
                                labelcolour: keyTouchLabelColor,
                              ),
                              TextFieldWidget(
                                labelText:
                                'How do you intend to capitalize on this touchpoint?',
                                myTextController: capitalizeTextController,
                                myFocusNode: capitalizeFocusNode,
                                validText: validCapitalize,
                                maxLines: 3,
                                textCollecter: capitalizeText,
                                helperText: '',
                                labelcolour: capitalizeLabelColor,
                              ),
                              TextFieldWidget(
                                labelText:
                                'How much growth do you expect to be generated by this activity on this touchpoint?',
                                myTextController: growthTextController,
                                myFocusNode: growthFocusNode,
                                validText: validGrowth,
                                maxLines: 3,
                                textCollecter: growthText,
                                helperText: '',
                                labelcolour: growthLabelColor,
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
                                        step: 3,
                                        stepBool: true,
                                        widget:  (keyTouchTextController.text == '' || capitalizeTextController.text == '' || growthTextController.text == '' )
                                            ? () {
                                          validator();
                                        }
                                            : () {
                                          ( keyTouchTextController.text != '' && capitalizeTextController.text != '' &&  growthTextController.text != '') ? Navigator.pushNamed(context, completeButtonRoute): {};

                                          if (fireTouchData != keyTouchTextController.text ||
                                              fireCapitalizeData !=
                                                  capitalizeTextController.text ||
                                              fireGrowthData != growthTextController.text) {
                                            _firestore.collection(currentUser)
                                                .document('Bc4_uniqueSellingProposition').updateData({
                                              'keyTouchText': keyTouchTextController.text,
                                              'capitalizeText': capitalizeTextController.text,
                                              'growthText': growthTextController.text,
                                              'Sender': currentUser,
                                            },);
                                          }

                                        }


                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
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
      ),
    );
  }
}
