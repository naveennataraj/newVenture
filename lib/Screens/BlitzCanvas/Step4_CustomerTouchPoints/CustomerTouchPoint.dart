import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import '../../../Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step4_UniqueSellingProposition/BcSellingProposition.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:dots_indicator/dots_indicator.dart';


class BcConsumerTouchPoints extends StatefulWidget {
  @override
  _BcConsumerTouchPointsState createState() => _BcConsumerTouchPointsState();
}

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
  Bread(label: "Solution", route: '/BCStep4SellingProposition'),
  Bread(label: "Customer Touchpoints", route: '/BCStep4ConsumerTouchPoints'),
];

String ID;

class _BcConsumerTouchPointsState extends State<BcConsumerTouchPoints> {
  final _firestore = Firestore.instance
      .collection(currentUser)
      .document('Bc4_uniqueSellingProposition');
  bool spinner = false;

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

  void initState() {
    super.initState();
    (fireTouchData == null ||
            fireCapitalizeData == null ||
            fireGrowthData == null)
        ? getDocuments()
        : print('data exists');
  }

  void getDocuments() async {
    final document = await _firestore.get();

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
                                      buttonName: 'COMPLETE STEP 4',
                                      routeName: '/BCHomeView',
                                      step: 3,
                                      stepBool: true,
                                      widget:  futureValue


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

  void futureValue() {
    if (fireTouchData != keyTouchTextController.text ||
        fireCapitalizeData !=
            capitalizeTextController.text ||
        fireGrowthData != growthTextController.text) {
      _firestore.updateData({
        'keyTouchText': keyTouchTextController.text,
        'capitalizeText': capitalizeTextController.text,
        'growthText': growthTextController.text,
        'Sender': currentUser,
      },);
    }
  }
}
