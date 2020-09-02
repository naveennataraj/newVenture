import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step7_BusinessModelElements/ContentAsAService.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step7_BusinessModelElements/BcAsAServiceOfferings.dart';
import 'package:iventure001/Constants/DropDown.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Widgets/AddGenericButton.dart';
import 'package:iventure001/Constants/ResposiveLayout.dart';


class BcAsaServiceDialogue extends StatefulWidget {
  final int index;
  const BcAsaServiceDialogue({this.index});

  @override
  _BcAsaServiceDialogueState createState() => _BcAsaServiceDialogueState(index);
}

var serviceLabelColor = Color(0XFF919191);
bool validService = true;
var serviceTextController = TextEditingController();
final serviceFocusNode = new FocusNode();
String serviceText;

var descriptionLabelColor = Color(0XFF919191);
bool validDescription = true;
var descriptionTextController = TextEditingController();
final descriptionFocusNode = new FocusNode();
String descriptionText;

var parentCompanyLabelColor = Color(0XFF919191);
bool validParentCompany = true;
var parentCompanyTextController = TextEditingController();
final parentCompanyFocusNode = new FocusNode();
String parentCompanyText;

var taskLabelColor = Color(0XFF919191);
bool validTask = true;
var taskTextController = TextEditingController();
final taskFocusNode = new FocusNode();
String taskText;


class _BcAsaServiceDialogueState extends State<BcAsaServiceDialogue> {
  final _firestore = Firestore.instance;
  int index;
  _BcAsaServiceDialogueState(this.index);

  String selectedServiceTypeName;
  String selectedServiceUsagePercentage;

  @override
  void initState() {
    super.initState();

    if (index != null) {
      serviceTextController = TextEditingController(
          text: addingAsaService[index].serviceName);
      descriptionTextController = TextEditingController(
          text: addingAsaService[index].serviceDescription);
      parentCompanyTextController = TextEditingController(
          text: addingAsaService[index].parentCompany);
      taskTextController = TextEditingController(
          text: addingAsaService[index].serviceTaskDescription);
      selectedServiceTypeName = addingAsaService[widget.index].serviceType;
      selectedServiceUsagePercentage = addingAsaService[widget.index].servicePercentage;
    } else {
      serviceTextController.clear();
      descriptionTextController.clear();
      parentCompanyTextController.clear();
      taskTextController.clear();
      selectedServiceTypeName = null;
      selectedServiceUsagePercentage = null;
    }
  }
  var dropBorderColor = Color(0xFFABABAB);
  var usageDropBorderColor = Color(0xFFABABAB);
  var dropValuerColor = Color(0xFFE95420);

