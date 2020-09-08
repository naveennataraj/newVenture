import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/ResposiveLayout.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionIdeation/pickDetails.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/SaveButton.dart';

class monetizeDialogue extends StatefulWidget {
  final String monetize;

  const monetizeDialogue({this.monetize});

  @override
  _monetizeDialogueState createState() => _monetizeDialogueState();
}

class _monetizeDialogueState extends State<monetizeDialogue> {
  final _firestore = Firestore.instance;

  var MonetizelabelColor = Color(0XFF919191);
  bool validMonetize = true;
  var MonetizeTextController = TextEditingController();
  final MonetizeFocusNode = new FocusNode();
  String Monetize;

  requestFocus(FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  void initState() {
    //  implement initState
    setState(() {
      Monetize = widget.monetize;

      MonetizeTextController = TextEditingController(text: widget.monetize);
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
                  "How we make money",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
//        expands: true,
                    focusNode: MonetizeFocusNode,

                    onTap: () {
                      requestFocus(MonetizeFocusNode);
                    },
                    controller: MonetizeTextController,
                    maxLines: 1,
                    style: menuIntroTextStyle,
                    decoration: TextFieldsDecoration.copyWith(
                      labelText:
                          'How would you plan to monetize the solution concept?',
                      helperMaxLines: 3,
                      helperText:
                          '*Determining this is at the current stage can help incorporate this strategy into the design at an early stage.',
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
                          color: MonetizeFocusNode.hasFocus
                              ? Color(0XFFE95420)
                              : MonetizelabelColor),
                      errorText:
                          validMonetize ? null : 'This field is required',
                    ),
                    onChanged: (text) {
                      if (MonetizeTextController.text == "") {
                        setState(() {
                          Monetize = MonetizeTextController.text;
                          validMonetize = false;
                          MonetizelabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          Monetize = MonetizeTextController.text;
                          validMonetize = true;
                          MonetizelabelColor = Colors.grey;
                        });
                      }
                    },
                    onSubmitted: (text) {
                      if (MonetizeTextController.text == "") {
                        setState(() {
                          Monetize = MonetizeTextController.text;
                          validMonetize = false;
                          MonetizelabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          Monetize = MonetizeTextController.text;
                          validMonetize = true;
                          MonetizelabelColor = Colors.grey;
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
                      cardTitle: 'How we make money',
                      cardNote:
                          '$Monetize. This strategy will be integrated into the early desings of the solution.',
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
                            'Monetize': MonetizeTextController.text,
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
