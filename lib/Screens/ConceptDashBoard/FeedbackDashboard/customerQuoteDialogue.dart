import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/ResposiveLayout.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionValidation/addQuote.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/SaveButton.dart';

class customerQuoteDialogue extends StatefulWidget {
  final String content;

  const customerQuoteDialogue({this.content});

  @override
  _customerQuoteDialogueState createState() => _customerQuoteDialogueState();
}

class _customerQuoteDialogueState extends State<customerQuoteDialogue> {
  final _firestore = Firestore.instance;

  var contentLabelColour = Color(0XFF919191);
  bool validContent = true;
  var contentTextController = TextEditingController();
  final contentFocusNode = new FocusNode();
  String contentString;

  requestFocus(FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  void initState() {
    //  implement initState
    setState(() {
      contentString = widget.content;

      contentTextController = TextEditingController(text: widget.content);
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
                  "Customer Quotes (on using the solution prototype)",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
//        expands: true,
                    focusNode: contentFocusNode,

                    onTap: () {
                      requestFocus(contentFocusNode);
                    },
                    controller: contentTextController,
                    maxLines: 1,
                    style: menuIntroTextStyle,
                    decoration: TextFieldsDecoration.copyWith(
                      labelText: 'Add the content here:',
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
                          color: contentFocusNode.hasFocus
                              ? Color(0XFFE95420)
                              : contentLabelColour),
                      errorText: validContent ? null : 'This field is required',
                    ),
                    onChanged: (text) {
                      if (contentTextController.text == "") {
                        setState(() {
                          contentString = contentTextController.text;
                          validContent = false;
                          contentLabelColour = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          contentString = contentTextController.text;
                          validContent = true;
                          contentLabelColour = Colors.grey;
                        });
                      }
                    },
                    onSubmitted: (text) {
                      if (contentTextController.text == "") {
                        setState(() {
                          contentString = contentTextController.text;
                          validContent = false;
                          contentLabelColour = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          contentString = contentTextController.text;
                          validContent = true;
                          contentLabelColour = Colors.grey;
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
                      cardTitle:
                          'Customer Quotes (on using the solution prototype)',
                      cardNote: contentString,
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
                                  '$currentUser/SolutionValidation/Quote')
                              .document(AddingNewQuote[0].ID)
                              .updateData({
                            'Content': contentTextController.text,
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
