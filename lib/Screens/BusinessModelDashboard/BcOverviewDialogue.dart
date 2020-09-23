import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/ResposiveLayout.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/SaveButton.dart';


class CompetitorDialogue extends StatefulWidget {
  final String descriptionMission;
  final String descriptionVision;

  const CompetitorDialogue({this.descriptionMission, this.descriptionVision});
  @override
  _CompetitorDialogueState createState() => _CompetitorDialogueState();
}

class _CompetitorDialogueState extends State<CompetitorDialogue> {
  final _firestore = Firestore.instance;

  var missionLabelColor = Color(0XFF919191);
  bool validMission = true;
  var missionTextController = TextEditingController();
  final missionFocusNode = new FocusNode();
  String missionName;

  var visionLabelColor = Color(0XFF919191);
  bool validVision = true;
  var validTextController = TextEditingController();
  final validFocusNode = new FocusNode();
  String validName;

  requestFocus(FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  void initState() {
    //  implement initState
    setState(() {
      missionName = widget.descriptionMission;
      validName = widget.descriptionVision;

      validTextController =
          TextEditingController(text: widget.descriptionVision);
      missionTextController =
          TextEditingController(text: widget.descriptionMission);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)),
      child: Container(
        width: 800,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "Our purpose and Who we are",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    focusNode: missionFocusNode,

                    onTap: () {
                      requestFocus(missionFocusNode);
                    },
                    controller: missionTextController,
                    maxLines: (ResponsiveLayout.isSmallScreen(context) ? 2 : 1),
                    style: menuIntroTextStyle,
                    decoration: TextFieldsDecoration.copyWith(
                      labelText: 'Provide a mission statement for the business venture',
                      helperMaxLines: 3,
                      helperText:
                      '',
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
                          color: missionFocusNode.hasFocus
                              ? Color(0XFFE95420)
                              : missionLabelColor),
                      errorText:
                      validMission ? null : 'This field is required',
                    ),
                    onChanged: (text) {
                      if (missionTextController.text == "") {
                        setState(() {
                          missionName = missionTextController.text;
                          validMission = false;
                          missionLabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          missionName = missionTextController.text;
                          validMission = true;
                          missionLabelColor = Colors.grey;
                        });
                      }
                    },
                    onSubmitted: (text) {
                      if (missionTextController.text == "") {
                        setState(() {
                          missionName = missionTextController.text;
                          validMission = false;
                          missionLabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          missionName = missionTextController.text;
                          validMission = true;
                          missionLabelColor = Colors.grey;
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
                    focusNode: validFocusNode,

                    onTap: () {
                      requestFocus(validFocusNode);
                    },
                    controller: validTextController,
                    maxLines: (ResponsiveLayout.isSmallScreen(context) ? 2 : 1),
                    style: menuIntroTextStyle,
                    decoration: TextFieldsDecoration.copyWith(
                      labelText:
                      'Provide a vision for the business venture to work towards',
                      helperText: '',
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
                          color: validFocusNode.hasFocus
                              ? Color(0XFFE95420)
                              : visionLabelColor),
                      errorText: validVision
                          ? null
                          : 'This field is required',
                    ),
                    onChanged: (text) {
                      if (validTextController.text == "") {
                        setState(() {
                          validName =
                              validTextController.text;
                          validVision = false;
                          visionLabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          validName =
                              validTextController.text;
                          validVision = true;
                          visionLabelColor = Colors.grey;
                        });
                      }
                    },
                    onSubmitted: (text) {
                      if (validTextController.text == "") {
                        setState(() {
                          validName =
                              validTextController.text;
                          validVision = false;
                          visionLabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          validName =
                              validTextController.text;
                          validVision = true;
                          visionLabelColor = Colors.grey;
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
                      cardTitle: 'Our purpose and Who we are',
                      cardNote:
                      'Mission: $missionName \n\n Vision: $validName',
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
                              .collection(currentUser).document('Bc1_buildTheFoundation').updateData({
                            'mission': missionTextController.text,
                            'vision': validTextController.text,
                          });
                          Navigator.popAndPushNamed(
                              context, '/BusinessModelDashboard');
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