  validator() {
    setState(() {
      serviceTextController.text.isEmpty
          ? validService = false
          : validService = true;
      serviceTextController.text.isEmpty
          ? serviceLabelColor = Color(0xFFF53E70)
          : serviceLabelColor = Color(0xFF919191);
      descriptionTextController.text.isEmpty
          ? validDescription = false
          : validDescription  = true;
      descriptionTextController.text.isEmpty
          ? descriptionLabelColor = Color(0xFFF53E70)
          : descriptionLabelColor = Color(0xFF919191);
      parentCompanyTextController.text.isEmpty
          ? validParentCompany = false
          : validParentCompany = true;
      parentCompanyTextController.text.isEmpty
          ? parentCompanyLabelColor = Color(0xFFF53E70)
          : parentCompanyLabelColor = Color(0xFF919191);
      taskTextController.text.isEmpty
          ? validTask = false
          : validTask = true;
      taskTextController.text.isEmpty
          ? taskLabelColor = Color(0xFFF53E70)
          : taskLabelColor = Color(0xFF919191);
      (selectedServiceTypeName == null)
          ? dropBorderColor = Color(0xFFF53E70)
          : dropBorderColor = Color(0xFFABABAB);
      (selectedServiceTypeName == null)
          ? dropValuerColor = Color(0xFFF53E70)
          : dropValuerColor = Color(0xFFE95420);
      (selectedServiceUsagePercentage == null)
          ? usageDropBorderColor = Color(0xFFF53E70)
          : usageDropBorderColor = Color(0xFFABABAB);
      (selectedServiceUsagePercentage == null)
          ? dropValuerColor = Color(0xFFF53E70)
          : dropValuerColor = Color(0xFFE95420);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)), //this right here
        child: Container(
          //height: 900, // MediaQuery.of(context).size.height * 0.93,
          width: 800, //MediaQuery.of(context).size.width * 0.5,
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Add an 'As a service' Offering:",
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextFieldWidget(
                    labelText: "Please provide the name of the service",
                    maxLines: 1,
                    validText: validService,
                    myFocusNode: serviceFocusNode,
                    myTextController: serviceTextController,
                    textCollecter: serviceText,
                    helperText:
                    '',
                    labelcolour: serviceLabelColor,
                  ),
                  TextFieldWidget(
                    labelText:
                    "Please provide a description for the service",
                    maxLines: 3,
                    validText: validDescription,
                    myFocusNode: descriptionFocusNode,
                    myTextController: descriptionTextController,
                    textCollecter: descriptionText,
                    helperText:
                    '',
                    labelcolour: descriptionLabelColor,
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(width: 1, color: dropBorderColor),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                      (!ResponsiveLayout.isSmallScreen(context) ?

                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(
                            'Please provide the type of service',
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 16),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: DropdownButton(
                              hint: Text(
                                'Choose',
                                style: TextStyle(
                                  color: dropValuerColor,
                                ),
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  selectedServiceTypeName = newValue;
                                  //selectedServiceTypeName = SelectedServiceType.name;
                                });
                              },
                              items: ServiceTypeList.map((String singleItem) {
                                return DropdownMenuItem<String>(
                                    value: singleItem,
                                    child: Text(singleItem));
                              }).toList(),
                              //serviceTypeDropDown,
                              value: selectedServiceTypeName,
                            ),
                          ),
                        ],
                      )

                        :
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Please provide the type of service',
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 13),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: DropdownButton(
                              hint: Text(
                                'Choose',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: dropValuerColor,
                                ),
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  selectedServiceTypeName = newValue;
                                  //selectedServiceTypeName = SelectedServiceType.name;
                                });
                              },
                              items: ServiceTypeList.map((String singleItem) {
                                return DropdownMenuItem<String>(
                                    value: singleItem,
                                    child: Text(singleItem));
                              }).toList(),
                              //serviceTypeDropDown,
                              value: selectedServiceTypeName,
                            ),
                          ),
                        ],
                      )

                      )
                    ),
                  ),

                  TextFieldWidget(
                    labelText:
                    "Please provide the parent company for this service",
                    maxLines: 1,
                    validText: validParentCompany,
                    myFocusNode: parentCompanyFocusNode,
                    myTextController: parentCompanyTextController,
                    textCollecter: parentCompanyText,
                    helperText: '',
                    labelcolour: parentCompanyLabelColor,
                  ),
                  TextFieldWidget(
                    labelText:
                    "Which tasks does this service assist with?",
                    maxLines: 3,
                    validText: validTask,
                    myFocusNode: taskFocusNode,
                    myTextController: taskTextController,
                    textCollecter: taskText,
                    helperText: '',
                    labelcolour: taskLabelColor,
                  ),

                  Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(width: 1, color: usageDropBorderColor),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                      (!ResponsiveLayout.isSmallScreen(context) ?


                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(
                            'Please Approx. percentage of time saved as a result of service usage',
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 16),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: DropdownButton(
                              hint: Text(
                                'Choose',
                                style: TextStyle(
                                  color: dropValuerColor,
                                ),
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  selectedServiceUsagePercentage = newValue;
                                  //selectedServiceUsagePercentage = SelectedServiceUsage.name;
                                },);
                              },
                              items: ServiceUsageList.map((String singleItem) {
                                return DropdownMenuItem<String>(
                                    value: singleItem,
                                    child: Text(singleItem));
                              }).toList(),
                              //serviceUsageDropDown,
                              value: selectedServiceUsagePercentage,
                            ),
                          ),
                        ],
                      )
                      :
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Please Approx. percentage of time saved as a result of service usage',
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 13),
                            maxLines: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: DropdownButton(
                              hint: Text(
                                'Choose',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: dropValuerColor,
                                ),
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  selectedServiceUsagePercentage = newValue;
                                  //selectedServiceUsagePercentage = SelectedServiceUsage.name;
                                },);
                              },
                              items: ServiceUsageList.map((String singleItem) {
                                return DropdownMenuItem<String>(
                                    value: singleItem,
                                    child: Text(singleItem));
                              }).toList(),
                              //serviceUsageDropDown,
                              value: selectedServiceUsagePercentage,
                            ),
                          ),
                        ],
                      )
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AddGenericButton(
                        buttonName: 'ADD OFFERING',
                          onTap: () {

                          if(serviceTextController.text != '' && descriptionTextController.text != '' && parentCompanyTextController.text != '' && taskTextController.text != '' &&
                              selectedServiceTypeName != null && selectedServiceUsagePercentage != null) {
                            setState(() {
                              final NewComponentProduct = AddAsaServiceOffering(
                                serviceName: serviceTextController.text,
                                serviceDescription: descriptionTextController.text,
                                serviceType: selectedServiceTypeName,
                                parentCompany: parentCompanyTextController.text,
                                serviceTaskDescription: taskTextController.text,
                                servicePercentage:selectedServiceUsagePercentage,
                              );

                              if (index == null) {
                                addingAsaService.add(
                                    NewComponentProduct);
                                _firestore.collection('$currentUser/Bc7_businessModelElements/addServices').add({
                                  'serviceName': serviceTextController.text,
                                  'serviceDescription': descriptionTextController.text,
                                  'serviceType': selectedServiceTypeName,
                                  'parentCompany': parentCompanyTextController.text,
                                  'serviceTaskDescription': taskTextController.text,
                                  'servicePercentage': selectedServiceUsagePercentage,
                                  'Sender': currentUser,
                                });


                              } else {
//                                  addingAsaService.removeAt(index);
//                                  addingAsaService.insert(
//                                      index, NewComponentProduct);
                                _firestore
                                    .collection('$currentUser/Bc7_businessModelElements/addServices')
                                    .document(addingAsaService[index].ID)
                                    .updateData({
                                  'serviceName': serviceTextController.text,
                                  'serviceDescription': descriptionTextController.text,
                                  'serviceType': selectedServiceTypeName,
                                  'parentCompany': parentCompanyTextController.text,
                                  'serviceTaskDescription': taskTextController.text,
                                  'servicePercentage': selectedServiceUsagePercentage,
                                  'Sender': currentUser,
                                });
                              }

//                              serviceTextController.clear();
//                              descriptionTextController.clear();
//                              parentCompanyTextController.clear();
//                              taskTextController.clear();
//                              selectedServiceTypeName = null;
//                              selectedServiceUsagePercentage = null;

                              Navigator.pop(context);
//                              Navigator.push(context, new MaterialPageRoute(builder: (context) => BcAsaServiceOffering()),
//                              )
//                                  .then((value) => setState(() {}),);

                            });
                          } else{
                            validator();
                          }

                          },
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        CancelButtton(
                          OnTap: () {
                            serviceTextController.clear();
                            descriptionTextController.clear();
                            parentCompanyTextController.clear();
                            taskTextController.clear();
                            selectedServiceTypeName = null;
                            selectedServiceUsagePercentage= null;

                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),);
  }
}
