import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/GenericDialogueDashboard.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step8_Synergies/ContentSynergies.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/ResposiveLayout.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/SaveButton.dart';


class SynergyDialogue extends StatefulWidget {
  final bool fromBufDashboard;
  final String synergy;
  final String descriptionService;

  const SynergyDialogue({this.synergy, this.descriptionService, this.fromBufDashboard});
  @override
  _SynergyDialogueState createState() => _SynergyDialogueState();
}

class _SynergyDialogueState extends State<SynergyDialogue> {
  final _firestore = Firestore.instance;
  bool fromBUFDashboard;

  var serviceLabelColor = Color(0XFF919191);
  bool validService = true;
  var serviceTextController = TextEditingController();
  final serviceFocusNode = new FocusNode();
  String serviceName;

  var descriptionLabelColor = Color(0XFF919191);
  bool validDescription = true;
  var descriptionTextController = TextEditingController();
  final descriptionFocusNode = new FocusNode();
  String descriptionName;

  requestFocus(FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  void initState() {
    //  implement initState
    setState(() {
      serviceName = widget.synergy;
      descriptionName = widget.descriptionService;
      fromBUFDashboard = widget.fromBufDashboard;

      descriptionTextController =
          TextEditingController(text: widget.descriptionService);
      serviceTextController =
          TextEditingController(text: widget.synergy);
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "How we Synergize:",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    focusNode: serviceFocusNode,

                    onTap: () {
                      requestFocus(serviceFocusNode);
                    },
                    controller: serviceTextController,
                    maxLines: 1,
                    style: menuIntroTextStyle,
                    decoration: TextFieldsDecoration.copyWith(
                      labelText: "Please provide a detailed description of the synergy",
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
                          color: serviceFocusNode.hasFocus
                              ? Color(0XFFE95420)
                              : serviceLabelColor),
                      errorText:
                      validService ? null : 'This field is required',
                    ),
                    onChanged: (text) {
                      if (serviceTextController.text == "") {
                        setState(() {
                          serviceName = serviceTextController.text;
                          validService = false;
                          serviceLabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          serviceName = serviceTextController.text;
                          validService = true;
                          serviceLabelColor = Colors.grey;
                        });
                      }
                    },
                    onSubmitted: (text) {
                      if (serviceTextController.text == "") {
                        setState(() {
                          serviceName = serviceTextController.text;
                          validService = false;
                          serviceLabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          serviceName = serviceTextController.text;
                          validService = true;
                          serviceLabelColor = Colors.grey;
                        });
                      }
                    },
                    textInputAction: TextInputAction.next,
                  ),
                ),

//                Padding(
//                  padding: const EdgeInsets.all(10.0),
//                  child: TextField(
////        expands: true,
//                    focusNode: descriptionFocusNode,
//
//                    onTap: () {
//                      requestFocus(descriptionFocusNode);
//                    },
//                    controller: descriptionTextController,
//                    maxLines: (ResponsiveLayout.isSmallScreen(context) ? 2 : 1),
//                    style: menuIntroTextStyle,
//                    decoration: TextFieldsDecoration.copyWith(
//                      labelText:
//                      "Business elements",
//                      helperText: '',
//                      helperMaxLines: 3,
//                      helperStyle: TextStyle(
//                          fontSize: (ResponsiveLayout.isSmallScreen(context)
//                              ? 11
//                              : ResponsiveLayout.isMediumScreen(context)
//                              ? 15
//                              : 15),
//                          fontFamily: 'OpenSans'),
//                      labelStyle: TextStyle(
//                          fontSize: (ResponsiveLayout.isSmallScreen(context)
//                              ? 12
//                              : ResponsiveLayout.isMediumScreen(context)
//                              ? 15
//                              : 16),
//                          fontFamily: 'OpenSans',
//                          color: descriptionFocusNode.hasFocus
//                              ? Color(0XFFE95420)
//                              : descriptionLabelColor),
//                      errorText: validDescription
//                          ? null
//                          : 'This field is required',
//                    ),
//                    onChanged: (text) {
//                      if (descriptionTextController.text == "") {
//                        setState(() {
//                          descriptionName =
//                              descriptionTextController.text;
//                          validDescription = false;
//                          descriptionLabelColor = Color(0XFFF53E70);
//                        });
//                      } else {
//                        setState(() {
//                          descriptionName =
//                              descriptionTextController.text;
//                          validDescription = true;
//                          descriptionLabelColor = Colors.grey;
//                        });
//                      }
//                    },
//                    onSubmitted: (text) {
//                      if (descriptionTextController.text == "") {
//                        setState(() {
//                          descriptionName =
//                              descriptionTextController.text;
//                          validDescription = false;
//                          descriptionLabelColor = Color(0XFFF53E70);
//                        });
//                      } else {
//                        setState(() {
//                          descriptionName =
//                              descriptionTextController.text;
//                          validDescription = true;
//                          descriptionLabelColor = Colors.grey;
//                        });
//                      }
//                    },
//                    textInputAction: TextInputAction.next,
//                  ),
//                ),

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
                      cardTitle: 'How we Synergize:',
                      cardNote:
                      '$descriptionName create a new feature called $serviceName, based on studying user feedback.',
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
                              '$currentUser/Bc8_synergies/addSynergies')
                              .document(addingNewSynergies[0].ID)
                              .updateData({
                            'synergyDescription': serviceTextController.text,
                            //'asAServiceDescription': descriptionTextController.text,
                          });
                          (fromBUFDashboard == true) ?
                          Navigator.popAndPushNamed(
                              context, '/BUFDashboard'):
                          Navigator.popAndPushNamed(
                              context, '/BusinessModelDashboard');
//                          Navigator.popAndPushNamed(
//                              context, '/BusinessModelDashboard');
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

