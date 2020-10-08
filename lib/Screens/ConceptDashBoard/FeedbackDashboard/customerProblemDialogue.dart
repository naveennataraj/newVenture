import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/ResposiveLayout.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionIdeation/pickDetails.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/SaveButton.dart';

class customerProblemDialogue extends StatefulWidget {
  final String event;
  final bool inConceptDashboard;

  const customerProblemDialogue({this.event, this.inConceptDashboard});

  @override
  _customerProblemDialogueState createState() =>
      _customerProblemDialogueState();
}

class _customerProblemDialogueState extends State<customerProblemDialogue> {
  final _firestore = Firestore.instance;

  var eventLabelColour = Color(0XFF919191);
  bool validEvent = true;
  var eventTextController = TextEditingController();
  final eventFocusNode = new FocusNode();
  String eventString;

  requestFocus(FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  validator() {
    setState(() {
      eventTextController.text.isEmpty ? validEvent = false : validEvent = true;
      eventTextController.text.isEmpty
          ? eventLabelColour = Color(0xFFF53E70)
          : eventLabelColour = Color(0xFF919191);
    });
  }

  void initState() {
    //  implement initState
    setState(() {
      eventString = widget.event;

      eventTextController = TextEditingController(text: widget.event);
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
                    focusNode: eventFocusNode,

                    onTap: () {
                      requestFocus(eventFocusNode);
                    },
                    controller: eventTextController,
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
                          color: eventFocusNode.hasFocus
                              ? Color(0XFFE95420)
                              : eventLabelColour),
                      errorText: validEvent ? null : 'This field is required',
                    ),
                    onChanged: (text) {
                      if (eventTextController.text == "") {
                        setState(() {
                          eventString = eventTextController.text;
                          validEvent = false;
                          eventLabelColour = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          eventString = eventTextController.text;
                          validEvent = true;
                          eventLabelColour = Colors.grey;
                        });
                      }
                    },
                    onSubmitted: (text) {
                      if (eventTextController.text == "") {
                        setState(() {
                          eventString = eventTextController.text;
                          validEvent = false;
                          eventLabelColour = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          eventString = eventTextController.text;
                          validEvent = true;
                          eventLabelColour = Colors.grey;
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
                      cardIcon: Icons.assignment_turned_in,
                      cardTitle: 'The customer problem is resolved.',
                      cardNote: eventString,
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
                        onTap: (eventTextController.text == '')
                            ? () {
                                validator();
                              }
                            : () {
                                (eventTextController.text != '')
                                    ? (widget.inConceptDashboard)
                                        ? Navigator.popAndPushNamed(
                                            context, '/conceptDashboard')
                                        : Navigator.popAndPushNamed(
                                            context, '/BUFDashboard')
                                    : {};
                                _firestore
                                    .collection(
                                        '$currentUser/SolutionIdeation/pickDetails')
                                    .document(PickDetailsArray[0].ID)
                                    .updateData({
                                  'Event': eventTextController.text,
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
