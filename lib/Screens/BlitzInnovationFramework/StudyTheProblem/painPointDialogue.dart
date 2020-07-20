import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcAddFoundation/ContentBcAddFoundation.dart';
import 'package:iventure001/Widgets/AddDetailButton.dart';
import 'package:iventure001/Widgets/CancelButton.dart';

String Challenge;
String MoreDetails;
String Consequence;
String addresspp;
String expectations;

class painpointDialogue extends StatefulWidget {
  @override
  _painpointDialogueState createState() => _painpointDialogueState();
}

var ChallengelabelColor = Color(0XFF919191);
bool validChallenge = true;
final ChallengeTextController = TextEditingController();
final ChallengeFocusNode = new FocusNode();

var MoreDetailslabelColor = Color(0XFF919191);
bool validMoreDetails = true;
final MoreDetailsTextController = TextEditingController();
final MoreDetailsFocusNode = new FocusNode();

var ConsequencelabelColor = Color(0XFF919191);
bool validConsequence = true;
final ConsequenceTextController = TextEditingController();
final ConsequenceFocusNode = new FocusNode();

var addresspplabelColor = Color(0XFF919191);
bool validaddresspp = true;
final addressppTextController = TextEditingController();
final addressppFocusNode = new FocusNode();

var expectationslabelColor = Color(0XFF919191);
bool validexpectations = true;
final expectationsTextController = TextEditingController();
final expectationsFocusNode = new FocusNode();

