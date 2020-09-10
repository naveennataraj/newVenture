import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/ResposiveLayout.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionValidation/addQuote.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/SaveButton.dart';

class quoteDialogue extends StatefulWidget {
  final String quote;

  const quoteDialogue({this.quote});

  @override
  _quoteDialogueState createState() => _quoteDialogueState();
}

class _quoteDialogueState extends State<quoteDialogue> {
  final _firestore = Firestore.instance;

  var QuotelabelColor = Color(0XFF919191);
  bool validQuote = true;
  var QuoteTextController = TextEditingController();
  final QuoteFocusNode = new FocusNode();
  String Quote;

  requestFocus(FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  void initState() {
    //  implement initState
    setState(() {
      Quote = widget.quote;

      QuoteTextController = TextEditingController(text: widget.quote);
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
                    'Customer Quotes (on using the solution prototype)',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
//        expands: true,
                    focusNode: QuoteFocusNode,

                    onTap: () {
                      requestFocus(QuoteFocusNode);
                    },
                    controller: QuoteTextController,
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
                          color: QuoteFocusNode.hasFocus
                              ? Color(0XFFE95420)
                              : QuotelabelColor),
                      errorText: validQuote ? null : 'This field is required',
                    ),
                    onChanged: (text) {
                      if (QuoteTextController.text == "") {
                        setState(() {
                          Quote = QuoteTextController.text;
                          validQuote = false;
                          QuotelabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          Quote = QuoteTextController.text;
                          validQuote = true;
                          QuotelabelColor = Colors.grey;
                        });
                      }
                    },
                    onSubmitted: (text) {
                      if (QuoteTextController.text == "") {
                        setState(() {
                          Quote = QuoteTextController.text;
                          validQuote = false;
                          QuotelabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          Quote = QuoteTextController.text;
                          validQuote = true;
                          QuotelabelColor = Colors.grey;
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
                      cardIcon: Icons.record_voice_over,
                      cardTitle:
                          'Customer Quotes (on using the solution prototype)',
                      cardNote: Quote,
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
                            'Content': QuoteTextController.text,
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
