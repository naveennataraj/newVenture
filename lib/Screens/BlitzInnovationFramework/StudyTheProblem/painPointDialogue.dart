import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcAddFoundation/ContentBcAddFoundation.dart';
import 'package:iventure001/Widgets/AddDetailButton.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/DialogueTextField.dart';

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
            DialogueTextFields(
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
            DialogueTextFields(
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
            DialogueTextFields(
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
            DialogueTextFields(
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
            DialogueTextFields(
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: AddDetailButton(
                    routeName: '/addpainpoints',
                    onTap: () {
                      setState(() {
                        final NewPainpoint = ContentBcAddFoundation(
                          description: ChallengeTextController.text,
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
