import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/ResposiveLayout.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionFormulation/addCompetingProduct.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/SaveButton.dart';

class competitionDialogue extends StatefulWidget {
  final String productName;
  final String features;

  const competitionDialogue({this.productName, this.features});

  @override
  _competitionDialogueState createState() => _competitionDialogueState();
}

class _competitionDialogueState extends State<competitionDialogue> {
  final _firestore = Firestore.instance;
  var ProductNamelabelColor = Color(0XFF919191);
  bool validPProductName = true;
  var ProductNameTextController = TextEditingController();
  final ProductNameFocusNode = new FocusNode();
  String ProductName;

  var CompetingOfferinglabelColor = Color(0XFF919191);
  bool validCompetingOffering = true;
  var CompetingOfferingTextController = TextEditingController();
  final CompetingOfferingFocusNode = new FocusNode();
  String CompetingOffering;

  requestFocus(FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  void initState() {
    //  implement initState
    setState(() {
      ProductName = widget.productName;
      CompetingOffering = widget.features;

      CompetingOfferingTextController =
          TextEditingController(text: widget.features);
      ProductNameTextController =
          TextEditingController(text: widget.productName);
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
                    "What we learnt from our competition",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
//        expands: true,
                    focusNode: ProductNameFocusNode,

                    onTap: () {
                      requestFocus(ProductNameFocusNode);
                    },
                    controller: ProductNameTextController,
                    maxLines: 1,
                    style: menuIntroTextStyle,
                    decoration: TextFieldsDecoration.copyWith(
                      labelText: 'What is the name of the product?',
                      helperMaxLines: 3,
                      helperText:
                          'Enter the name of the comepting product here',
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
                          color: ProductNameFocusNode.hasFocus
                              ? Color(0XFFE95420)
                              : ProductNamelabelColor),
                      errorText:
                          validPProductName ? null : 'This field is required',
                    ),
                    onChanged: (text) {
                      if (ProductNameTextController.text == "") {
                        setState(() {
                          ProductName = ProductNameTextController.text;
                          validPProductName = false;
                          ProductNamelabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          ProductName = ProductNameTextController.text;
                          validPProductName = true;
                          ProductNamelabelColor = Colors.grey;
                        });
                      }
                    },
                    onSubmitted: (text) {
                      if (ProductNameTextController.text == "") {
                        setState(() {
                          ProductName = ProductNameTextController.text;
                          validPProductName = false;
                          ProductNamelabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          ProductName = ProductNameTextController.text;
                          validPProductName = true;
                          ProductNamelabelColor = Colors.grey;
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
                    focusNode: CompetingOfferingFocusNode,

                    onTap: () {
                      requestFocus(CompetingOfferingFocusNode);
                    },
                    controller: CompetingOfferingTextController,
                    maxLines: 1,
                    style: menuIntroTextStyle,
                    decoration: TextFieldsDecoration.copyWith(
                      labelText:
                          'What are the features of the competing offering?',
                      helperText: 'Mention each feature seperated by a comma',
                      helperMaxLines: 3,
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
                          color: CompetingOfferingFocusNode.hasFocus
                              ? Color(0XFFE95420)
                              : CompetingOfferinglabelColor),
                      errorText: validCompetingOffering
                          ? null
                          : 'This field is required',
                    ),
                    onChanged: (text) {
                      if (CompetingOfferingTextController.text == "") {
                        setState(() {
                          CompetingOffering =
                              CompetingOfferingTextController.text;
                          validCompetingOffering = false;
                          CompetingOfferinglabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          CompetingOffering =
                              CompetingOfferingTextController.text;
                          validCompetingOffering = true;
                          CompetingOfferinglabelColor = Colors.grey;
                        });
                      }
                    },
                    onSubmitted: (text) {
                      if (CompetingOfferingTextController.text == "") {
                        setState(() {
                          CompetingOffering =
                              CompetingOfferingTextController.text;
                          validCompetingOffering = false;
                          CompetingOfferinglabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          CompetingOffering =
                              CompetingOfferingTextController.text;
                          validCompetingOffering = true;
                          CompetingOfferinglabelColor = Colors.grey;
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
                      cardIcon: Icons.leak_add,
                      cardTitle: 'What we learnt from our competition',
                      cardNote:
                          'Our competitor $ProductName, offers features such as $CompetingOffering',
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
                                  '$currentUser/SolutionFormulation/competingProducts')
                              .document(AddingNewCompetingProduct[0].ID)
                              .updateData({
                            'ProductName': ProductNameTextController.text,
                            'Features': CompetingOfferingTextController.text,
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
