import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/PreValidation/addContact.dart';
import 'package:iventure001/Widgets/AddContactButton.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';

class addEvangelistsAndEarlyAdoptersDialogue extends StatefulWidget {
  final int index;

  const addEvangelistsAndEarlyAdoptersDialogue({this.index});
  @override
  _addEvangelistsAndEarlyAdoptersDialogueState createState() =>
      _addEvangelistsAndEarlyAdoptersDialogueState(index);
}

class _addEvangelistsAndEarlyAdoptersDialogueState
    extends State<addEvangelistsAndEarlyAdoptersDialogue> {
  int index;
  int clickedRadio;
  var radio1Focus = new FocusNode();
  var radio2Focus = new FocusNode();
  var radioButtonContactColor = Color(0xFFABABAB);
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
    } else {
      PersonNameTextController.clear();
      PersonEmailTextController.clear();
      PersonNumberTextController.clear();
      clickedRadio = null;
    }
  }

  validator() {
    setState(() {
      PersonNameTextController.text.isEmpty
          ? validPersonName = false
          : validPersonName = true;
      PersonNameTextController.text.isEmpty
          ? PersonNamelabelColor = Color(0xFFF53E70)
          : PersonNamelabelColor = Color(0xFF919191);
      PersonEmailTextController.text.isEmpty
          ? validPersonEmail = false
          : validPersonEmail = true;
      PersonEmailTextController.text.isEmpty
          ? PersonEmaillabelColor = Color(0xFFF53E70)
          : PersonEmaillabelColor = Color(0xFF919191);
      PersonNumberTextController.text.isEmpty
          ? validPersonNumber = false
          : validPersonNumber = true;
      PersonNumberTextController.text.isEmpty
          ? PersonNumberlabelColor = Color(0xFFF53E70)
          : PersonNumberlabelColor = Color(0xFF919191);
      (clickedRadio == null)
          ? radioButtonContactColor = Color(0xFFF53E70)
          : radioButtonContactColor = Color(0xFFE95420);
    });
  }

  @override
  void dispose() {
    radio1Focus.dispose();
    radio2Focus.dispose();
    super.dispose();
  }

  final _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)), //this right here
        child: Container(
          height: 650,
          width: 800,
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
                      myFocusNode: PersonNumberFocusNode,
                      myTextController: PersonNumberTextController,
                      textCollecter: PersonNumber,
                      helperText: '',
                      labelcolour: PersonNumberlabelColor,
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: (radio1Focus.hasFocus || radio2Focus.hasFocus)
                              ? Border.all(width: 1.2, color: Color(0xFFE95420))
                              : Border.all(
                                  width: 1.2, color: radioButtonContactColor),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: (MediaQuery.of(context).size.width >= 750)
                            ? Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'This Contact is a(n)',
                                      style: TextStyle(fontSize: 18),
                                    ),
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
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'This Contact is a(n)',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  ListTile(
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
                                  ListTile(
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
                                ],
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AddContactButton(
                            onTap: (PersonNameTextController.text == '' ||
                                    PersonEmailTextController.text == '' ||
                                    PersonNumberTextController.text == '' ||
                                    clickedRadio == null)
                                ? () {
                                    validator();
                                  }
                                : () {
                                    (PersonNameTextController.text != '' &&
                                            PersonEmailTextController.text !=
                                                '' &&
                                            PersonNumberTextController.text !=
                                                '' &&
                                            clickedRadio != null)
                                        ? Navigator.pop(context)
                                        : {};
                                    setState(() {
//                                final NewContacts = addContact(
//                                  Name: PersonNameTextController.text,
//                                  Email: PersonEmailTextController.text,
//                                  Contact: PersonNumberTextController.text,
//                                );

                                      if (index == null) {
//                                  AddingNewContacts.add(NewContacts);
                                        _firestore
                                            .collection(
                                                '$currentUser/PreValidation/evangelistsAndEarlyAdopters')
                                            .add({
                                          'Name': PersonNameTextController.text,
                                          'Email':
                                              PersonEmailTextController.text,
                                          'Contact':
                                              PersonNumberTextController.text,
                                          'ContactSelected': clickedRadio,
                                          'Sender': currentUser,
                                        });
                                      } else {
//                                  AddingNewContacts.removeAt(index);
//                                  AddingNewContacts.insert(index, NewContacts);
                                        _firestore
                                            .collection(
                                                '$currentUser/PreValidation/evangelistsAndEarlyAdopters')
                                            .document(
                                                AddingNewContacts[index].ID)
                                            .updateData({
                                          'Name': PersonNameTextController.text,
                                          'Email':
                                              PersonEmailTextController.text,
                                          'Contact':
                                              PersonNumberTextController.text,
                                          'ContactSelected': clickedRadio,
                                          'Sender': currentUser,
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
                              PersonNameTextController.clear();
                              PersonEmailTextController.clear();
                              PersonNumberTextController.clear();
                              clickedRadio = null;
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
