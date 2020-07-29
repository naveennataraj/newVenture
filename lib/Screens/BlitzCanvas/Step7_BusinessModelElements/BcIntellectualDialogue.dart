import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step7_BusinessModelElements/ContentBcIntellectualAssets.dart';
import 'package:iventure001/Constants/DropDown.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step7_BusinessModelElements/BcIntellectualProperties.dart';
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
      selectedIntellectualAsset = addingIntellectualAssets[index].intellectualProperty;
    }

    intellectualAssetsDropDown = buildDropDownMenuItems(IntellectualAssets);
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
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
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
                      border: Border.all(width: 1, color: Color(0XFFABABAB)),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
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
                                color: Color(0XFFE95420),
                              ),
                            ),
                            onChanged: (newValue) {
                              setState(() {
                                SelectedIntellectualAsset = newValue;
                                selectedIntellectualAsset = SelectedIntellectualAsset.name;
                              });
                            },
                            items: intellectualAssetsDropDown,
                            value: SelectedIntellectualAsset,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                TextFieldWidget(
                  labelText:
                  "Provide proctectable assets",
                  maxLines: 1,
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
                  maxLines: 1,
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
                            } else {
                              addingIntellectualAssets.removeAt(index);
                              addingIntellectualAssets.insert(
                                  index, NewProductFeature);
                            }

                            CodeDescriptionTextController.clear();
                            AdditionalDetailsTextController.clear();
                            selectedIntellectualAsset = '';
                            Navigator.pop(context);
//                            Navigator.push(context, new MaterialPageRoute(builder: (context) => BcIntellectualPropertyAssets()),
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
                          CodeDescriptionTextController.clear();
                          AdditionalDetailsTextController.clear();
                          selectedIntellectualAsset = '';
                          //clickedRadio = 0;

                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),),
        ),
      ),);
  }
}
