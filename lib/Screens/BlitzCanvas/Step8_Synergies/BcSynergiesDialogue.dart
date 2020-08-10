import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step8_Synergies/ContentSynergies.dart';
import 'package:iventure001/Constants/MultivalueDropDown.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:iventure001/Widgets/AddGenericButton.dart';

class BcSynergiesDialogue extends StatefulWidget {
  final int index;
  const BcSynergiesDialogue({this.index});
  @override
  _BcSynergiesDialogueState createState() => _BcSynergiesDialogueState(index);
}

var synergyNameLabelColor = Color(0XFF919191);
bool validSynergyName = true;
var synergyNameTextController = TextEditingController();
final synergyNameFocusNode = new FocusNode();
String synergyName;

var synergyDescriptionLabelColor = Color(0XFF919191);
bool validSynergyDescription = true;
var synergyDescriptionTextController = TextEditingController();
final synergyDescriptionFocusNode = new FocusNode();
String synergyDescription;

var synergyValueLabelColor = Color(0XFF919191);
bool validSynergyValue = true;
var synergyValueTextController = TextEditingController();
final synergyValueFocusNode = new FocusNode();
String synergyValueText;

const userUid = "tester@gmail.com";

class _BcSynergiesDialogueState extends State<BcSynergiesDialogue> {
  final _firestore = Firestore.instance;
  int index;
  _BcSynergiesDialogueState(this.index);

  String selectedServiceTypeName;
  String selectedServiceUsagePercentage;

  @override
  void initState() {
    super.initState();

    if (index != null) {
      synergyNameTextController = TextEditingController(
          text: addingNewSynergies[index].synergyName);
      synergyDescriptionTextController = TextEditingController(
          text: addingNewSynergies[index].synergyDescription);
      synergyValueTextController = TextEditingController(
          text: addingNewSynergies[index].synergyValues);

    }
    //bmcElementDropDown = buildDropDownMenuItems(BMCElements);

  }


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)), //this right here
      child: Container(
        height: MediaQuery.of(context).size.height * 0.70,
        width: MediaQuery.of(context).size.width * 0.5,
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
                      "Add a Potential Synergy:",
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextFieldWidget(
                    labelText: "What would you like to call this synergy?",
                    maxLines: 1,
                    validText: validSynergyName,
                    myFocusNode: synergyNameFocusNode,
                    myTextController: synergyNameTextController,
                    textCollecter: synergyName,
                    helperText:
                    'This field is required',
                    labelcolour: synergyNameLabelColor,
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(width: 1, color: Color(0XFFABABAB)),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(
                            'Please provide the type of service',
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 16),
                          ),
                          Spacer(),
                          Padding(
                            //padding: const EdgeInsets.only(right: 20),
                            child: CheckboxWidget()

//                            DropdownButton(
//                              hint: Text(
//                                'Choose',
//                                style: TextStyle(
//                                  color: Color(0XFFE95420),
//                                ),
//                              ),
//                              onChanged: (newValue) {
//                                setState(() {
//                                  SelectedBcmElement = newValue;
//                                  selectedServiceTypeName = SelectedBcmElement.name;
//                                });
//                              },
//                              items: bmcElementDropDown,
//                              value: SelectedBcmElement,
//                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextFieldWidget(
                    labelText:
                    "Please provide a detailed description of the synergy",
                    maxLines: 1,
                    validText: validSynergyDescription,
                    myFocusNode: synergyDescriptionFocusNode,
                    myTextController: synergyDescriptionTextController,
                    textCollecter: synergyDescription,
                    helperText: 'This field is required',
                    labelcolour: synergyDescriptionLabelColor,
                  ),
                  TextFieldWidget(
                    labelText:
                    "What value does this synergy provide to the business",
                    maxLines: 1,
                    validText: validSynergyValue,
                    myFocusNode: synergyValueFocusNode,
                    myTextController: synergyValueTextController,
                    textCollecter: synergyValueText,
                    helperText: 'This field is required',
                    labelcolour: synergyValueLabelColor,
                  ),


                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AddGenericButton(
                          buttonName: 'ADD SYNERGY',
                          onTap: () {
                            setState(() {
                              final NewSynergies = ContentSynergies(
                                synergyName: synergyNameTextController.text,
                                //synergyValueProposition:selectedServiceUsagePercentage,
                                //synergyCustomerSegment:selectedServiceUsagePercentage,
                                synergyDescription: synergyDescriptionTextController.text,
                                synergyValues: synergyValueTextController.text,
                              );

                              if (index == null) {
                                addingNewSynergies.add(
                                    NewSynergies);
                                _firestore.collection(userUid+'/Bc8_synergies/addSynergies').add({
                                  'synergyName': synergyNameTextController.text,
                                  'synergyDescription': synergyDescriptionTextController.text,
//                                  'serviceType': selectedServiceTypeName,
//                                  'parentCompany': parentCompanyTextController.text,
//                                  'serviceTaskDescription': taskTextController.text,
                                  'synergyValues': synergyDescriptionTextController.text,
                                  'Sender': "tester@gmail.com",
                                });
                              } else {
//                                addingNewSynergies.removeAt(index);
//                                addingNewSynergies.insert(
//                                    index, NewSynergies);
                                _firestore
                                    .collection(userUid+'/Bc8_synergies/addSynergies')
                                    .document(addingNewSynergies[index].ID)
                                    .updateData({
                                  'synergyName': synergyNameTextController.text,
                                  'synergyDescription': synergyDescriptionTextController.text,
//                                  'serviceType': selectedServiceTypeName,
//                                  'parentCompany': parentCompanyTextController.text,
//                                  'serviceTaskDescription': taskTextController.text,
                                  'synergyValues': synergyDescriptionTextController.text,
                                  'Sender': "tester@gmail.com",
                                });
                              }

                              synergyNameTextController.clear();
                              synergyDescriptionTextController.clear();
                              synergyValueTextController.clear();
                              selectedServiceTypeName = '';
                              selectedServiceUsagePercentage = '';
                              Navigator.pop(context);
//                              Navigator.push(context, new MaterialPageRoute(builder: (context) => BcAddSynergies()),
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
                            synergyNameTextController.clear();
                            synergyDescriptionTextController.clear();
                            synergyValueTextController.clear();
                            selectedServiceTypeName = '';
                            selectedServiceUsagePercentage = '';
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),);
  }
}
