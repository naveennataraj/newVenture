import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step7_BusinessModelElements/ContentBcIntellectualAssets.dart';
import 'package:iventure001/Constants/DropDown.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:iventure001/Constants/ResposiveLayout.dart';
import 'package:iventure001/Widgets/AddIPAssetButton.dart';

class BcIntellectualDialogue extends StatefulWidget {
  final int index;
  const BcIntellectualDialogue({this.index});
  @override
  _BcIntellectualDialogueState createState() => _BcIntellectualDialogueState(index);
}

var CodeDescriptionlabelColor = Color(0XFF919191);
bool validCodeDescription = true;
var CodeDescriptionTextController = TextEditingController();
final CodeDescriptionFocusNode = new FocusNode();
String CodeDescription;

var AdditionalDetailslabelColor = Color(0XFF919191);
bool validAdditionalDetails = true;
var AdditionalDetailsTextController = TextEditingController();
final AdditionalDetailsFocusNode = new FocusNode();
String AdditionalDetailsDescription;

class _BcIntellectualDialogueState extends State<BcIntellectualDialogue> {
  int index;
  final _firestore = Firestore.instance;
  _BcIntellectualDialogueState(this.index);
  String selectedIntellectualAsset;

  @override
  void initState() {
    super.initState();

    if (index != null) {
      CodeDescriptionTextController = TextEditingController(
          text: addingIntellectualAssets[index].intellectualCode);
      AdditionalDetailsTextController = TextEditingController(
          text: addingIntellectualAssets[index].intellectualDetails);
      selectedIntellectualAsset = addingIntellectualAssets[widget.index].intellectualProperty;
    } else{
      CodeDescriptionTextController.clear();
      AdditionalDetailsTextController.clear();
      selectedIntellectualAsset = null;
    }
    //intellectualAssetsDropDown = buildDropDownMenuItems(IntellectualAssets);
  }

  var dropBorderColor = Color(0xFFABABAB);
  var dropValuerColor = Color(0xFFE95420);

  validator() {
    setState(() {
      CodeDescriptionTextController.text.isEmpty
          ? validCodeDescription = false
          : validCodeDescription = true;
      CodeDescriptionTextController.text.isEmpty
          ? CodeDescriptionlabelColor = Color(0xFFF53E70)
          : CodeDescriptionlabelColor = Color(0xFF919191);
      AdditionalDetailsTextController.text.isEmpty
          ? validAdditionalDetails = false
          : validAdditionalDetails = true;
      AdditionalDetailsTextController.text.isEmpty
          ? AdditionalDetailslabelColor = Color(0xFFF53E70)
          : AdditionalDetailslabelColor = Color(0xFF919191);
      (selectedIntellectualAsset == null)
          ? dropBorderColor = Color(0xFFF53E70)
          : dropBorderColor = Color(0xFFABABAB);
      (selectedIntellectualAsset == null)
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
        //height: 480, // MediaQuery.of(context).size.height * 0.70,
        width: 800, // MediaQuery.of(context).size.width * 0.5,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "Add IP Asset:",
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
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
                        'What is the nature of intellectual property you are trying to protect?',
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
                              selectedIntellectualAsset = newValue;
                              //selectedIntellectualAsset = SelectedIntellectualAsset.name;
                            });
                          },
                          items: IntellectualAssetsList.map((String singleItem) {
                            return DropdownMenuItem<String>(
                                value: singleItem,
                                child: Text(singleItem));
                          }).toList(),
                          //intellectualAssetsDropDown,
                          value: selectedIntellectualAsset,
                        ),
                      ),
                    ],
                  )

                  :
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 30),

                        child: Text(
                          'What is the nature of intellectual property you are trying to protect?',
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 13),
                          maxLines: 2,
                        ),
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
                              selectedIntellectualAsset = newValue;
                              //selectedIntellectualAsset = SelectedIntellectualAsset.name;
                            });
                          },
                          items: IntellectualAssetsList.map((String singleItem) {
                            return DropdownMenuItem<String>(
                                value: singleItem,
                                child: Text(singleItem));
                          }).toList(),
                          //intellectualAssetsDropDown,
                          value: selectedIntellectualAsset,
                        ),
                      ),
                    ],
                  )
                  )
                ),
              ),

              TextFieldWidget(
                labelText:
                "Provide proctectable assets",
                maxLines: 3,
                validText: validCodeDescription,
                myFocusNode: CodeDescriptionFocusNode,
                myTextController: CodeDescriptionTextController,
                textCollecter: CodeDescription,
                helperText:
                'Include all the proctectable assets one after another separted by coma',
                labelcolour: CodeDescriptionlabelColor,
              ),
              TextFieldWidget(
                labelText:
                "Additional details",
                maxLines: 3,
                validText: validAdditionalDetails,
                myFocusNode: AdditionalDetailsFocusNode,
                myTextController: AdditionalDetailsTextController,
                textCollecter: AdditionalDetailsDescription,
                helperText:
                'If any additional notes needs to be included, please add it in this section',
                labelcolour: AdditionalDetailslabelColor,
              ),

              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AddIpAssetDetailButton(
                      routeName: '/addproductgoals',
                      onTap: () {

                        if(CodeDescriptionTextController.text != '' && AdditionalDetailsTextController.text != '' &&
                            selectedIntellectualAsset != null ) {
                          setState(() {
                            final NewProductFeature = ContentBcIntellectualAssets(
                              intellectualProperty:
                              selectedIntellectualAsset,
                              intellectualCode:
                              CodeDescriptionTextController.text,
                              intellectualDetails: AdditionalDetailsTextController.text,
                              //FeatureType: clickedRadio)
                            );

                            if (index == null) {
                              addingIntellectualAssets.add(
                                  NewProductFeature);

                              _firestore.collection('$currentUser/Bc7_businessModelElements/addIntellectualProperties').add({
                                'intellectualProperty': selectedIntellectualAsset,
                                'intellectualCode': CodeDescriptionTextController.text,
                                'intellectualDetails': AdditionalDetailsTextController.text,
                                'Sender': currentUser,
                              });

                            } else {
//                              addingIntellectualAssets.removeAt(index);
//                              addingIntellectualAssets.insert(
//                                  index, NewProductFeature);
                              _firestore
                                  .collection('$currentUser/Bc7_businessModelElements/addIntellectualProperties')
                                  .document(addingIntellectualAssets[index].ID)
                                  .updateData({
                                'intellectualProperty': selectedIntellectualAsset,
                                'intellectualCode': CodeDescriptionTextController.text,
                                'intellectualDetails': AdditionalDetailsTextController.text,
                                'Sender': currentUser,
                              });
                            }
                            Navigator.pop(context);
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
                        CodeDescriptionTextController.clear();
                        AdditionalDetailsTextController.clear();
                        selectedIntellectualAsset = null;
                        //clickedRadio = 0;

                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),),
      ),);
  }
}
