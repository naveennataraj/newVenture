import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step2_StudyingTheUser/ContentUserStories.dart';
import 'package:iventure001/Screens/BlitzCanvas/StudyingTheUser/BcStep2CapturingUserStories.dart';
import 'package:iventure001/Widgets/AddDetailButton.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';

class BcUserStoryDialogue extends StatefulWidget {
  final int index;
  const BcUserStoryDialogue({this.index});
  @override
  _BcUserStoryDialogueState createState() => _BcUserStoryDialogueState(index);
}

var AsalabelColor = Color(0XFF919191);
bool validAsa = true;
var AsaTextController = TextEditingController();
final AsaFocusNode = new FocusNode();
String Asa;

var IWantTolabelColor = Color(0XFF919191);
bool validIWantTo = true;
var IWantToTextController = TextEditingController();
final IWantToFocusNode = new FocusNode();
String IWantTo;

var SoThatlabelColor = Color(0XFF919191);
bool validSoThat = true;
var SoThatTextController = TextEditingController();
final SoThatFocusNode = new FocusNode();
String SoThat;

class _BcUserStoryDialogueState extends State<BcUserStoryDialogue> {
  int index;
  _BcUserStoryDialogueState(this.index);
  @override
  void initState() {
    super.initState();
    if (index != null) {
      AsaTextController =
          TextEditingController(text: userStoriesContent[index].Asa);
      IWantToTextController =
          TextEditingController(text: userStoriesContent[index].IWantTo);
      SoThatTextController =
          TextEditingController(text: userStoriesContent[index].SoThat);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)), //this right here
      child: Container(
        height: MediaQuery.of(context).size.height * 0.60,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Center(
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Add a user story:",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextFieldWidget(
                    labelText: "As a",
                    maxLines: 3,
                    validText: validAsa,
                    myFocusNode: AsaFocusNode,
                    myTextController: AsaTextController,
                    textCollecter: Asa,
                    helperText: 'Who is the user for this story?',
                    labelcolour: AsalabelColor,
                  ),
                  TextFieldWidget(
                    labelText: "I want",
                    maxLines: 3,
                    validText: validIWantTo,
                    myFocusNode: IWantToFocusNode,
                    myTextController: IWantToTextController,
                    textCollecter: IWantTo,
                    helperText:
                        'What is the desired action, which the user is able to perform using the system? ',
                    labelcolour: IWantTolabelColor,
                  ),
                  TextFieldWidget(
                    labelText: "So that",
                    maxLines: 3,
                    validText: validSoThat,
                    myFocusNode: SoThatFocusNode,
                    myTextController: SoThatTextController,
                    textCollecter: SoThat,
                    helperText:
                        'What is the goal of the user when performing this action?',
                    labelcolour: SoThatlabelColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        AddDetailButton(
                          routeName: '/addpainpoints',
                          onTap: () {
                            setState(() {
                              final NewUserStory = BcContentUserStories(
                                Asa: AsaTextController.text,
                                IWantTo: SoThatTextController.text,
                                SoThat: IWantToTextController.text,
                              );
                              if (index == null) {
                                userStoriesContent.add(NewUserStory);
                              } else {
                                userStoriesContent.removeAt(index);
                                userStoriesContent.insert(
                                    index, NewUserStory);
                              }
//
                              AsaTextController.clear();
                              SoThatTextController.clear();
                              IWantToTextController.clear();

                              Navigator.pop(context);
//                              Navigator.push(context, new MaterialPageRoute(builder: (context) => BcStep2CapturingUserStories()),
//                              )
//                                  .then((value) => setState(() {}),);

                            });
                          },
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        CancelButtton(
                          OnTap: () {
                            AsaTextController.clear();
                            SoThatTextController.clear();
                            IWantToTextController.clear();
                            Navigator.pop(context);
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
