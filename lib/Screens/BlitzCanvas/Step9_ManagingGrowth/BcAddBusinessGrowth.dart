//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/DropDown.dart';
import 'package:iventure001/Widgets/GoNextButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcFrameworkData.dart';

class BcStep9BusinessGrowth extends StatefulWidget {
  @override
  _BcStep9BusinessGrowthState createState() => _BcStep9BusinessGrowthState();
}

var handleScaleLabelColor = Color(0XFF919191);
bool validHandleScale = true;
var handleScaleLTextController = TextEditingController();
final handleScaleLFocusNode = new FocusNode();
String handleScaleLText;

String ID;
const userUid = "tester@gmail.com";

class _BcStep9BusinessGrowthState extends State<BcStep9BusinessGrowth> {
  final _firestore = Firestore.instance.collection(userUid).document('Bc9_managingGrowth');
  String selectedStrategyOption;
  String fireStrategyData;
  String fireOptionSelected;

  @override
  void initState() {
    super.initState();

    if (fireStrategyData == null || fireOptionSelected == null ) {getDocuments();}
    //strategySustainable = buildDropDownMenuItems(StrategySustainableList);
  }


  void getDocuments() async {
    final document = await _firestore.get();

    if (document.exists) {
      try {
        setState(() {
          handleScaleLText = document.data['handleScaleLText'];
          selectedStrategyOption = document.data['selectedStrategyOption'];
          fireStrategyData = document.data['handleScaleLText'];
          fireOptionSelected = document.data['selectedStrategyOption'];
          ID = document.documentID;
          handleScaleLTextController.text = handleScaleLText;
          //visionTextController.text = visionText;
        });
      } catch (e) {
        print(e);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFAFAFA),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: NavigationBar(),
      ),
      body: Center(
        child: Container(
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
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Additional details of Business Growth",
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                    helperText: 'Please provide details on how the scaling aspect of the solution would be handled.\nDetermining this would help the business handle issues associated with a sudden increase or\ndecrease in the usage of the product such as datacenter costs or infrastructure availability',
                    labelcolour: handleScaleLabelColor,
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(width: 1, color: Color(0XFFABABAB)),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
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
                                  color: Color(0XFFE95420),
                                ),
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  //SelectedStrategySustainable = newValue;
                                  selectedStrategyOption = newValue;

                                },);
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
                      ),
                    ),
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
                          OnTap: () {

                            if (fireStrategyData != handleScaleLTextController.text || fireOptionSelected != selectedStrategyOption  ) {
                              _firestore.setData({
                                'handleScaleLText': handleScaleLTextController.text,
                                'selectedStrategyOption': selectedStrategyOption,
                                'Sender': "tester@gmail.com",

                              });
                            }
                            fireOptionSelected = selectedStrategyOption;
                            fireStrategyData= handleScaleLTextController.text;
                            bcStepsContent[8].bcCompletionValidator = false;
//                            print(bcpData[6].CompletionValidator);
                            Navigator.pushNamed(
                                context, '/BCStep9CreatingEcosystems');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
