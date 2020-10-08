import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/ResposiveLayout.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/PreValidation/addDistributionMedium.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/SaveButton.dart';

class solutionDeliveryDialogue extends StatefulWidget {
  final String medium;
  final bool inConceptDashboard;

  const solutionDeliveryDialogue({this.medium, this.inConceptDashboard});

  @override
  _solutionDeliveryDialogueState createState() =>
      _solutionDeliveryDialogueState();
}

class _solutionDeliveryDialogueState extends State<solutionDeliveryDialogue> {
  final _firestore = Firestore.instance;

  var mediumLabelColour = Color(0XFF919191);
  bool validMedium = true;
  var mediumTextController = TextEditingController();
  final mediumFocusNode = new FocusNode();
  String mediumString;

  requestFocus(FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  validator() {
    setState(() {
      mediumTextController.text.isEmpty
          ? validMedium = false
          : validMedium = true;
      mediumTextController.text.isEmpty
          ? mediumLabelColour = Color(0xFFF53E70)
          : mediumLabelColour = Color(0xFF919191);
    });
  }

  void initState() {
    //  implement initState
    setState(() {
      mediumString = widget.medium;

      mediumTextController = TextEditingController(text: widget.medium);
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
                    "The customer problem is resolved.",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
//        expands: true,
                    focusNode: mediumFocusNode,

                    onTap: () {
                      requestFocus(mediumFocusNode);
                    },
                    controller: mediumTextController,
                    maxLines: 1,
                    style: menuIntroTextStyle,
                    decoration: TextFieldsDecoration.copyWith(
                      labelText:
                          'What medium would you choose to share the wireframes with users?',
                      helperText:
                          ' *An appropriate medium, if selected will help the early adopters and other users with quicker access to the solution concept\nand subsequently provide feedback more quickly',
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
                          color: mediumFocusNode.hasFocus
                              ? Color(0XFFE95420)
                              : mediumLabelColour),
                      errorText: validMedium ? null : 'This field is required',
                    ),
                    onChanged: (text) {
                      if (mediumTextController.text == "") {
                        setState(() {
                          mediumString = mediumTextController.text;
                          validMedium = false;
                          mediumLabelColour = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          mediumString = mediumTextController.text;
                          validMedium = true;
                          mediumLabelColour = Colors.grey;
                        });
                      }
                    },
                    onSubmitted: (text) {
                      if (mediumTextController.text == "") {
                        setState(() {
                          mediumString = mediumTextController.text;
                          validMedium = false;
                          mediumLabelColour = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          mediumString = mediumTextController.text;
                          validMedium = true;
                          mediumLabelColour = Colors.grey;
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
                      cardIcon: Icons.local_shipping,
                      cardTitle: 'How we intend to deliver the solution',
                      cardNote:
                          'We plan to distribute our product via: $mediumString, as our primary medium.',
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
                        onTap: (mediumTextController.text == '')
                            ? () {
                                validator();
                              }
                            : () {
                                (mediumTextController.text != '')
                                    ? (widget.inConceptDashboard)
                                        ? Navigator.popAndPushNamed(
                                            context, '/conceptDashboard')
                                        : Navigator.popAndPushNamed(
                                            context, '/BUFDashboard')
                                    : {};
                                _firestore
                                    .collection(
                                        '$currentUser/PreValidation/addMedium')
                                    .document(addMediumArray[0].ID)
                                    .updateData({
                                  'Medium': mediumTextController.text,
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
