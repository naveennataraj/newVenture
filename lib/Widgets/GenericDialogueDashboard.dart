import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/ResposiveLayout.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/SaveButton.dart';

class DashboardDialogue extends StatefulWidget {
  final String dashboardCard;
  final String cardText;
  final String heroTag;
  final String labelText;
  final IconData iconCard;
  final Function functionCard;
  final String firebaseRoute;
  final String firebaseDocument;
  final String pushRoute;
  const DashboardDialogue({this.dashboardCard, this.cardText, this.heroTag, this.labelText, this.iconCard, this.functionCard, this.firebaseRoute, this.firebaseDocument, this.pushRoute});
  @override
  _DashboardDialogueState createState() => _DashboardDialogueState();
}

class _DashboardDialogueState extends State<DashboardDialogue> {
  final _firestore = Firestore.instance;
  var genericLabelColor = Color(0XFF919191);
  bool validGenericController = true;
  var genericTextController = TextEditingController();
  final genericFocusNode = new FocusNode();
  String genericText = '';

  requestFocus(FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  void initState() {
    //  implement initState
    setState(() {
      genericTextController = TextEditingController(text: widget.dashboardCard);
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
                  widget.cardText,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
//        expands: true,
                    focusNode: genericFocusNode,

                    onTap: () {
                      requestFocus(genericFocusNode);
                    },
                    controller: genericTextController,
                    maxLines: 1,
                    style: menuIntroTextStyle,
                    decoration: TextFieldsDecoration.copyWith(
                      labelText:
                      widget.labelText,
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
                          color: genericFocusNode.hasFocus
                              ? Color(0XFFE95420)
                              : genericLabelColor),
                      errorText: validGenericController ? null : 'This field is required',
                    ),
                    onChanged: (text) {
                      if (genericTextController.text == "") {
                        setState(() {
                          genericText = genericTextController.text;
                          validGenericController = false;
                          genericLabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          genericText = genericTextController.text;
                          validGenericController = true;
                          genericLabelColor = Colors.grey;
                        });
                      }
                    },
                    onSubmitted: (text) {
                      if (genericTextController.text == "") {
                        setState(() {
                          genericText = genericTextController.text;
                          validGenericController = false;
                          genericLabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          genericText = genericTextController.text;
                          validGenericController = true;
                          genericLabelColor = Colors.grey;
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
                    child: Hero(
                      tag: widget.heroTag,
                      child: DashboardCards(
                        cardIcon: widget.iconCard,
                        cardTitle: widget.cardText,
                        cardNote: genericTextController.text,
                        onTap: () {
                          Navigator.pushNamed(context, '/addpainpoints');
                        },
                        editableCard: false,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SaveButton(
                        onTap:
                            () {
                          _firestore.collection(currentUser).document(widget.firebaseRoute)
                              .updateData({
                            widget.firebaseDocument: genericTextController.text,
                            'Sender': currentUser,
                          });

                          Navigator.popAndPushNamed(
                              context, widget.pushRoute);
                        },
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      CancelButtton(
                        OnTap: () {
                          Navigator.popAndPushNamed(
                              context, widget.pushRoute);
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
