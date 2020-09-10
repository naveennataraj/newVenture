import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/ResposiveLayout.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionIdeation/pickDetails.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/SaveButton.dart';

class tasksDialogue extends StatefulWidget {
  final String pvp;

  const tasksDialogue({this.pvp});

  @override
  _tasksDialogueState createState() => _tasksDialogueState();
}

class _tasksDialogueState extends State<tasksDialogue> {
  final _firestore = Firestore.instance;

  var pvpLabelColour = Color(0XFF919191);
  bool validpvp = true;
  var pvpTextController = TextEditingController();
  final pvpFocusNode = new FocusNode();
  String pvpString;

  requestFocus(FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  void initState() {
    //  implement initState
    setState(() {
      pvpString = widget.pvp;

      pvpTextController = TextEditingController(text: widget.pvp);
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
                  "The customer problem is resolved.",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
//        expands: true,
                    focusNode: pvpFocusNode,

                    onTap: () {
                      requestFocus(pvpFocusNode);
                    },
                    controller: pvpTextController,
                    maxLines: 1,
                    style: menuIntroTextStyle,
                    decoration: TextFieldsDecoration.copyWith(
                      labelText:
                          'After the occurance of which event, would you suggest that the customer pain point is resolved?',
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
                          color: pvpFocusNode.hasFocus
                              ? Color(0XFFE95420)
                              : pvpLabelColour),
                      errorText: validpvp ? null : 'This field is required',
                    ),
                    onChanged: (text) {
                      if (pvpTextController.text == "") {
                        setState(() {
                          pvpString = pvpTextController.text;
                          validpvp = false;
                          pvpLabelColour = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          pvpString = pvpTextController.text;
                          validpvp = true;
                          pvpLabelColour = Colors.grey;
                        });
                      }
                    },
                    onSubmitted: (text) {
                      if (pvpTextController.text == "") {
                        setState(() {
                          pvpString = pvpTextController.text;
                          validpvp = false;
                          pvpLabelColour = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          pvpString = pvpTextController.text;
                          validpvp = true;
                          pvpLabelColour = Colors.grey;
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
                      cardTitle: 'The customer problem is resolved.',
                      cardNote: pvpString,
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
                                  '$currentUser/SolutionIdeation/pickDetails')
                              .document(PickDetailsArray[0].ID)
                              .updateData({
                            'PVP': pvpTextController.text,
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
