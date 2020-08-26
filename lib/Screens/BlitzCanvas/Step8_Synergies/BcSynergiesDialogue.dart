import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step8_Synergies/ContentSynergies.dart';
import 'package:iventure001/Constants/MultivalueDropDown.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:iventure001/Widgets/AddGenericButton.dart';
import 'package:iventure001/Constants/ResposiveLayout.dart';

class BcSynergiesDialogue extends StatefulWidget {
  final int index;
  const BcSynergiesDialogue({this.index});
  @override
  _BcSynergiesDialogueState createState() => _BcSynergiesDialogueState(index);
}


Color CheckTextActive = Colors.black;
Color CheckTextInActive = Color(0XFFABABAB);

class _BcSynergiesDialogueState extends State<BcSynergiesDialogue> {

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


  final _firestore = Firestore.instance;
  int index;
  _BcSynergiesDialogueState(this.index);
  List<String> _tempSelectedCities = [];

  String selectedServiceTypeName;
  String selectedServiceUsagePercentage;
  bool checkedValueProposition = false;
  bool checkedCustomerSegment = false;
  bool checkedRevenueStream = false;
  bool checkedDistributionChannel = false;
  bool checkedCustomerRelationship = false;
  bool checkedKeyActivity = false;
  bool checkedKeyResource = false;
  bool checkedKeyPartner = false;
  bool checkedCostStructure = false;



  List<String> BMCElementsList = [
    'Value proposition',
    'Customer segment',
    'Revenue stream',
    'Distribution channel',
    'Customer relationship',
    'Key activity',
    'Key resource',
    'Key partner',
    'Cost Structure',
  ];

