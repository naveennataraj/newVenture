import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/ResposiveLayout.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/SaveButton.dart';

class MonetizeDialogue extends StatefulWidget {
  final bool fromBufDashboard;
  final String revenueStream;
  final revenueID;

  const MonetizeDialogue({ this.revenueStream, this.revenueID, this.fromBufDashboard});
  @override
  _MonetizeDialogueState createState() => _MonetizeDialogueState();
}

class _MonetizeDialogueState extends State<MonetizeDialogue> {
  final _firestore = Firestore.instance;
  bool fromBUFDashboard;

  var primaryPropositionLabelColor = Color(0XFF919191);
  bool validPropositionName = true;
  var primaryPropositionTextController = TextEditingController();
  final primaryPropositionFocusNode = new FocusNode();
  String primaryProposition;

  var primaryPropositionID;
  int primaryIndex;

  requestFocus(FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  void initState() {
    //  implement initState
    setState(() {

      primaryProposition = widget.revenueStream;
      primaryPropositionID = widget.revenueID;
      fromBUFDashboard = widget.fromBufDashboard;

      primaryPropositionTextController =
          TextEditingController(text: widget.revenueStream);

      //primaryIndex = addingNewBusinessElement.indexWhere((element) => element.ID == primaryPropositionID );
      //print(primaryIndex);

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
                    "How we make money",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
//        expands: true,
                    focusNode: primaryPropositionFocusNode,

                    onTap: () {
                      requestFocus(primaryPropositionFocusNode);
                    },
                    controller: primaryPropositionTextController,
                    maxLines: 1,
                    style: menuIntroTextStyle,
                    decoration: TextFieldsDecoration.copyWith(
                      labelText: 'How we plan to monetize this innovation',
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
                          color: primaryPropositionFocusNode.hasFocus
                              ? Color(0XFFE95420)
                              : primaryPropositionLabelColor),
                      errorText:
                      validPropositionName ? null : 'This field is required',
                    ),
                    onChanged: (text) {
                      if (primaryPropositionTextController.text == "") {
                        setState(() {
                          primaryProposition = primaryPropositionTextController.text;
                          validPropositionName = false;
                          primaryPropositionLabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          primaryProposition = primaryPropositionTextController.text;
                          validPropositionName = true;
                          primaryPropositionLabelColor = Colors.grey;
                        });
                      }
                    },
                    onSubmitted: (text) {
                      if (primaryPropositionTextController.text == "") {
                        setState(() {
                          primaryProposition = primaryPropositionTextController.text;
                          validPropositionName = false;
                          primaryPropositionLabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          primaryProposition = primaryPropositionTextController.text;
                          validPropositionName = true;
                          primaryPropositionLabelColor = Colors.grey;
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
                      cardTitle: 'How we make money',
                      cardNote:
                      '$primaryProposition',
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
                              '$currentUser/Bc7_businessModelElements/addElements')
                              .document(primaryPropositionID)
                              .updateData({
                            'elementDescription': primaryPropositionTextController.text,
                          });
                          (fromBUFDashboard == true) ?
                          Navigator.popAndPushNamed(
                              context, '/BUFDashboard'):
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


