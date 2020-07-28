import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Stu3_DefiningTheSolution/ContentBcFeatureProduct.dart';
import 'package:iventure001/Widgets/AddProductFeatureButton.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:iventure001/Screens/BlitzCanvas/Stu3_DefiningTheSolution/FeaturesProduct.dart';

class Step3BCProductFeatureDialogue extends StatefulWidget {
  final int index;

  const Step3BCProductFeatureDialogue({this.index});
  @override
  _Step3BCProductFeatureDialogueState createState() => _Step3BCProductFeatureDialogueState(index);
}

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

class _Step3BCProductFeatureDialogueState extends State<Step3BCProductFeatureDialogue> {
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

  @override
  void dispose() {
    radio1Focus.dispose();
    radio4Focus.dispose();
    radio3Focus.dispose();
    radio2Focus.dispose();
    super.dispose();
  }


  _Step3BCProductFeatureDialogueState(this.index);
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
                        "Add a Product Feature:",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
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
                      labelText:
                      "How would you describe this feature (briefly)?",
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
                              ? Border.all(width: 1.2, color: Color(0XFFE95420))
                              : Border.all(width: 1, color: Color(0XFFABABAB)),
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
                          Row(
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
                          ),
                        ],
                      ),
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
                          AddProductFeatureButton(
                            routeName: '/addproductgoals',
                            onTap: () {
                              setState(() {
                                final NewProductFeature = ContentBcFeatureProduct(
                                    FeatureTitle:
                                    ProductFeatureTextController.text,
                                    FeatureDescription:
                                    FeatureDescriptionTextController.text,
                                    FeatureChecked: checked,
                                    FeatureType: clickedRadio);

                                if (index == null) {
                                  addingNewProductFeature.add(
                                      NewProductFeature);
                                } else {
                                  addingNewProductFeature.removeAt(index);
                                  addingNewProductFeature.insert(
                                      index, NewProductFeature);
                                }

                                ProductFeatureTextController.clear();
                                FeatureDescriptionTextController.clear();
                                checked = false;
                                clickedRadio = 0;

                                //Navigator.pop(context);
                                Navigator.push(context, new MaterialPageRoute(builder: (context) => BcProductFeature()),
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
                ),),
          ),
        ),);
  }
}
