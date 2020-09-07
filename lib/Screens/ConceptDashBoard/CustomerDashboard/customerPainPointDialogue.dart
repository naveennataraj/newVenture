import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/ResposiveLayout.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/StudyTheProblem/problemStudy.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/SaveButton.dart';

class customerPainPointDialogue extends StatefulWidget {
  final String problem;

  const customerPainPointDialogue({this.problem});

  @override
  _customerPainPointDialogueState createState() =>
      _customerPainPointDialogueState();
}

class _customerPainPointDialogueState extends State<customerPainPointDialogue> {
  final _firestore = Firestore.instance;

  var ProblemlabelColor = Color(0XFF919191);
  bool validProblem = true;
  var ProblemTextController = TextEditingController();
  final ProblemFocusNode = new FocusNode();
  String Problemtext = '';
  requestFocus(FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  void initState() {
    //  implement initState
    setState(() {
      ProblemTextController = TextEditingController(text: widget.problem);
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
                  "Customer Pain Point (Primary)",
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
                    focusNode: ProblemFocusNode,

                    onTap: () {
                      requestFocus(ProblemFocusNode);
                    },
                    controller: ProblemTextController,
                    maxLines: 1,
                    style: menuIntroTextStyle,
                    decoration: TextFieldsDecoration.copyWith(
                      labelText:
                          'Describe the problem that the customer is facing',
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
                          color: ProblemFocusNode.hasFocus
                              ? Color(0XFFE95420)
                              : ProblemlabelColor),
                      errorText: validProblem ? null : 'This field is required',
                    ),
                    onChanged: (text) {
                      if (ProblemTextController.text == "") {
                        setState(() {
                          Problemtext = ProblemTextController.text;
                          validProblem = false;
                          ProblemlabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          Problemtext = ProblemTextController.text;
                          validProblem = true;
                          ProblemlabelColor = Colors.grey;
                        });
                      }
                    },
                    onSubmitted: (text) {
                      if (ProblemTextController.text == "") {
                        setState(() {
                          Problemtext = ProblemTextController.text;
                          validProblem = false;
                          ProblemlabelColor = Color(0XFFF53E70);
                        });
                      } else {
                        setState(() {
                          Problemtext = ProblemTextController.text;
                          validProblem = true;
                          ProblemlabelColor = Colors.grey;
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
                      tag: 'ourCustomer',
                      child: DashboardCards(
                        cardIcon: Icons.person,
                        cardTitle: 'Customer Pain Point (Primary)',
                        cardNote: ProblemTextController.text,
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
                        onTap: () {
                          _firestore
                              .collection(
                                  '$currentUser/StudyTheProblem/problemStudy')
                              .document(ProblemStudyArray[0].ID)
                              .updateData({
                            'Problem': ProblemTextController.text,
                            'Sender': currentUser,
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
                          Navigator.popAndPushNamed(
                              context, '/conceptDashboard');
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
