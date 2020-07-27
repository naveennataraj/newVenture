import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/CardData.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/PreValidation/addEvangelistsAndEarlyAdoptersDialogue.dart';
import 'package:iventure001/Widgets/GoNextButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';

class handlingScale extends StatefulWidget {
  @override
  _handlingScaleState createState() => _handlingScaleState();
}

var MediumlabelColor = Color(0XFF919191);
bool validMedium = true;
var MediumTextController = TextEditingController();
final PersonMedium = new FocusNode();
String Medium;

class _handlingScaleState extends State<handlingScale> {
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
                      "How would we handle scale (as the product grows)",
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
                    validText: validPersonName,
                    myFocusNode: PersonNameFocusNode,
                    myTextController: PersonNameTextController,
                    textCollecter: PersonName,
                    helperText: '',
                    labelcolour: PersonNamelabelColor,
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
                          StepValidator: () {
                            setState(() {
                              bcpData[6].CompletionValidator = false;
                              print(bcpData[6].CompletionValidator);
                            });
                          },
                          routeName: '/addparallelinnovations',
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
