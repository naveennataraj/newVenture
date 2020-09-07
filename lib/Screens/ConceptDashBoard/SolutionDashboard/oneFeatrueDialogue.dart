import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/ResposiveLayout.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionFormulation/addProductFeature.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/SaveButton.dart';

class oneFeatureDialogue extends StatefulWidget {
  final String featureName1;

  const oneFeatureDialogue({this.featureName1});

  @override
  _oneFeatureDialogueState createState() => _oneFeatureDialogueState();
}

class _oneFeatureDialogueState extends State<oneFeatureDialogue> {
  final _firestore = Firestore.instance;

  var ProductFeaturelabelColor = Color(0XFF919191);
  bool validProductFeature = true;
  var ProductFeatureTextController = TextEditingController();
  final ProductFeatureFocusNode = new FocusNode();
  String ProductFeature;

  requestFocus(FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  void initState() {
    //  implement initState
    setState(() {
      ProductFeature = widget.featureName1;

      ProductFeatureTextController =
          TextEditingController(text: widget.featureName1);
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
                Text(
                  "List of planned features (for the solution)",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
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
                      labelText: 'Provide a title to this feature',
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
                      cardIcon: Icons.person,
                      cardTitle: 'List of planned features (for the solution)',
                      cardNote:
                          'For the initial release, we plan to include the following features: $ProductFeature',
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
                        onTap: () {
                          _firestore
                              .collection(
                                  '$currentUser/SolutionFormulation/productFeatures')
                              .document(AddingNewProductFeature[0].ID)
                              .updateData({
                            'FeatureTitle': ProductFeatureTextController.text,
                          });
                          Navigator.popAndPushNamed(
                              context, '/conceptDashboard');
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
