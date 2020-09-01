import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Stu3_DefiningTheSolution/ContentBcFeatureProduct.dart';
import 'package:iventure001/Widgets/AddProductFeatureButton.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:iventure001/Screens/BlitzCanvas/Stu3_DefiningTheSolution/FeaturesProduct.dart';
import 'package:iventure001/Constants/ResposiveLayout.dart';

class Step3BCProductFeatureDialogue extends StatefulWidget {
  final int index;

  const Step3BCProductFeatureDialogue({this.index});
  @override
  _Step3BCProductFeatureDialogueState createState() =>
      _Step3BCProductFeatureDialogueState(index);
}

class _Step3BCProductFeatureDialogueState
    extends State<Step3BCProductFeatureDialogue> {
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

  final _firestore = Firestore.instance;
  int index;
  bool checked = false;
  int clickedRadio;
  Color CheckTextActive = Colors.black;
  Color CheckTextInActive = Color(0XFFABABAB);
  var radio1Focus = new FocusNode();
  var radio2Focus = new FocusNode();
  var radio3Focus = new FocusNode();
  var radio4Focus = new FocusNode();

  requestFocus(FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  @override
  void initState() {
    super.initState();

    if (index != null) {
      ProductFeatureTextController = TextEditingController(
          text: addingNewProductFeature[index].FeatureTitle);
      FeatureDescriptionTextController = TextEditingController(
          text: addingNewProductFeature[index].FeatureDescription);
      checked = addingNewProductFeature[index].FeatureChecked;
      clickedRadio = addingNewProductFeature[index].FeatureType;
    }
  }

  var radioButtonBorderColor = Color(0xFFABABAB);

  @override
  void dispose() {
    radio1Focus.dispose();
    radio4Focus.dispose();
    radio3Focus.dispose();
    radio2Focus.dispose();
    super.dispose();
  }

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

  _Step3BCProductFeatureDialogueState(this.index);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)), //this right here
      child: Container(
        //height: 600, //MediaQuery.of(context).size.height * 0.70,
        width: 800, //MediaQuery.of(context).size.width * 0.5,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "Add a Product Feature:",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                    'It is ideal to keep this feature title consise and brief, at the same time, it should clearly explain what the feature brings to the end user',
                labelcolour: ProductFeaturelabelColor,
              ),
              TextFieldWidget(
                labelText: "How would you describe this feature (briefly)?",
                maxLines: 3,
                validText: validFeatureDescription,
                myFocusNode: FeatureDescriptionFocusNode,
                myTextController: FeatureDescriptionTextController,
                textCollecter: FeatureDescription,
                helperText:
                    'Adding a description can help designers and developers understand the feature better and therefore subsequently provide a better outcome.',
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
                        ? Border.all(width: 1.2, color: Color(0XFFE95420))
                        : Border.all(width: 1.2, color: radioButtonBorderColor),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'This feature is a:',
                        style: (!ResponsiveLayout.isSmallScreen(context)
                            ? menuIntroTextStyle
                            : listTileSmall),
                      ),
                    ),
                    (!ResponsiveLayout.isSmallScreen(context)
                        ? Row(
                            children: <Widget>[
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    'Must have',
                                    style: (!ResponsiveLayout.isSmallScreen(
                                            context)
                                        ? menuIntroTextStyle
                                        : listTileSmall),
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
                                  title: Text(
                                    'Should have',
                                    style: (!ResponsiveLayout.isSmallScreen(
                                            context)
                                        ? menuIntroTextStyle
                                        : listTileSmall),
                                  ),
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
                                  title: Text(
                                    'Could have',
                                    style: (!ResponsiveLayout.isSmallScreen(
                                            context)
                                        ? menuIntroTextStyle
                                        : listTileSmall),
                                  ),
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
                                  title: Text(
                                    'Would not have',
                                    style: (!ResponsiveLayout.isSmallScreen(
                                            context)
                                        ? menuIntroTextStyle
                                        : listTileSmall),
                                  ),
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
                                title: Text(
                                  'Must have',
                                  style:
                                      (!ResponsiveLayout.isSmallScreen(context)
                                          ? menuIntroTextStyle
                                          : listTileSmall),
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
                                title: Text(
                                  'Should have',
                                  style:
                                      (!ResponsiveLayout.isSmallScreen(context)
                                          ? menuIntroTextStyle
                                          : listTileSmall),
                                ),
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
                                title: Text(
                                  'Could have',
                                  style:
                                      (!ResponsiveLayout.isSmallScreen(context)
                                          ? menuIntroTextStyle
                                          : listTileSmall),
                                ),
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
                                title: Text(
                                  'Would not have',
                                  style:
                                      (!ResponsiveLayout.isSmallScreen(context)
                                          ? menuIntroTextStyle
                                          : listTileSmall),
                                ),
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
                          )),
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
                                      FeatureDescriptionTextController.text !=
                                          '' &&
                                      clickedRadio != 0)
                                  ? Navigator.pop(context)
                                  : {};

                              setState(() {
                                final NewProductFeature = ContentBcFeatureProduct(
                                    FeatureTitle:
                                        ProductFeatureTextController.text,
                                    FeatureDescription:
                                        FeatureDescriptionTextController.text,
                                    FeatureChecked: checked,
                                    FeatureType: clickedRadio);

                                if (index == null) {
                                  addingNewProductFeature
                                      .add(NewProductFeature);
                                  _firestore
                                      .collection(
                                          '$currentUser/Bc3_definingTheSolution/addFeatures')
                                      .add({
                                    'featureTitle':
                                        ProductFeatureTextController.text,
                                    'featureDescription':
                                        FeatureDescriptionTextController.text,
                                    'featureChecked': checked,
                                    'featureType': clickedRadio,
                                    'Sender': currentUser,
                                  });
                                } else {
//                                  addingNewProductFeature.removeAt(index);
//                                  addingNewProductFeature.insert(
//                                      index, NewProductFeature);
                                  _firestore
                                      .collection(
                                          '$currentUser/Bc3_definingTheSolution/addFeatures')
                                      .document(
                                          addingNewProductFeature[index].ID)
                                      .updateData({
                                    'featureTitle':
                                        ProductFeatureTextController.text,
                                    'featureDescription':
                                        FeatureDescriptionTextController.text,
                                    'featureChecked': checked,
                                    'featureType': clickedRadio,
                                    'Sender': currentUser,
                                  });
                                }
//                                ProductFeatureTextController.clear();
//                                FeatureDescriptionTextController.clear();
//                                checked = false;
//                                clickedRadio = 0;
//                                Navigator.pop(context);
//                                Navigator.push(context, new MaterialPageRoute(builder: (context) => BcProductFeature()),
//                                )
//                                    .then((value) => setState(() {}),);
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
                        clickedRadio = 0;

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