class _painpointDialogueState extends State<painpointDialogue> {
  void requestFocus(FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)), //this right here
      child: Container(
        height: MediaQuery.of(context).size.height * 0.90,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                'Add a Pain Point:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: TextField(
                focusNode: ChallengeFocusNode,
                onTap: () {
                  requestFocus(ChallengeFocusNode);
                },
                controller: ChallengeTextController,
                maxLines: 3,
//                      maxLength: maxLength,
                decoration: dialogueTextFields.copyWith(
                  labelText:
                      'Mention in one Sentence the Challenge faced by the User',
                  helperText: ChallengeFocusNode.hasFocus
                      ? 'Ensure to be Brief in this box. In the following box, more details will be collected about this pain point'
                      : null,
                  labelStyle: TextStyle(
                      color: ChallengeFocusNode.hasFocus
                          ? Color(0XFFE95420)
                          : ChallengelabelColor),
                  errorText: validChallenge ? null : 'This field is required',
                ),
                onChanged: (text) {
                  if (ChallengeTextController.text == "") {
                    setState(() {
                      validChallenge = false;
                      ChallengelabelColor = Color(0XFFF53E70);
                    });
                  } else {
                    setState(() {
                      Challenge = text;
                      validChallenge = true;
                      ChallengelabelColor = Colors.grey;
                    });
                  }
                },
                onSubmitted: (text) {
                  if (ChallengeTextController.text == "") {
                    setState(() {
                      validChallenge = false;
                      ChallengelabelColor = Color(0XFFF53E70);
                    });
                  } else {
                    setState(() {
                      Challenge = text;
                      validChallenge = true;
                      ChallengelabelColor = Colors.grey;
                    });
                  }
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: TextField(
                focusNode: MoreDetailsFocusNode,
                onTap: () {
                  requestFocus(MoreDetailsFocusNode);
                },
                controller: MoreDetailsTextController,
                maxLines: 3,
//                      maxLength: maxLength,
                decoration: dialogueTextFields.copyWith(
                  labelText: 'Provide more details',
                  helperText: MoreDetailsFocusNode.hasFocus
                      ? 'Provide additional details of the briefly described pain point in this section'
                      : null,
                  labelStyle: TextStyle(
                      color: MoreDetailsFocusNode.hasFocus
                          ? Color(0XFFE95420)
                          : MoreDetailslabelColor),
                  errorText: validMoreDetails ? null : 'This field is required',
                ),
                onChanged: (text) {
                  if (MoreDetailsTextController.text == "") {
                    setState(() {
                      validMoreDetails = false;
                      MoreDetailslabelColor = Color(0XFFF53E70);
                    });
                  } else {
                    setState(() {
                      MoreDetails = text;
                      validMoreDetails = true;
                      MoreDetailslabelColor = Colors.grey;
                    });
                  }
                },
                onSubmitted: (text) {
                  if (MoreDetailsTextController.text == "") {
                    setState(() {
                      validMoreDetails = false;
                      MoreDetailslabelColor = Color(0XFFF53E70);
                    });
                  } else {
                    setState(() {
                      MoreDetails = text;
                      validMoreDetails = true;
                      MoreDetailslabelColor = Colors.grey;
                    });
                  }
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: TextField(
                focusNode: ConsequenceFocusNode,
                onTap: () {
                  requestFocus(ConsequenceFocusNode);
                },
                controller: ConsequenceTextController,
                maxLines: 3,
//                      maxLength: maxLength,
                decoration: dialogueTextFields.copyWith(
                  labelText:
                      'What are the consequence of the pain point not being assressed?',
                  helperText: ConsequenceFocusNode.hasFocus
                      ? 'If the challenged faced by the customer is left unchecked, what will happen as a result?'
                      : null,
                  labelStyle: TextStyle(
                      color: ConsequenceFocusNode.hasFocus
                          ? Color(0XFFE95420)
                          : ConsequencelabelColor),
                  errorText: validConsequence ? null : 'This field is required',
                ),
                onChanged: (text) {
                  if (ConsequenceTextController.text == "") {
                    setState(() {
                      validConsequence = false;
                      ConsequencelabelColor = Color(0XFFF53E70);
                    });
                  } else {
                    setState(() {
                      Consequence = text;
                      validConsequence = true;
                      ConsequencelabelColor = Colors.grey;
                    });
                  }
                },
                onSubmitted: (text) {
                  if (ConsequenceTextController.text == "") {
                    setState(() {
                      validConsequence = false;
                      ConsequencelabelColor = Color(0XFFF53E70);
                    });
                  } else {
                    setState(() {
                      Consequence = text;
                      validConsequence = true;
                      ConsequencelabelColor = Colors.grey;
                    });
                  }
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: TextField(
                focusNode: addressppFocusNode,
                onTap: () {
                  requestFocus(addressppFocusNode);
                },
                controller: addressppTextController,
                maxLines: 3,
//                      maxLength: maxLength,
                decoration: dialogueTextFields.copyWith(
                  labelText:
                      'How do the users currently address the pain point?',
                  helperText: addressppFocusNode.hasFocus
                      ? 'In the absence of a solution, What do users currently use as a workaround for this pain point?'
                      : null,
                  labelStyle: TextStyle(
                      color: addressppFocusNode.hasFocus
                          ? Color(0XFFE95420)
                          : addresspplabelColor),
                  errorText: validaddresspp ? null : 'This field is required',
                ),
                onChanged: (text) {
                  if (addressppTextController.text == "") {
                    setState(() {
                      validaddresspp = false;
                      addresspplabelColor = Color(0XFFF53E70);
                    });
                  } else {
                    setState(() {
                      addresspp = text;
                      validaddresspp = true;
                      addresspplabelColor = Colors.grey;
                    });
                  }
                },
                onSubmitted: (text) {
                  if (addressppTextController.text == "") {
                    setState(() {
                      validaddresspp = false;
                      addresspplabelColor = Color(0XFFF53E70);
                    });
                  } else {
                    setState(() {
                      addresspp = text;
                      validaddresspp = true;
                      addresspplabelColor = Colors.grey;
                    });
                  }
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: TextField(
                focusNode: expectationsFocusNode,
                onTap: () {
                  requestFocus(expectationsFocusNode);
                },
                controller: expectationsTextController,
                maxLines: 3,
//                      maxLength: maxLength,
                decoration: dialogueTextFields.copyWith(
                  labelText:
                      'How do the users currently address the pain point?',
                  helperText: expectationsFocusNode.hasFocus
                      ? 'In the absence of a solution, What do users currently use as a workaround for this pain point?'
                      : null,
                  labelStyle: TextStyle(
                      color: expectationsFocusNode.hasFocus
                          ? Color(0XFFE95420)
                          : expectationslabelColor),
                  errorText:
                      validexpectations ? null : 'This field is required',
                ),
                onChanged: (text) {
                  if (expectationsTextController.text == "") {
                    setState(() {
                      validexpectations = false;
                      expectationslabelColor = Color(0XFFF53E70);
                    });
                  } else {
                    setState(() {
                      expectations = text;
                      validexpectations = true;
                      expectationslabelColor = Colors.grey;
                    });
                  }
                },
                onSubmitted: (text) {
                  if (expectationsTextController.text == "") {
                    setState(() {
                      validexpectations = false;
                      expectationslabelColor = Color(0XFFF53E70);
                    });
                  } else {
                    setState(() {
                      expectations = text;
                      validexpectations = true;
                      expectationslabelColor = Colors.grey;
                    });
                  }
                },
              ),
            ),
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: AddDetailButton(
                    routeName: '/addpainpoints',
                    onTap: () {
                      setState(() {
                        final NewPainpoint = ContentBcAddFoundation(
                          description: Challenge,
                        );
                        addPainPointsContent.add(NewPainpoint);
                        Navigator.pop(context);
                      });
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: CancelButtton(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
