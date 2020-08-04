import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionIdeation/pickDetails.dart';
import 'package:iventure001/Data/CardData.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/CompleteStepButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class pickDetailsDialogue extends StatefulWidget {
  final int index;

  const pickDetailsDialogue({this.index});
  @override
  _pickDetailsDialogueState createState() => _pickDetailsDialogueState(index);
}

class _pickDetailsDialogueState extends State<pickDetailsDialogue> {
  int index;

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
  bool checked = false;

  bool spinner = false;

  Color CheckTextActive = Colors.black;
  Color CheckTextInActive = Color(0xFFABABAB);

  validator() {
    setState(() {
      TopPickTextController.text.isEmpty
          ? validTopPick = false
          : validTopPick = true;
      TopPickTextController.text.isEmpty
          ? TopPicklabelColor = Color(0xFFF53E70)
          : TopPicklabelColor = Color(0xFF919191);
      PVPTextController.text.isEmpty ? validPVP = false : validPVP = true;
      PVPTextController.text.isEmpty
          ? PVPlabelColor = Color(0xFFF53E70)
          : PVPlabelColor = Color(0xFF919191);
      EventTextController.text.isEmpty ? validEvent = false : validEvent = true;
      EventTextController.text.isEmpty
          ? EventlabelColor = Color(0xFFF53E70)
          : EventlabelColor = Color(0xFF919191);
      TraitsTextController.text.isEmpty
          ? validTraits = false
          : validTraits = true;
      TraitsTextController.text.isEmpty
          ? TraitslabelColor = Color(0xFFF53E70)
          : TraitslabelColor = Color(0xFF919191);
      MonetizeTextController.text.isEmpty
          ? validMonetize = false
          : validMonetize = true;
      MonetizeTextController.text.isEmpty
          ? MonetizelabelColor = Color(0xFFF53E70)
          : MonetizelabelColor = Color(0xFF919191);
    });
  }

  final _firestore = Firestore.instance;

  void getDocument() async {
    spinner = true;
    final document = await _firestore.collection('pickDetails').getDocuments();
//    print("GEt method called");

    for (var message in document.documents) {
      PickDetailsArray = [];
      final checked = message.data['checked'];
      final Event = message.data['Event'];
      final Monetize = message.data['Monetize'];
      final PVP = message.data['PVP'];
      final Traits = message.data['Traits'];
      final TopPick = message.data['TopPick'];
      final ID = message.documentID;

      final fields = pickDetails(
          checked: checked,
          Event: Event,
          Monetize: Monetize,
          PVP: PVP,
          Traits: Traits,
          TopPick: TopPick,
          ID: ID);

      PickDetailsArray.add(fields);
    }
    setState(() {
      spinner = false;
      if (PickDetailsArray.length != 0) {
        TopPickTextController =
            TextEditingController(text: PickDetailsArray[0].TopPick);
        TraitsTextController =
            TextEditingController(text: PickDetailsArray[0].Traits);
        PVPTextController =
            TextEditingController(text: PickDetailsArray[0].PVP);
        MonetizeTextController =
            TextEditingController(text: PickDetailsArray[0].Monetize);
        EventTextController =
            TextEditingController(text: PickDetailsArray[0].Event);
        checked = PickDetailsArray[0].checked;
      }
    });
  }

  update() {
    print("Update method called");
    _firestore
        .collection('pickDetails')
        .document(PickDetailsArray[0].ID)
        .updateData({
      'checked': checked,
      'Event': EventTextController.text,
      'Monetize': MonetizeTextController.text,
      'PVP': PVPTextController.text,
      'Traits': TraitsTextController.text,
      'TopPick': TopPickTextController.text,
      'Sender': "tester@gmail.com",
    });
  }

  add() {
    print("add method called");
    _firestore.collection('pickDetails').add({
      'checked': checked,
      'Event': EventTextController.text,
      'Monetize': MonetizeTextController.text,
      'PVP': PVPTextController.text,
      'Traits': TraitsTextController.text,
      'TopPick': TopPickTextController.text,
      'Sender': "tester@gmail.com",
    });
  }

  _pickDetailsDialogueState(this.index);
  @override
  void initState() {
    getDocument();
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
            child: ModalProgressHUD(
              inAsyncCall: spinner,
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
                              color: checked
                                  ? CheckTextActive
                                  : CheckTextInActive),
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
                            CancelButtton(
                              OnTap: () {
                                TopPickTextController.clear();
                                PVPTextController.clear();
                                TraitsTextController.clear();
                                MonetizeTextController.clear();
                                EventTextController.clear();
                                checked = false;
                                Navigator.pop(context);
                              },
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            CompleteStepButton(
                              OnTap: (TopPickTextController.text == '' ||
                                      PVPTextController.text == '' ||
                                      EventTextController.text == '' ||
                                      TraitsTextController.text == '' ||
                                      MonetizeTextController.text == '')
                                  ? () {
                                      validator();
                                    }
                                  : () {
                                      if (PickDetailsArray.length != 0) {
                                        update();
                                      } else {
                                        add();
                                      }
                                      bcpData[2].CompletionValidator = true;

                                      Navigator.pushNamed(
                                          context, '/BlitzInnovationFramework');
                                    },
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ));
  }
}
