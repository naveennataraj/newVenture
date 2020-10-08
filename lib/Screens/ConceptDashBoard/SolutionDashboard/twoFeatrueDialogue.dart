import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/ResposiveLayout.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionFormulation/addProductFeature.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/SaveButton.dart';

class twoFeatureDialogue extends StatefulWidget {
  final String featureName1;
  final String featureName2;
  final bool inConceptDashboard;

  const twoFeatureDialogue(
      {this.featureName1, this.featureName2, this.inConceptDashboard});

  @override
  _twoFeatureDialogueState createState() => _twoFeatureDialogueState();
}

class _twoFeatureDialogueState extends State<twoFeatureDialogue> {
  final _firestore = Firestore.instance;

  var ProductFeaturelabelColor = Color(0XFF919191);
  bool validProductFeature = true;
  var ProductFeatureTextController = TextEditingController();
  final ProductFeatureFocusNode = new FocusNode();
  String ProductFeature;

  var ProductFeature2labelColor = Color(0XFF919191);
  bool validProductFeature2 = true;
  var ProductFeature2TextController = TextEditingController();
  final ProductFeature2FocusNode = new FocusNode();
  String ProductFeature2;

  requestFocus(FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  validator() {
    setState(() {
      ProductFeatureTextController.text.isEmpty
          ? validProductFeature = false
          : validProductFeature = true;
      ProductFeatureTextController.text.isEmpty
          ? ProductFeaturelabelColor = Color(0xFFF53E70)
          : ProductFeaturelabelColor = Color(0xFF919191);

      ProductFeature2TextController.text.isEmpty
          ? validProductFeature2 = false
          : validProductFeature2 = true;
      ProductFeature2TextController.text.isEmpty
          ? ProductFeature2labelColor = Color(0xFFF53E70)
          : ProductFeature2labelColor = Color(0xFF919191);
    });
  }

  void initState() {
    //  implement initState
    setState(() {
      ProductFeature = widget.featureName1;
      ProductFeature2 = widget.featureName2;
      ProductFeatureTextController =
          TextEditingController(text: widget.featureName1);
      ProductFeature2TextController =
          TextEditingController(text: widget.featureName2);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)), //this right here
      child: Container(
//        height: 600,
        width: 800,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "List of planned features (for the solution)",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
//        expands: true,
                    focusNode: ProductFeatureFocusNode,

                    onTap: () {
                      requestFocus(ProductFeatureFocusNode);
                    },
                    controller: ProductFeatureTextController,
                    maxLines: 1,
                    style: menuIntroTextStyle,
                    decoration: TextFieldsDecoration.copyWith(
                      labelText: 'Provide a title to the first feature',
                      helperMaxLines: 3,
                      helperText:
                          'It is ideal to keep this feature title consise and brief, at the same time,\nit should clearly explain what the feature brings to the end user',
                      helperStyle: TextStyle(
                          fontSize: (ResponsiveLayout.isSmallScreen(context)
                              ? 11
                              : ResponsiveLayout.isMediumScreen(context)
                                  ? 15
                                  : 15),
                          fontFamily: 'OpenSans'),
                      labelStyle: TextStyle(
                          fontSize: (ResponsiveLayout.isSmallScreen(context)
                              ? 12
                              : ResponsiveLayout.isMediumScreen(context)
                                  ? 15
                                  : 16),
                          fontFamily: 'OpenSans',
                          color: ProductFeatureFocusNode.hasFocus
                              ? Color(0XFFE95420)
                              : ProductFeaturelabelColor),
                      errorText:
                          validProductFeature ? null : 'This field is required',
                    ),
                    onChanged: (text) {
                      if (ProductFeatureTextController.text == "") {
                        setState(() {
                          ProductFeature = ProductFeatureTextController.text;
                          validProductFeature = false;
                          ProductFeaturelabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          ProductFeature = ProductFeatureTextController.text;
                          validProductFeature = true;
                          ProductFeaturelabelColor = Colors.grey;
                        });
                      }
                    },
                    onSubmitted: (text) {
                      if (ProductFeatureTextController.text == "") {
                        setState(() {
                          ProductFeature = ProductFeatureTextController.text;
                          validProductFeature = false;
                          ProductFeaturelabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          ProductFeature = ProductFeatureTextController.text;
                          validProductFeature = true;
                          ProductFeaturelabelColor = Colors.grey;
                        });
                      }
                    },
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
//        expands: true,
                    focusNode: ProductFeature2FocusNode,

                    onTap: () {
                      requestFocus(ProductFeature2FocusNode);
                    },
                    controller: ProductFeature2TextController,
                    maxLines: 1,
                    style: menuIntroTextStyle,
                    decoration: TextFieldsDecoration.copyWith(
                      labelText: 'Provide a title to the second feature',
                      helperMaxLines: 3,
                      helperText:
                          'It is ideal to keep this feature title consise and brief, at the same time,\nit should clearly explain what the feature brings to the end user',
                      helperStyle: TextStyle(
                          fontSize: (ResponsiveLayout.isSmallScreen(context)
                              ? 11
                              : ResponsiveLayout.isMediumScreen(context)
                                  ? 15
                                  : 15),
                          fontFamily: 'OpenSans'),
                      labelStyle: TextStyle(
                          fontSize: (ResponsiveLayout.isSmallScreen(context)
                              ? 12
                              : ResponsiveLayout.isMediumScreen(context)
                                  ? 15
                                  : 16),
                          fontFamily: 'OpenSans',
                          color: ProductFeature2FocusNode.hasFocus
                              ? Color(0XFFE95420)
                              : ProductFeature2labelColor),
                      errorText: validProductFeature2
                          ? null
                          : 'This field is required',
                    ),
                    onChanged: (text) {
                      if (ProductFeature2TextController.text == "") {
                        setState(() {
                          ProductFeature2 = ProductFeature2TextController.text;
                          validProductFeature2 = false;
                          ProductFeature2labelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          ProductFeature2 = ProductFeature2TextController.text;
                          validProductFeature2 = true;
                          ProductFeature2labelColor = Colors.grey;
                        });
                      }
                    },
                    onSubmitted: (text) {
                      if (ProductFeature2TextController.text == "") {
                        setState(() {
                          ProductFeature2 = ProductFeature2TextController.text;
                          validProductFeature2 = false;
                          ProductFeature2labelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          ProductFeature2 = ProductFeature2TextController.text;
                          validProductFeature2 = true;
                          ProductFeature2labelColor = Colors.grey;
                        });
                      }
                    },
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Divider(
                    height: 1,
                    thickness: 1,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DashboardCards(
                      editableCard: false,
                      cardIcon: Icons.assignment_returned,
                      cardTitle: 'List of planned features (for the solution)',
                      cardNote:
                          'For the initial release, we plan to include the following features: $ProductFeature , $ProductFeature2',
                      onTap: () {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SaveButton(
                        onTap: (ProductFeatureTextController.text == '' ||
                                ProductFeature2TextController.text == '')
                            ? () {
                                validator();
                              }
                            : () {
                                (ProductFeatureTextController.text != '' &&
                                        ProductFeature2TextController.text !=
                                            '')
                                    ? (widget.inConceptDashboard)
                                        ? Navigator.popAndPushNamed(
                                            context, '/conceptDashboard')
                                        : Navigator.popAndPushNamed(
                                            context, '/BUFDashboard')
//                                    Navigator.pop(context)
                                    : {};
                                _firestore
                                    .collection(
                                        '$currentUser/SolutionFormulation/productFeatures')
                                    .document(AddingNewProductFeature[0].ID)
                                    .updateData({
                                  'FeatureTitle':
                                      ProductFeatureTextController.text,
                                });
                                _firestore
                                    .collection(
                                        '$currentUser/SolutionFormulation/productFeatures')
                                    .document(AddingNewProductFeature[1].ID)
                                    .updateData({
                                  'FeatureTitle':
                                      ProductFeature2TextController.text,
                                });
                              },
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      CancelButtton(
                        OnTap: () {
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
      ),
    );
  }
}
