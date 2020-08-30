import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/StudyTheProblem/addPainPointsData.dart';
import 'package:iventure001/Widgets/AddDetailButton.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
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
  final _firestore = Firestore.instance;

  _painpointDialogueState(this.index);

  validator() {
    setState(() {
      ChallengeTextController.text.isEmpty
          ? validChallenge = false
          : validChallenge = true;
      ChallengeTextController.text.isEmpty
          ? ChallengelabelColor = Color(0xFFF53E70)
          : ChallengelabelColor = Color(0xFF919191);
      MoreDetailsTextController.text.isEmpty
          ? validMoreDetails = false
          : validMoreDetails = true;
      MoreDetailsTextController.text.isEmpty
          ? MoreDetailslabelColor = Color(0xFFF53E70)
          : MoreDetailslabelColor = Color(0xFF919191);
      ConsequenceTextController.text.isEmpty
          ? validConsequence = false
          : validConsequence = true;
      ConsequenceTextController.text.isEmpty
          ? ConsequencelabelColor = Color(0xFFF53E70)
          : ConsequencelabelColor = Color(0xFF919191);
      addressppTextController.text.isEmpty
          ? validaddresspp = false
          : validaddresspp = true;
      addressppTextController.text.isEmpty
          ? addresspplabelColor = Color(0xFFF53E70)
          : addresspplabelColor = Color(0xFF919191);
      expectationsTextController.text.isEmpty
          ? validexpectations = false
          : validexpectations = true;
      expectationsTextController.text.isEmpty
          ? expectationslabelColor = Color(0xFFF53E70)
          : expectationslabelColor = Color(0xFF919191);

      print("(Validator is called)");
    });
  }

  void initState() {
    //  implement initState
    super.initState();

    if (demoSelected == true) {
      if (index != null) {
        ChallengeTextController = TextEditingController(
            text: DemoAddingNewPainPoint[index].Challenge);
      }
    } else {
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
      } else {
        ChallengeTextController.clear();
        MoreDetailsTextController.clear();
        ConsequenceTextController.clear();
        addressppTextController.clear();
        expectationsTextController.clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)), //this right here
      child: Container(
        height: 600,
        width: 800,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
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
                  maxLines: 1,
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
                  maxLines: 1,
                  myFocusNode: MoreDetailsFocusNode,
                ),
                TextFieldWidget(
                  textCollecter: Consequence,
                  validText: validConsequence,
                  myTextController: ConsequenceTextController,
                  labelText:
                      'What are the consequence of the pain point not being addressed?',
                  helperText:
                      'If the challenged faced by the customer is left unchecked, what will happen as a result?',
                  labelcolour: ConsequencelabelColor,
                  maxLines: 1,
                  myFocusNode: ConsequenceFocusNode,
                ),
                TextFieldWidget(
                  textCollecter: addresspp,
                  validText: validaddresspp,
                  myTextController: addressppTextController,
                  labelText:
                      'How do the users currently address the pain point?',
                  helperText:
                      'In the absence of a solution, What do users currently use as a workaround for this pain point?',
                  labelcolour: addresspplabelColor,
                  maxLines: 1,
                  myFocusNode: addressppFocusNode,
                ),
                TextFieldWidget(
                  textCollecter: expectations,
                  validText: validexpectations,
                  myTextController: expectationsTextController,
                  labelText:
                      'What are the expectations from a new solution about this pain point?',
                  helperText:
                      'How do the users envision a solution to behave and solve this pain point?',
                  labelcolour: expectationslabelColor,
                  maxLines: 1,
                  myFocusNode: expectationsFocusNode,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AddDetailButton(
                        routeName: '/addpainpoints',
                        onTap: (demoSelected == true)
                            ? () {
                                Navigator.pop(context);
                              }
                            : (ChallengeTextController.text == '' ||
                                    MoreDetailsTextController.text == '' ||
                                    ConsequenceTextController.text == '' ||
                                    addressppTextController.text == '' ||
                                    expectationsTextController.text == '')
                                ? () {
                                    validator();
                                  }
                                : () {
                                    (ChallengeTextController.text != '' &&
                                            MoreDetailsTextController.text !=
                                                '' &&
                                            ConsequenceTextController.text !=
                                                '' &&
                                            addressppTextController.text !=
                                                '' &&
                                            expectationsTextController.text !=
                                                '')
                                        ? Navigator.pop(context)
                                        : {};
                                    setState(() {
                                      final NewPainpoint = addPainPoints(
                                        Challenge: ChallengeTextController.text,
                                        MoreDetails:
                                            MoreDetailsTextController.text,
                                        Consequence:
                                            ConsequenceTextController.text,
                                        Addresspp: addressppTextController.text,
                                        Expectations:
                                            expectationsTextController.text,
                                      );
                                      if (index == null) {
                                        AddingNewPainPoint.add(NewPainpoint);
                                        _firestore
                                            .collection(
                                                '$currentUser/StudyTheProblem/painPoints')
                                            .add({
                                          'Challenge':
                                              ChallengeTextController.text,
                                          'MoreDetails':
                                              MoreDetailsTextController.text,
                                          'Consequence':
                                              ConsequenceTextController.text,
                                          'Addresspp':
                                              addressppTextController.text,
                                          'Expectations':
                                              expectationsTextController.text,
                                          'Sender': "tester@gmail.com",
                                        });
                                      } else {
//                            AddingNewPainPoint.removeAt(index);
////                            AddingNewPainPoint.insert(index, NewPainpoint);
                                        _firestore
                                            .collection(
                                                '$currentUser/StudyTheProblem/painPoints')
                                            .document(
                                                AddingNewPainPoint[index].ID)
                                            .updateData({
                                          'Challenge':
                                              ChallengeTextController.text,
                                          'MoreDetails':
                                              MoreDetailsTextController.text,
                                          'Consequence':
                                              ConsequenceTextController.text,
                                          'Addresspp':
                                              addressppTextController.text,
                                          'Expectations':
                                              expectationsTextController.text,
                                          'Sender': "tester@gmail.com",
                                          'cardWithTitle': "true",
                                        });
                                      }
                                    });
                                  },
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      CancelButtton(
                        OnTap: () {
                          ChallengeTextController.clear();
                          MoreDetailsTextController.clear();
                          ConsequenceTextController.clear();
                          addressppTextController.clear();
                          expectationsTextController.clear();
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
