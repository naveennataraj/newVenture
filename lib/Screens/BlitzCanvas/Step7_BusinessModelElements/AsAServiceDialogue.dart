import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step7_BusinessModelElements/ContentAsAService.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step7_BusinessModelElements/BcAsAServiceOfferings.dart';
import 'package:iventure001/Constants/DropDown.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:iventure001/Widgets/AddGenericButton.dart';


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
    }

    serviceTypeDropDown = buildDropDownMenuItems(ServiceType);
    serviceUsageDropDown = buildDropDownMenuItems(ServiceUsage);
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
                      maxLines: 1,
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
                              padding: const EdgeInsets.only(right: 20),
                              child: DropdownButton(
                                hint: Text(
                                  'Choose',
                                  style: TextStyle(
                                    color: Color(0XFFE95420),
                                  ),
                                ),
                                onChanged: (newValue) {
                                  setState(() {
                                    SelectedServiceType = newValue;
                                    selectedServiceTypeName = SelectedServiceType.name;
                                  });
                                },
                                items: serviceTypeDropDown,
                                value: SelectedServiceType,
                              ),
                            ),
                          ],
                        ),
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
                      maxLines: 1,
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
                          border: Border.all(width: 1, color: Color(0XFFABABAB)),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
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
                                    color: Color(0XFFE95420),
                                  ),
                                ),
                                onChanged: (newValue) {
                                  setState(() {
                                    SelectedServiceUsage = newValue;
                                    selectedServiceUsagePercentage = SelectedServiceUsage.name;
                                  },);
                                },
                                items: serviceUsageDropDown,
                                value: SelectedServiceUsage,
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
                          AddGenericButton(
                          buttonName: 'ADD OFFERING',
                            onTap: () {
                              setState(() {
                                final NewComponentProduct = AddAsaServiceOffering(
                                    serviceName: serviceTextController.text,
                                    serviceDescription: descriptionTextController.text,
                                    serviceType: selectedServiceUsagePercentage,
                                    parentCompany: parentCompanyTextController.text,
                                    serviceTaskDescription: taskTextController.text,
                                    servicePercentage:selectedServiceUsagePercentage,
                                    );

                                if (index == null) {
                                  addingAsaService.add(
                                      NewComponentProduct);
                                } else {
                                  addingAsaService.removeAt(index);
                                  addingAsaService.insert(
                                      index, NewComponentProduct);
                                }

                                serviceTextController.clear();
                                descriptionTextController.clear();
                                parentCompanyTextController.clear();
                                taskTextController.clear();

                                //Navigator.pop(context);
                                Navigator.push(context, new MaterialPageRoute(builder: (context) => BcAsaServiceOffering()),
                                )
                                    .then((value) => setState(() {}),);

                              });
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
