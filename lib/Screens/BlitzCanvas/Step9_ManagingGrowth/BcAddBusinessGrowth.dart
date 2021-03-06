import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/DropDown.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:iventure001/Widgets/HeadBackMenu.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step9_ManagingGrowth/ContentBusinessGrowth.dart';
import 'package:iventure001/Constants/ResposiveLayout.dart';

class BcStep9BusinessGrowth extends StatefulWidget {
  @override
  _BcStep9BusinessGrowthState createState() => _BcStep9BusinessGrowthState();
}

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
  Bread(label: "Business Growth", route: '/BCStep9Growth'),
];

String ID;

class _BcStep9BusinessGrowthState extends State<BcStep9BusinessGrowth> {
  final _firestore =
      Firestore.instance;
  bool spinner = false;

  String selectedStrategyOption;
  String fireStrategyData;
  String fireOptionSelected;

  var handleScaleLabelColor = Color(0XFF919191);
  bool validHandleScale = true;
  var handleScaleLTextController = TextEditingController();
  final handleScaleLFocusNode = new FocusNode();
  String handleScaleLText;

//  @override
//  void initState() {
//    if (currentUser != null) {
//      if (fireStrategyData == null || fireOptionSelected == null) {
//        getDocuments();
//      } else {
//        _AnimatedFlutterLogoState();
//      }
//      super.initState();
//    }
////    super.initState();
////
////    if (fireStrategyData == null || fireOptionSelected == null) {
////      getDocuments();
////    }
//    //strategySustainable = buildDropDownMenuItems(StrategySustainableList);
//  }

  @override
  void initState() {
    if (currentUser != null) {
      if (fireStrategyData == null || fireOptionSelected == null) {
        getDocuments();
      }
    } else {
      _AnimatedFlutterLogoState();
    }
    super.initState();
  }

  void getDocuments() async {
    spinner = true;
    final document = await _firestore.collection(currentUser).document('Bc9_managingGrowth').get();

    if (document.exists) {
      try {
        setState(() {
          spinner = false;
          handleScaleLText = document.data['handleScaleLText'];
          selectedStrategyOption = document.data['selectedStrategyOption'];
          fireStrategyData = document.data['handleScaleLText'];
          fireOptionSelected = document.data['selectedStrategyOption'];
          ID = document.documentID;
          handleScaleLTextController.text = handleScaleLText;
          //visionTextController.text = visionText;

          final fields = ContentBusinessGrowth(
              handleScaleLText: handleScaleLText,
              selectedStrategyOption: selectedStrategyOption,
              ID: ID);
          businessGrowthContent.insert(0, fields);

        });
      } catch (e) {
        print(e);
      }
    }else{
      _firestore.collection(currentUser).document('Bc9_managingGrowth').setData(
          {}
      );
    }
    setState(() {
      spinner = false;
    });
  }

  var dropBorderColor = Color(0xFFABABAB);
  var dropValuerColor = Color(0xFFE95420);

  validator() {
    setState(() {
      handleScaleLTextController.text.isEmpty
          ? validHandleScale = false
          : validHandleScale = true;
      handleScaleLTextController.text.isEmpty
          ? handleScaleLabelColor = Color(0xFFF53E70)
          : handleScaleLabelColor = Color(0xFF919191);
      (selectedStrategyOption == null)
          ? dropBorderColor = Color(0xFFF53E70)
          : dropBorderColor = Color(0xFFABABAB);
      (selectedStrategyOption == null)
          ? dropValuerColor = Color(0xFFF53E70)
          : dropValuerColor = Color(0xFFE95420);
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
                    children: [
                      Container(
                        //height: MediaQuery.of(context).size.height * .40,
                        margin: EdgeInsets.only(top: 40.0),
                        width: 600, //MediaQuery.of(context).size.width * .40,
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
                                "Additional details of Business Growth",
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
                              validText: validHandleScale,
                              myFocusNode: handleScaleLFocusNode,
                              myTextController: handleScaleLTextController,
                              textCollecter: handleScaleLText,
                              helperText:
                              'Please provide details on how the scaling aspect of the solution would be handled. Determining this would help the business handle issues associated with a sudden increase or\ndecrease in the usage of the product such as datacenter costs or infrastructure availability',
                              labelcolour: handleScaleLabelColor,
                            ),
                            Container(
                              margin: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border:
                                  Border.all(width: 1, color: dropBorderColor),
                                  borderRadius: BorderRadius.all(Radius.circular(5))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:

                                (!ResponsiveLayout.isSmallScreen(context) ?

                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Text(
                                      'Is the currently chosen growth strategy sustainable?',
                                      style: TextStyle(
                                          color: Colors.grey.shade600, fontSize: 16),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: DropdownButton(
                                        hint: Text(
                                          'Choose',
                                          style: TextStyle(
                                            color: dropValuerColor,
                                          ),
                                        ),
                                        onChanged: (newValue) {
                                          setState(
                                                () {
                                              //SelectedStrategySustainable = newValue;
                                              selectedStrategyOption = newValue;
                                            },
                                          );
                                        },
                                        items: StrategyList.map((String singleItem) {
                                          return DropdownMenuItem<String>(
                                              value: singleItem,
                                              child: Text(singleItem));
                                        }).toList(),
                                        //strategySustainable,
                                        value: selectedStrategyOption,
                                        //SelectedStrategySustainable,
                                      ),
                                    ),
                                  ],
                                ) :
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Text(
                                      'Is the currently chosen growth strategy sustainable? ',
                                      style: TextStyle(
                                          color: Colors.grey.shade600, fontSize: 12),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 13),
                                      child: DropdownButton(
                                        hint: Text(
                                          'Choose',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: dropValuerColor,
                                          ),
                                        ),
                                        onChanged: (newValue) {
                                          setState(
                                                () {
                                              //SelectedStrategySustainable = newValue;
                                              selectedStrategyOption = newValue;
                                            },
                                          );
                                        },
                                        items: StrategyList.map((String singleItem) {
                                          return DropdownMenuItem<String>(
                                              value: singleItem,
                                              child: Text(singleItem));
                                        }).toList(),
                                        //strategySustainable,
                                        value: selectedStrategyOption,
                                        //SelectedStrategySustainable,
                                      ),
                                    ),
                                  ],
                                ) )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  headBackButtton(
                                    routeName: '/BCHomeView',
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  GenericStepButton(
                                    buttonName: 'GO NEXT',
                                    //routeName: '/BCStep9CreatingEcosystems',
                                    step: 8,
                                    stepBool: false,
                                    widget: () {

                                      (handleScaleLTextController.text == '')
                                          ?
                                      validator()
                                          :
                                      (handleScaleLTextController.text != '') ? Navigator.pushNamed(context, '/BCStep9CreatingEcosystems'): {};

                                      if (fireStrategyData != handleScaleLTextController.text ||
                                          fireOptionSelected != selectedStrategyOption) {
                                        _firestore.collection(currentUser).document('Bc9_managingGrowth').setData({
                                          'handleScaleLText': handleScaleLTextController.text,
                                          'selectedStrategyOption': selectedStrategyOption,
                                          'Sender': "tester@gmail.com",
                                        });
                                      }
                                      fireOptionSelected = selectedStrategyOption;
                                      fireStrategyData = handleScaleLTextController.text;
                                    }

                                  ),
                                ],
                              ),
                            ),
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
                position: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
