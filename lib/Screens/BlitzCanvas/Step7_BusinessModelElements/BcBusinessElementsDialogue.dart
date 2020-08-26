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
  _BcBusinessElementsDialogueState createState() => _BcBusinessElementsDialogueState(index);
}

var FeatureDescriptionlabelColor = Color(0XFF919191);
bool validFeatureDescription = true;
var FeatureDescriptionTextController = TextEditingController();
final FeatureDescriptionFocusNode = new FocusNode();
String FeatureDescription;


class _BcBusinessElementsDialogueState extends State<BcBusinessElementsDialogue> {
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
    }

    //bmcElementDropDown = buildDropDownMenuItems(BMCElements);


  }

  _BcBusinessElementsDialogueState(this.index);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)), //this right here
      child: Container(
        height: 600, // MediaQuery.of(context).size.height * 0.70,
        width: 800, // MediaQuery.of(context).size.width * 0.5,
        child: SingleChildScrollView(
          padding:
          const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "Add a Foundational Detail:",
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),

              Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(width: 1, color: Color(0XFFABABAB)),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: (!ResponsiveLayout.isSmallScreen(context) ?
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        'Please provide the type of BMC element to be added',
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
                              selectedElement = newValue;
                            });
                          },
                          items:  BMCElementsList.map((String singleItem) {
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
                  :
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Please provide the type of BMC element to be added',
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 15),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: DropdownButton(
                          hint: Text(
                            'Choose',
                            style: TextStyle(
                              color: Color(0XFFE95420),
                            ),
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              selectedElement = newValue;
                            });
                          },
                          items:  BMCElementsList.map((String singleItem) {
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
                  ))

                ),
              ),

              TextFieldWidget(
                labelText:
                "Provide a description for This BMC element",
                maxLines: 1,
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
                  'This feature is currently offered by a competing product',
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
                    AddGenericButton(
                      buttonName:   'Add element',
                      onTap: () {
                        Navigator.popAndPushNamed(context, '/addproductgoals');
                        setState(() {
                          final NewProductFeature = ContentBcElements(
                              elementTitle:
                              selectedElement,
                              elementDescription:
                              FeatureDescriptionTextController.text,
                              elementChecked: checked,
                              //FeatureType: clickedRadio)
                          );

                          if (index == null) {
                            addingNewBusinessElement.add(
                                NewProductFeature);
                            _firestore.collection('$currentUser/Bc7_businessModelElements/addElements').add({
                              'elementTitle': selectedElement,
                              'elementDescription': FeatureDescriptionTextController.text,
                              'elementChecked': checked,
                              'Sender': currentUser,
                            });

                          } else {
//                              addingNewBusinessElement.removeAt(index);
//                              addingNewBusinessElement.insert(
//                                  index, NewProductFeature);
                            _firestore
                                .collection('$currentUser/Bc7_businessModelElements/addElements')
                                .document(addingNewBusinessElement[index].ID)
                                .updateData({
                              'elementTitle': selectedElement,
                              'elementDescription': FeatureDescriptionTextController.text,
                              'elementChecked': checked,
                              'Sender': currentUser,
                            });
                          }

                          FeatureDescriptionTextController.clear();
                          checked = false;
                          selectedElement = null;
                          //selectedTyped = 0;

                          Navigator.pop(context);
//                            Navigator.push(context, new MaterialPageRoute(builder: (context) => BcBusinessElements()),
//                            )
//                                .then((value) => setState(() {}),);
                        });
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
          ),),
      ),);
  }
}
