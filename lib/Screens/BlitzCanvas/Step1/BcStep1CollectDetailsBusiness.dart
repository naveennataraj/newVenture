import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/GoNextButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcFrameworkData.dart';

String customerProblems = '';
//bool bcStepValidator;


class BcStep1CollectionAspects extends StatefulWidget {
  @override
  _BcStep1CollectionAspectsState createState() =>
      _BcStep1CollectionAspectsState();
}

var missionLabelColor = Color(0XFF919191);
bool validMission = true;
final missionTextController = TextEditingController();
final missionFocusNode = new FocusNode();
String missionText;

var visionLabelColor = Color(0XFF919191);
bool validVision = true;
final visionTextController = TextEditingController();
final visionFocusNode = new FocusNode();
String visionText;

class _BcStep1CollectionAspectsState extends State<BcStep1CollectionAspects> {

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
                        "Let's collect some details on the foundational aspects of the business",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                  TextFieldWidget(
                    labelText:
                        'Provide a mission statement for the business adventure',
                    myTextController: missionTextController,
                    myFocusNode: missionFocusNode,
                    validText: validMission,
                    maxLines: 1,
                    textCollecter: missionText,
                    helperText: '',
                    labelcolour: missionLabelColor,
                  ),
                  TextFieldWidget(
                    labelText:
                        'Provide a vision for the business venture to work towards',
                    myTextController: visionTextController,
                    myFocusNode: visionFocusNode,
                    validText: validVision,
                    maxLines: 3,
                    textCollecter: visionText,
                    helperText: '',
                    labelcolour: visionLabelColor,
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
                            bcStepsContent[0].bcCompletionValidator = false;
//                            bcpData[6].CompletionValidator = false;
                            Navigator.pushNamed(context, '/BCStep1AddDetails');
                          },
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
