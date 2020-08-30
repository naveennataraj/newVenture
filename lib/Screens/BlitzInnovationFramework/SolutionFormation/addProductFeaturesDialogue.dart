import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionFormulation/addProductFeature.dart';
import 'package:iventure001/Widgets/AddProductFeatureButton.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';

class addProductFeaturesDialogue extends StatefulWidget {
  final int index;

  const addProductFeaturesDialogue({this.index});
  @override
  _addProductFeaturesDialogueState createState() =>
      _addProductFeaturesDialogueState(index);
}

class _addProductFeaturesDialogueState
    extends State<addProductFeaturesDialogue> {
  int index;

  bool checked = false;
  int clickedRadio;
  Color CheckTextActive = Colors.black;
  Color CheckTextInActive = Color(0XFFABABAB);
  var radio1Focus = new FocusNode();
  var radio2Focus = new FocusNode();
  var radio3Focus = new FocusNode();
  var radio4Focus = new FocusNode();

  var ProductFeaturelabelColor = Color(0XFF919191);
  bool validProductFeature = true;
  var ProductFeatureTextController = TextEditingController();
  final ProductFeatureFocusNode = new FocusNode();
  String ProductFeature;

  var FeatureDescriptionlabelColor = Color(0XFF919191);
  bool validFeatureDescription = true;
  var FeatureDescriptionTextController = TextEditingController();
  final FeatureDescriptionFocusNode = new FocusNode();
  String FeatureDescription;

  requestFocus(FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  _addProductFeaturesDialogueState(this.index);

  var radioButtonBorderColor = Color(0xFFABABAB);

  final _firestore = Firestore.instance;

  validator() {
    setState(() {
      ProductFeatureTextController.text.isEmpty
          ? validProductFeature = false
          : validProductFeature = true;
      ProductFeatureTextController.text.isEmpty
          ? ProductFeaturelabelColor = Color(0xFFF53E70)
          : ProductFeaturelabelColor = Color(0xFF919191);
      FeatureDescriptionTextController.text.isEmpty
          ? validFeatureDescription = false
          : validFeatureDescription = true;
      FeatureDescriptionTextController.text.isEmpty
          ? FeatureDescriptionlabelColor = Color(0xFFF53E70)
          : FeatureDescriptionlabelColor = Color(0xFF919191);
      (clickedRadio == null)
          ? radioButtonBorderColor = Color(0xFFF53E70)
          : radioButtonBorderColor = Color(0xFFE95420);
    });
  }

  @override
  void initState() {
    super.initState();

    if (index != null) {
      ProductFeatureTextController = TextEditingController(
          text: AddingNewProductFeature[index].FeatureTitle);
      FeatureDescriptionTextController = TextEditingController(
          text: AddingNewProductFeature[index].FeatureDescription);
      checked = AddingNewProductFeature[index].FeatureChecked;
      clickedRadio = AddingNewProductFeature[index].FeatureType;
    } else {
      ProductFeatureTextController.clear();
      FeatureDescriptionTextController.clear();
      checked = false;
      clickedRadio = null;
    }
  }

  @override
  void dispose() {
    radio1Focus.dispose();
    radio4Focus.dispose();
    radio3Focus.dispose();
    radio2Focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)), //this right here
        child: Container(
//          height: 700,
          width: 800,
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Add a Product Feature:",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextFieldWidget(
                    labelText: "Provide a title to this feature",
                    maxLines: 1,
                    validText: validProductFeature,
                    myFocusNode: ProductFeatureFocusNode,
                    myTextController: ProductFeatureTextController,
                    textCollecter: ProductFeature,
                    helperText:
                        'It is ideal to keep this feature title consise and brief, at the same time,\nit should clearly explain what the feature brings to the end user',
                    labelcolour: ProductFeaturelabelColor,
                  ),
                  TextFieldWidget(
                    labelText: "How would you describe this feature (briefly)?",
                    maxLines: 1,
                    validText: validFeatureDescription,
                    myFocusNode: FeatureDescriptionFocusNode,
                    myTextController: FeatureDescriptionTextController,
                    textCollecter: FeatureDescription,
                    helperText:
                        'Adding a description can help designers and developers understand the feature better\nand therefore subsequently provide a better outcome.',
                    labelcolour: FeatureDescriptionlabelColor,
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: (radio1Focus.hasFocus ||
                                radio2Focus.hasFocus ||
                                radio3Focus.hasFocus ||
                                radio4Focus.hasFocus)
                            ? Border.all(width: 1.2, color: Color(0xFFE95420))
                            : Border.all(
                                width: 1.2, color: radioButtonBorderColor),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'This feature is a:',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        (MediaQuery.of(context).size.width >= 750)
                            ? Row(
                                children: <Widget>[
                                  Expanded(
                                    child: ListTile(
                                      title: Text('Must have'),
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
                                      title: Text('Should have'),
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
                                  Expanded(
                                    child: ListTile(
                                      title: Text('Could have'),
                                      leading: Radio(
                                        focusNode: radio3Focus,
                                        activeColor: Color(0XFFE95420),
                                        value: 3,
                                        groupValue: clickedRadio,
                                        onChanged: (selectedRadio) {
                                          setState(() {
                                            requestFocus(radio3Focus);
                                            clickedRadio = selectedRadio;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text('Would not have'),
                                      leading: Radio(
                                        focusNode: radio4Focus,
                                        activeColor: Color(0XFFE95420),
                                        value: 4,
                                        groupValue: clickedRadio,
                                        onChanged: (selectedRadio) {
                                          setState(() {
                                            requestFocus(radio4Focus);
                                            clickedRadio = selectedRadio;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                children: <Widget>[
                                  ListTile(
                                    title: Text('Must have'),
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
                                    title: Text('Should have'),
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
                                  ListTile(
                                    title: Text('Could have'),
                                    leading: Radio(
                                      focusNode: radio3Focus,
                                      activeColor: Color(0XFFE95420),
                                      value: 3,
                                      groupValue: clickedRadio,
                                      onChanged: (selectedRadio) {
                                        setState(() {
                                          requestFocus(radio3Focus);
                                          clickedRadio = selectedRadio;
                                        });
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: Text('Would not have'),
                                    leading: Radio(
                                      focusNode: radio4Focus,
                                      activeColor: Color(0XFFE95420),
                                      value: 4,
                                      groupValue: clickedRadio,
                                      onChanged: (selectedRadio) {
                                        setState(() {
                                          requestFocus(radio4Focus);
                                          clickedRadio = selectedRadio;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              )
                      ],
                    ),
                  ),
                  CheckboxListTile(
                    title: Text(
                      'This feature is currently offered by a competing product',
                      style: TextStyle(
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
                        AddProductFeatureButton(
                          routeName: '/addproductgoals',
                          onTap: (ProductFeatureTextController.text == '' ||
                                  FeatureDescriptionTextController.text == '' ||
                                  clickedRadio == null)
                              ? () {
                                  validator();
                                }
                              : () {
                                  (ProductFeatureTextController.text != '' &&
                                          FeatureDescriptionTextController
                                                  .text !=
                                              '' &&
                                          clickedRadio != 0)
                                      ? Navigator.pop(context)
                                      : {};
                                  setState(() {
                                    if (index == null) {
                                      _firestore
                                          .collection(
                                              '$currentUser/SolutionFormulation/productFeatures')
                                          .add({
                                        'FeatureTitle':
                                            ProductFeatureTextController.text,
                                        'FeatureDescription':
                                            FeatureDescriptionTextController
                                                .text,
                                        'FeatureChecked': checked,
                                        'FeatureType': clickedRadio,
                                        'Sender': currentUser,
                                      });
                                    } else {
                                      _firestore
                                          .collection(
                                              '$currentUser/SolutionFormulation/productFeatures')
                                          .document(
                                              AddingNewProductFeature[index].ID)
                                          .updateData({
                                        'FeatureTitle':
                                            ProductFeatureTextController.text,
                                        'FeatureDescription':
                                            FeatureDescriptionTextController
                                                .text,
                                        'FeatureChecked': checked,
                                        'FeatureType': clickedRadio,
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
                            ProductFeatureTextController.clear();
                            FeatureDescriptionTextController.clear();
                            checked = false;
                            clickedRadio = null;

                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ));
  }
}
