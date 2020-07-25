import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class _addProductFeaturesDialogueState
    extends State<addProductFeaturesDialogue> {
  int index;
  bool checked = false;
  Color CheckTextActive = Colors.black;
  Color CheckTextInActive = Color(0XFFABABAB);

  _addProductFeaturesDialogueState(this.index);
  @override
  void initState() {
    super.initState();
    if (index != null) {
      ProductFeatureTextController = TextEditingController(
          text: AddingNewProductFeature[index].FeatureTitle);
      FeatureDescriptionTextController = TextEditingController(
          text: AddingNewProductFeature[index].FeatureDescription);
      checked = AddingNewProductFeature[index].FeatureChecked;
    }
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
                        "Add a Product Goal:",
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
                                final NewProductFeature = addProductFeature(
                                    FeatureTitle:
                                        ProductFeatureTextController.text,
                                    FeatureDescription:
                                        FeatureDescriptionTextController.text,
                                    FeatureChecked: checked);

                                if (index == null) {
                                  AddingNewProductFeature.add(
                                      NewProductFeature);
                                } else {
                                  AddingNewProductFeature.removeAt(index);
                                  AddingNewProductFeature.insert(
                                      index, NewProductFeature);
                                }

                                ProductFeatureTextController.clear();
                                FeatureDescriptionTextController.clear();
                                checked = false;

                                Navigator.pop(context);
                              });
                            },
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          CancelButtton(),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }
}
