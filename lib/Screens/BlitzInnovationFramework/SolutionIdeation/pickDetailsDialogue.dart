import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/CompleteStepButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';

class pickDetailsDialogue extends StatefulWidget {
  final int index;

  const pickDetailsDialogue({this.index});
  @override
  _pickDetailsDialogueState createState() => _pickDetailsDialogueState(index);
}

var TopPicklabelColor = Color(0XFF919191);
bool validTopPick = true;
var TopPickTextController = TextEditingController();
final TopPickFocusNode = new FocusNode();
String TopPick;

var PVPlabelColor = Color(0XFF919191);
bool validPVP = true;
var PVPTextController = TextEditingController();
final PVPFocusNode = new FocusNode();
String PVP;

var EventlabelColor = Color(0XFF919191);
bool validEvent = true;
var EventTextController = TextEditingController();
final EventFocusNode = new FocusNode();
String Event;

var TraitslabelColor = Color(0XFF919191);
bool validTraits = true;
var TraitsTextController = TextEditingController();
final TraitsFocusNode = new FocusNode();
String Traits;

var MonetizelabelColor = Color(0XFF919191);
bool validMonetize = true;
var MonetizeTextController = TextEditingController();
final MonetizeFocusNode = new FocusNode();
String Monetize;

class _pickDetailsDialogueState extends State<pickDetailsDialogue> {
  int index;
  bool checked = false;
  Color CheckTextActive = Colors.black;
  Color CheckTextInActive = Color(0XFFABABAB);

  _pickDetailsDialogueState(this.index);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)), //this right here
        child: Container(
          height: MediaQuery.of(context).size.height * 0.90,
          width: MediaQuery.of(context).size.width * 0.4,
          child: Center(
            child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Let's get a few more details about your top pick:",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TextFieldWidget(
                      labelText: "Why choose this solution as your top pick?",
                      maxLines: 3,
                      validText: validTopPick,
                      myFocusNode: TopPickFocusNode,
                      myTextController: TopPickTextController,
                      textCollecter: TopPick,
                      helperText: '',
                      labelcolour: TopPicklabelColor,
                    ),
                    TextFieldWidget(
                      labelText:
                          "How would you briefly describe the primary value proposition for this solution?",
                      maxLines: 3,
                      validText: validPVP,
                      myFocusNode: PVPFocusNode,
                      myTextController: PVPTextController,
                      textCollecter: PVP,
                      helperText:
                          'A value proposition helps the customer understand what value they acquire when they use your solution',
                      labelcolour: PVPlabelColor,
                    ),
                    TextFieldWidget(
                      labelText:
                          "After the occurance of which event, would you suggest that the customer pain point is resolved?",
                      maxLines: 3,
                      validText: validEvent,
                      myFocusNode: EventFocusNode,
                      myTextController: EventTextController,
                      textCollecter: Event,
                      helperText: '',
                      labelcolour: EventlabelColor,
                    ),
                    TextFieldWidget(
                      labelText:
                          "What are the traits of the early adopters who will be testing the solution concept?",
                      maxLines: 3,
                      validText: validTraits,
                      myFocusNode: TraitsFocusNode,
                      myTextController: TraitsTextController,
                      textCollecter: Traits,
                      helperText: '',
                      labelcolour: TraitslabelColor,
                    ),
                    TextFieldWidget(
                      labelText:
                          "How would you plan to monetize the solution concept?",
                      maxLines: 3,
                      validText: validMonetize,
                      myFocusNode: MonetizeFocusNode,
                      myTextController: MonetizeTextController,
                      textCollecter: Monetize,
                      helperText:
                          '*Determining this is at the current stage can help incorporate this strategy into the design at an early stage.',
                      labelcolour: MonetizelabelColor,
                    ),
                    CheckboxListTile(
                      title: Text(
                        'This solution concept has disruptive qualities',
                        style: TextStyle(
                            color:
                                checked ? CheckTextActive : CheckTextInActive),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: checked,
                      onChanged: (bool value) {
                        setState(() {
                          checked = value;
                        });
                      },
                      activeColor: Color(0XFFE95420),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CancelButtton(),
                          SizedBox(
                            width: 50,
                          ),
                          CompleteStepButton(),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }
}
