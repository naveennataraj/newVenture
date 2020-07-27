import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/PreValidation/addContact.dart';
import 'package:iventure001/Widgets/AddProductGoalButton.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';

class addEvangelistsAndEarlyAdoptersDialogue extends StatefulWidget {
  final int index;

  const addEvangelistsAndEarlyAdoptersDialogue({this.index});
  @override
  _addEvangelistsAndEarlyAdoptersDialogueState createState() =>
      _addEvangelistsAndEarlyAdoptersDialogueState(index);
}

var PersonNamelabelColor = Color(0XFF919191);
bool validPersonName = true;
var PersonNameTextController = TextEditingController();
final PersonNameFocusNode = new FocusNode();
String PersonName;

var PersonEmaillabelColor = Color(0XFF919191);
bool validPersonEmail = true;
var PersonEmailTextController = TextEditingController();
final PersonEmailFocusNode = new FocusNode();
String PersonEmail;

var PersonNumberlabelColor = Color(0XFF919191);
bool validPersonNumber = true;
var PersonNumberTextController = TextEditingController();
final PersonNumberFocusNode = new FocusNode();
String PersonNumber;

class _addEvangelistsAndEarlyAdoptersDialogueState
    extends State<addEvangelistsAndEarlyAdoptersDialogue> {
  int index;
  int clickedRadio;
  var radio1Focus = new FocusNode();
  var radio2Focus = new FocusNode();

  requestFocus(FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  _addEvangelistsAndEarlyAdoptersDialogueState(this.index);
  @override
  void initState() {
    super.initState();
    if (index != null) {
      PersonNameTextController =
          TextEditingController(text: AddingNewContacts[index].Name);
      PersonEmailTextController =
          TextEditingController(text: AddingNewContacts[index].Email);
      PersonNumberTextController =
          TextEditingController(text: AddingNewContacts[index].Contact);
      clickedRadio = AddingNewContacts[index].ContactSelected;
    }
  }

  @override
  void dispose() {
    radio1Focus.dispose();
    radio2Focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)), //this right here
        child: Container(
          height: MediaQuery.of(context).size.height * 0.50,
          width: MediaQuery.of(context).size.width * 0.4,
          child: Center(
            child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Add a Contact:",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TextFieldWidget(
                      labelText: "Enter the name of the person",
                      maxLines: 1,
                      validText: validPersonName,
                      myFocusNode: PersonNameFocusNode,
                      myTextController: PersonNameTextController,
                      textCollecter: PersonName,
                      helperText: '',
                      labelcolour: PersonNamelabelColor,
                    ),
                    TextFieldWidget(
                      labelText: "Enter the email ID of the person",
                      maxLines: 1,
                      validText: validPersonEmail,
                      myFocusNode: PersonEmailFocusNode,
                      myTextController: PersonEmailTextController,
                      textCollecter: PersonEmail,
                      helperText: '',
                      labelcolour: PersonEmaillabelColor,
                    ),
                    TextFieldWidget(
                      labelText: "Enter the contact number of the person",
                      maxLines: 1,
                      validText: validPersonNumber,
                      myFocusNode: PersonNameFocusNode,
                      myTextController: PersonNumberTextController,
                      textCollecter: PersonNumber,
                      helperText: '',
                      labelcolour: PersonNumberlabelColor,
                    ),
                    Row(
                      children: [
                        Text(
                          'This Contact is a(n)',
                          style: TextStyle(fontSize: 18),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              'Early adopter',
                            ),
                            leading: Radio(
                              focusNode: radio1Focus,
                              activeColor: Color(0XFFE95420),
                              value: 1,
                              groupValue: clickedRadio,
                              onChanged: (selectedRadio) {
                                setState(() {
                                  requestFocus(radio1Focus);
                                  clickedRadio = selectedRadio;
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text('Evangelist'),
                            leading: Radio(
                              focusNode: radio2Focus,
                              activeColor: Color(0XFFE95420),
                              value: 2,
                              groupValue: clickedRadio,
                              onChanged: (selectedRadio) {
                                setState(() {
                                  requestFocus(radio2Focus);
                                  clickedRadio = selectedRadio;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AddProductGoalButton(
                            onTap: () {
                              setState(() {
                                final NewContacts = addContact(
                                  Name: PersonNameTextController.text,
                                  Email: PersonEmailTextController.text,
                                  Contact: PersonNumberTextController.text,
                                );

                                if (index == null) {
                                  AddingNewContacts.add(NewContacts);
                                } else {
                                  AddingNewContacts.removeAt(index);
                                  AddingNewContacts.insert(index, NewContacts);
                                }

                                PersonNameTextController.clear();
                                PersonEmailTextController.clear();
                                PersonNumberTextController.clear();

                                Navigator.pop(context);
                              });
                            },
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          CancelButtton(
                            OnTap: () {
                              PersonNameTextController.clear();
                              PersonEmailTextController.clear();
                              PersonNumberTextController.clear();

                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }
}