  List<String> selectedCities = [];
  ValueChanged<List<String>> onSelectedCitiesListChanged;

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
      checkedValueProposition = addingNewSynergies[index].synergyValueProposition;
      checkedCustomerSegment = addingNewSynergies[index].synergyCustomerSegment;
      checkedRevenueStream = addingNewSynergies[index].synergyRevenueStream;
      checkedDistributionChannel = addingNewSynergies[index].synergyDistributionChannel;
      checkedCustomerRelationship = addingNewSynergies[index].synergyCustomerRelationship;
      checkedKeyActivity = addingNewSynergies[index].synergyKeyActivity;
      checkedKeyResource = addingNewSynergies[index].synergyKeyResource;
      checkedKeyPartner = addingNewSynergies[index].synergyKeyPartner;
      checkedCostStructure = addingNewSynergies[index].synergyCostStructure;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)), //this right here
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        height: 900, // MediaQuery.of(context).size.height * 0.90,
        width: 800, // MediaQuery.of(context).size.width * 0.5,
        child: CustomScrollView (
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      child: Text(
                        "Add a Potential Synergy:",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TextFieldWidget(
                      labelText: "What would you like to call this synergy?",
                      maxLines: 2,
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
                      child:
                      (!ResponsiveLayout.isSmallScreen(context) ?
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              'Please provide the type of service',
                              style: TextStyle(color: Colors.grey.shade600,
                                  fontSize: (ResponsiveLayout.isSmallScreen(context) ?  12: ResponsiveLayout.isMediumScreen(context) ? 15 : 16)),
                            ),
                          ),
                          //Spacer(),
                          Row(
                            children: <Widget>[
                              ReusableCheckBox(BMCElementsList[0], checkedValueProposition, (bool value) {
                                setState(() {
                                  checkedValueProposition = value;
                                });
                              },),

                              ReusableCheckBox(BMCElementsList[1], checkedCustomerSegment, (bool value) {
                                setState(() {
                                  checkedCustomerSegment = value;
                                });
                              },),
                              ReusableCheckBox(BMCElementsList[2], checkedRevenueStream, (bool value) {
                                setState(() {
                                  checkedRevenueStream = value;
                                });
                              },),
//
                            ],
                          ),

                          Row(
                            children: <Widget>[
                              ReusableCheckBox(BMCElementsList[3], checkedDistributionChannel, (bool value) {
                                setState(() {
                                  checkedDistributionChannel = value;
                                });
                              },),

                              ReusableCheckBox(BMCElementsList[4], checkedCustomerRelationship, (bool value) {
                                setState(() {
                                  checkedCustomerRelationship = value;
                                });
                              },),
                              ReusableCheckBox(BMCElementsList[5], checkedKeyActivity, (bool value) {
                                setState(() {
                                  checkedKeyActivity = value;
                                });
                              },),
//
                            ],
                          ),

                          Row(
                            children: <Widget>[
                              ReusableCheckBox(BMCElementsList[6], checkedKeyResource, (bool value) {
                                setState(() {
                                  checkedKeyResource = value;
                                });
                              },),

                              ReusableCheckBox(BMCElementsList[7], checkedKeyPartner, (bool value) {
                                setState(() {
                                  checkedKeyPartner = value;
                                });
                              },),
                              ReusableCheckBox(BMCElementsList[8], checkedCostStructure, (bool value) {
                                setState(() {
                                  checkedCostStructure = value;
                                });
                              },),
//
                            ],
                          ),

                        ],
                      )
                      :
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  'Please provide the type of service',
                                  style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  ReusableCheckBox(BMCElementsList[0], checkedValueProposition, (bool value) {
                                    setState(() {
                                      checkedValueProposition = value;
                                    });
                                  },),

                                  ReusableCheckBox(BMCElementsList[1], checkedCustomerSegment, (bool value) {
                                    setState(() {
                                      checkedCustomerSegment = value;
                                    });
                                  },),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  ReusableCheckBox(BMCElementsList[2], checkedValueProposition, (bool value) {
                                    setState(() {
                                      checkedValueProposition = value;
                                    });
                                  },),

                                  ReusableCheckBox(BMCElementsList[3], checkedCustomerSegment, (bool value) {
                                    setState(() {
                                      checkedCustomerSegment = value;
                                    });
                                  },),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  ReusableCheckBox(BMCElementsList[4], checkedValueProposition, (bool value) {
                                    setState(() {
                                      checkedValueProposition = value;
                                    });
                                  },),

                                  ReusableCheckBox(BMCElementsList[5], checkedCustomerSegment, (bool value) {
                                    setState(() {
                                      checkedCustomerSegment = value;
                                    });
                                  },),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  ReusableCheckBox(BMCElementsList[6], checkedValueProposition, (bool value) {
                                    setState(() {
                                      checkedValueProposition = value;
                                    });
                                  },),

                                  ReusableCheckBox(BMCElementsList[7], checkedCustomerSegment, (bool value) {
                                    setState(() {
                                      checkedCustomerSegment = value;
                                    });
                                  },),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  ReusableCheckBox(BMCElementsList[8], checkedValueProposition, (bool value) {
                                    setState(() {
                                      checkedValueProposition = value;
                                    });
                                  },),

                                ],
                              ),
                            ],
                          )


                      ),
                    ),
                    TextFieldWidget(
                      labelText:
                      "Please provide a detailed description of the synergy",
                      maxLines: 3,
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
                      maxLines: 3,
                      validText: validSynergyValue,
                      myFocusNode: synergyValueFocusNode,
                      myTextController: synergyValueTextController,
                      textCollecter: synergyValueText,
                      helperText: 'This field is required',
                      labelcolour: synergyValueLabelColor,
                    ),


                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AddGenericButton(
                            buttonName: 'ADD SYNERGY',
                            onTap: () {
                              setState(() {
                                final NewSynergies = ContentSynergies(
                                  synergyName: synergyNameTextController.text,
                                  synergyValueProposition: checkedValueProposition,
                                  synergyCustomerSegment: checkedCustomerSegment,
                                  synergyRevenueStream: checkedRevenueStream,
                                  synergyDistributionChannel: checkedDistributionChannel,
                                  synergyCustomerRelationship: checkedCustomerRelationship,
                                  synergyKeyActivity: checkedKeyActivity,
                                  synergyKeyResource:checkedKeyResource,
                                  synergyKeyPartner: checkedKeyPartner,
                                  synergyCostStructure: checkedCostStructure,
                                  synergyDescription: synergyDescriptionTextController.text,
                                  synergyValues: synergyValueTextController.text,
                                );

                                if (index == null) {
                                  addingNewSynergies.add(
                                      NewSynergies);
                                  _firestore.collection('$currentUser/Bc8_synergies/addSynergies').add({
                                    'synergyName': synergyNameTextController.text,
                                    'synergyDescription': synergyDescriptionTextController.text,
                                    'checkedValueProposition': checkedValueProposition,
                                    'checkedCustomerSegment': checkedCustomerSegment,
                                    'checkedRevenueStream': checkedRevenueStream,
                                    'checkedDistributionChannel': checkedDistributionChannel,
                                    'checkedCustomerRelationship': checkedCustomerRelationship,
                                    'checkedKeyActivity': checkedKeyActivity,
                                    'checkedKeyResource': checkedKeyResource,
                                    'checkedKeyPartner': checkedKeyPartner,
                                    'checkedCostStructure': checkedCostStructure,
                                    'synergyValues': synergyValueTextController.text,
                                    'Sender': currentUser,
                                  });
                                } else {
//                                addingNewSynergies.removeAt(index);
//                                addingNewSynergies.insert(
//                                    index, NewSynergies);
                                  _firestore
                                      .collection('$currentUser/Bc8_synergies/addSynergies')
                                      .document(addingNewSynergies[index].ID)
                                      .updateData({
                                    'synergyName': synergyNameTextController.text,
                                    'synergyDescription': synergyDescriptionTextController.text,
                                    'checkedValueProposition': checkedValueProposition,
                                    'checkedCustomerSegment': checkedCustomerSegment,
                                    'checkedRevenueStream': checkedRevenueStream,
                                    'checkedDistributionChannel': checkedDistributionChannel,
                                    'checkedCustomerRelationship': checkedCustomerRelationship,
                                    'checkedKeyActivity': checkedKeyActivity,
                                    'checkedKeyResource': checkedKeyResource,
                                    'checkedKeyPartner': checkedKeyPartner,
                                    'checkedCostStructure': checkedCostStructure,
                                    'synergyValues': synergyValueTextController.text,
                                    'Sender': currentUser,
                                  });
                                }

                                synergyNameTextController.clear();
                                synergyDescriptionTextController.clear();
                                synergyValueTextController.clear();
                                selectedServiceTypeName = '';
                                selectedServiceUsagePercentage = '';
                                checkedValueProposition = false;
                                checkedCustomerSegment = false;
                                checkedRevenueStream = false;
                                checkedDistributionChannel = false;
                                checkedCustomerRelationship = false;
                                checkedKeyActivity = false;
                                checkedKeyResource = false;
                                checkedKeyPartner = false;
                                checkedCostStructure = false;
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
                              checkedValueProposition = false;
                              checkedCustomerSegment = false;
                              checkedRevenueStream = false;
                              checkedDistributionChannel = false;
                              checkedCustomerRelationship = false;
                              checkedKeyActivity = false;
                              checkedKeyResource = false;
                              checkedKeyPartner = false;
                              checkedCostStructure = false;
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ], ),
      ),);
  }
}

class ReusableCheckBox extends StatelessWidget {
  final String title;
  final bool checked;
  final Function onTap;
  ReusableCheckBox(this.title, this.checked, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CheckboxListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: (ResponsiveLayout.isSmallScreen(context) ?  12: ResponsiveLayout.isMediumScreen(context) ? 15 : 16),
              fontFamily: 'OpenSans',
              color:
              checked ? CheckTextActive : CheckTextInActive),
        ),
        controlAffinity: ListTileControlAffinity.leading,
        value: checked,
        onChanged: onTap,
        activeColor: Color(0XFFE95420),
      ),
    );
  }
}
