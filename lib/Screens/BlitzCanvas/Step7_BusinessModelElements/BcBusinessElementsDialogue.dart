import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step7_BusinessModelElements/ContentBcElements.dart';
import 'package:iventure001/Constants/DropDown.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:iventure001/Widgets/AddGenericButton.dart';
import 'package:iventure001/Constants/ResposiveLayout.dart';

class BcBusinessElementsDialogue extends StatefulWidget {
  final int index;
  const BcBusinessElementsDialogue({this.index});
  @override
  _BcBusinessElementsDialogueState createState() =>
      _BcBusinessElementsDialogueState(index);
}

class _BcBusinessElementsDialogueState
    extends State<BcBusinessElementsDialogue> {
  final _firestore = Firestore.instance;

  int index;
  bool checked = false;
  Color CheckTextActive = Colors.black;
  Color CheckTextInActive = Color(0XFFABABAB);
  String selectedElement;
  int selectedTyped;

  @override
  void initState() {
    super.initState();

    if (index != null) {
      FeatureDescriptionTextController = TextEditingController(
          text: addingNewBusinessElement[index].elementDescription);
      checked = addingNewBusinessElement[index].elementChecked;
      selectedElement = addingNewBusinessElement[widget.index].elementTitle;
      //selectedTyped = addingNewBusinessElement[index].featureType;
    } else {
      FeatureDescriptionTextController.clear();
      checked = false;
      selectedElement = null;
    }
    //bmcElementDropDown = buildDropDownMenuItems(BMCElements);
  }

  var FeatureDescriptionlabelColor = Color(0XFF919191);
  bool validFeatureDescription = true;
  var FeatureDescriptionTextController = TextEditingController();
  final FeatureDescriptionFocusNode = new FocusNode();
  String FeatureDescription;


  var dropBorderColor = Color(0xFFABABAB);
  var dropValuerColor = Color(0xFFE95420);

  validator() {
    setState(() {
      FeatureDescriptionTextController.text.isEmpty
          ? validFeatureDescription = false
          : validFeatureDescription = true;
      FeatureDescriptionTextController.text.isEmpty
          ? FeatureDescriptionlabelColor = Color(0xFFF53E70)
          : FeatureDescriptionlabelColor = Color(0xFF919191);
      (selectedElement == null)
          ? dropBorderColor = Color(0xFFF53E70)
          : dropBorderColor = Color(0xFFABABAB);
      (selectedElement == null)
          ? dropValuerColor = Color(0xFFF53E70)
          : dropValuerColor = Color(0xFFE95420);
    });
  }

  _BcBusinessElementsDialogueState(this.index);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)), //this right here
      child: Container(
        //height: 450, // MediaQuery.of(context).size.height * 0.70,
        width: 800, // MediaQuery.of(context).size.width * 0.5,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 8.0),
                child: Text(
                  "Add a Foundational Detail:",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
//                  Wrap(
//                    //crossAxisAlignment: WrapCrossAlignment.start,
//                    spacing: (!ResponsiveLayout.isSmallScreen(context) ? 20 : 5),
//                    alignment: WrapAlignment.spaceEvenly,
//                    direction: (!ResponsiveLayout.isSmallScreen(context) ? Axis.horizontal : Axis.vertical)   ,
//                    children: <Widget>[
//                      Padding(
//                        padding: const EdgeInsets.all(3.0),
//                        child: Text(
//                          'Please provide the type of BMC element to be added',
//                          style: TextStyle(
//                              color: Colors.grey.shade600,
//                            fontSize: 15.009,
//                          ),
//                          maxLines: 3,
//                        ),
//                      ),
//                      SizedBox(
//                        width: (!ResponsiveLayout.isSmallScreen(context) ? 130 : 0),
//                      ),
//                      //Spacer(),
//                      DropdownButton(
//                        hint: Text(
//                          'Choose',
//                          style: TextStyle(
//                            color: Color(0XFFE95420),
//                          ),
//                        ),
//                        onChanged: (newValue) {
//                          setState(() {
//                            selectedElement = newValue;
//                          });
//                        },
//                        items:  BMCElementsList.map((String singleItem) {
//                          return DropdownMenuItem<String>(
//                              value: singleItem,
//                              child: Text(singleItem));
//                        }).toList(),
//                        //(addingNewBusinessElement.length != 0) ? addingNewBusinessElement[index].elementTitle: BMCElementsList ,
//                        value: selectedElement,
//                        //(addingNewBusinessElement.length != 0) ? addingNewBusinessElement[index].selectedTyped : SelectedBcmElement,
//                      ),
//                    ],
//                  )

                        (!ResponsiveLayout.isSmallScreen(context)
                            ? Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Text(
                                    'Please provide the type of BMC element to be added',
                                    style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 16),
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
                                          selectedElement = newValue;
                                        });
                                      },
                                      items: BMCElementsList.map(
                                          (String singleItem) {
                                        return DropdownMenuItem<String>(
                                            value: singleItem,
                                            child: Text(singleItem));
                                      }).toList(),
                                      //(addingNewBusinessElement.length != 0) ? addingNewBusinessElement[index].elementTitle: BMCElementsList ,
                                      value: selectedElement,
                                      //(addingNewBusinessElement.length != 0) ? addingNewBusinessElement[index].selectedTyped : SelectedBcmElement,
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                //mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Please provide the type of BMC element to be added',
                                    style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 13),
                                  ),
                                  //Spacer(),
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
                                          selectedElement = newValue;
                                        });
                                      },
                                      items: BMCElementsList.map(
                                          (String singleItem) {
                                        return DropdownMenuItem<String>(
                                            value: singleItem,
                                            child: Text(singleItem));
                                      }).toList(),
                                      //(addingNewBusinessElement.length != 0) ? addingNewBusinessElement[index].elementTitle: BMCElementsList ,
                                      value: selectedElement,
                                      //(addingNewBusinessElement.length != 0) ? addingNewBusinessElement[index].selectedTyped : SelectedBcmElement,
                                    ),
                                  ),
                                ],
                              ))),
              ),
              TextFieldWidget(
                labelText: "Provide a description for This BMC element",
                maxLines: 2,
                validText: validFeatureDescription,
                myFocusNode: FeatureDescriptionFocusNode,
                myTextController: FeatureDescriptionTextController,
                textCollecter: FeatureDescription,
                helperText:
                    'Please ensure that the appropiate BMC element types is selected before entering the description',
                labelcolour: FeatureDescriptionlabelColor,
              ),
              CheckboxListTile(
                title: Text(
                  'This feature is currently offered by a competing product.',
                  style: TextStyle(
                      fontSize: (ResponsiveLayout.isSmallScreen(context)
                          ? 12
                          : ResponsiveLayout.isMediumScreen(context) ? 15 : 16),
                      color: checked ? CheckTextActive : CheckTextInActive),
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
                    AddGenericButton(
                      buttonName: 'Add element',
                      onTap: () {
                        if(FeatureDescriptionTextController.text != '' &&
                            selectedElement != null) {
//                          Navigator.popAndPushNamed(context, '/addproductgoals');
                          setState(() {
                            final NewProductFeature = ContentBcElements(
                              elementTitle: selectedElement,
                              elementDescription:
                              FeatureDescriptionTextController.text,
                              elementChecked: checked,
                              //FeatureType: clickedRadio)
                            );

                            if (index == null) {
                              addingNewBusinessElement.add(NewProductFeature);
                              _firestore
                                  .collection(
                                  '$currentUser/Bc7_businessModelElements/addElements')
                                  .add({
                                'elementTitle': selectedElement,
                                'elementDescription':
                                FeatureDescriptionTextController.text,
                                'elementChecked': checked,
                                'Sender': currentUser,
                              });
                            } else {
//                              addingNewBusinessElement.removeAt(index);
//                              addingNewBusinessElement.insert(
//                                  index, NewProductFeature);
                              _firestore
                                  .collection(
                                  '$currentUser/Bc7_businessModelElements/addElements')
                                  .document(addingNewBusinessElement[index].ID)
                                  .updateData({
                                'elementTitle': selectedElement,
                                'elementDescription':
                                FeatureDescriptionTextController.text,
                                'elementChecked': checked,
                                'Sender': currentUser,
                              });
                            }
                            Navigator.pop(context);
                          });
                        } else {
                          validator();
                        }

                      },
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    CancelButtton(
                      OnTap: () {
                        FeatureDescriptionTextController.clear();
                        checked = false;
                        selectedElement = null;
                        //selectedTyped = 0;

                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
