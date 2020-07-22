import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/StudyTheProblem/addPainPointsData.dart';
import 'package:iventure001/Widgets/AddDetailButton.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';

class painpointDialogue extends StatefulWidget {
  final int index;

  const painpointDialogue({this.index});
  @override
  _painpointDialogueState createState() => _painpointDialogueState(index);
}

var ChallengelabelColor = Color(0XFF919191);
bool validChallenge = true;
var ChallengeTextController = TextEditingController();
final ChallengeFocusNode = new FocusNode();
String Challenge;

var MoreDetailslabelColor = Color(0XFF919191);
bool validMoreDetails = true;
var MoreDetailsTextController = TextEditingController();
final MoreDetailsFocusNode = new FocusNode();
String MoreDetails;

var ConsequencelabelColor = Color(0XFF919191);
bool validConsequence = true;
var ConsequenceTextController = TextEditingController();
final ConsequenceFocusNode = new FocusNode();
String Consequence;

var addresspplabelColor = Color(0XFF919191);
bool validaddresspp = true;
var addressppTextController = TextEditingController();
final addressppFocusNode = new FocusNode();
String addresspp;

var expectationslabelColor = Color(0XFF919191);
bool validexpectations = true;
var expectationsTextController = TextEditingController();
final expectationsFocusNode = new FocusNode();
String expectations;

class _painpointDialogueState extends State<painpointDialogue> {
  int index;

  _painpointDialogueState(this.index);
  @override
  void initState() {
    //  implement initState
    super.initState();
    if (index != null) {
      ChallengeTextController =
          TextEditingController(text: AddingNewPainPoint[index].Challenge);
      MoreDetailsTextController =
          TextEditingController(text: AddingNewPainPoint[index].MoreDetails);
      ConsequenceTextController =
          TextEditingController(text: AddingNewPainPoint[index].Consequence);
      addressppTextController =
          TextEditingController(text: AddingNewPainPoint[index].Addresspp);
      expectationsTextController =
          TextEditingController(text: AddingNewPainPoint[index].Expectations);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)), //this right here
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        width: MediaQuery.of(context).size.width * 0.4,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  'Add a Pain Point:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              TextFieldWidget(
                textCollecter: Challenge,
                validText: validChallenge,
                myTextController: ChallengeTextController,
                labelText:
                    'Mention in one Sentence the Challenge faced by the User',
                helperText:
                    'Ensure to be Brief in this box. In the following box, more details will be collected about this pain point',
                labelcolour: ChallengelabelColor,
                maxLines: 3,
                myFocusNode: ChallengeFocusNode,
              ),
              TextFieldWidget(
                textCollecter: MoreDetails,
                validText: validMoreDetails,
                myTextController: MoreDetailsTextController,
                labelText: 'Provide more details',
                helperText:
                    'Provide additional details of the briefly described pain point in this section',
                labelcolour: MoreDetailslabelColor,
                maxLines: 3,
                myFocusNode: MoreDetailsFocusNode,
              ),
              TextFieldWidget(
                textCollecter: Consequence,
                validText: validConsequence,
                myTextController: ConsequenceTextController,
                labelText:
                    'What are the consequence of the pain point not being assressed?',
                helperText:
                    'If the challenged faced by the customer is left unchecked, what will happen as a result?',
                labelcolour: ConsequencelabelColor,
                maxLines: 3,
                myFocusNode: ConsequenceFocusNode,
              ),
              TextFieldWidget(
                textCollecter: addresspp,
                validText: validaddresspp,
                myTextController: addressppTextController,
                labelText: 'How do the users currently address the pain point?',
                helperText:
                    'In the absence of a solution, What do users currently use as a workaround for this pain point?',
                labelcolour: addresspplabelColor,
                maxLines: 3,
                myFocusNode: addressppFocusNode,
              ),
              TextFieldWidget(
                textCollecter: expectations,
                validText: validexpectations,
                myTextController: expectationsTextController,
                labelText: 'How do the users currently address the pain point?',
                helperText:
                    'In the absence of a solution, What do users currently use as a workaround for this pain point?',
                labelcolour: expectationslabelColor,
                maxLines: 3,
                myFocusNode: expectationsFocusNode,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: AddDetailButton(
                      routeName: '/addpainpoints',
                      onTap: () {
                        setState(() {
                          final NewPainpoint = addPainPoints(
                            Challenge: ChallengeTextController.text,
                            MoreDetails: MoreDetailsTextController.text,
                            Consequence: ConsequenceTextController.text,
                            Addresspp: addressppTextController.text,
                            Expectations: expectationsTextController.text,
                          );
                          if (index == null) {
                            AddingNewPainPoint.add(NewPainpoint);
                          } else {
                            AddingNewPainPoint.removeAt(index);
                            AddingNewPainPoint.insert(index, NewPainpoint);
                          }
                          ChallengeTextController.clear();
                          MoreDetailsTextController.clear();
                          ConsequenceTextController.clear();
                          addressppTextController.clear();
                          expectationsTextController.clear();
                          Navigator.pop(context);
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: CancelButtton(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
