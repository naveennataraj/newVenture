import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';

import '../../../Widgets/GoNextButton.dart';
import '../../../Widgets/HeadBackButton.dart';

String customerProblems = '';

class ProblemStudy extends StatefulWidget {
  @override
  _ProblemStudyState createState() => _ProblemStudyState();
}

bool validTitle = true;
final TitleTextController = TextEditingController();
final TitleFocusNode = new FocusNode();

bool validProblem = true;
final ProblemTextController = TextEditingController();
final ProblemFocusNode = new FocusNode();

bool validImportance = true;
final ImportanceTextController = TextEditingController();
final ImportanceFocusNode = new FocusNode();

class _ProblemStudyState extends State<ProblemStudy> {
  requestFocus(FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iVENTURE'),
        backgroundColor: Color(0XFFE95420),
      ),
      backgroundColor: Color(0XFFFAFAFA),
      body: Center(
        child: Material(
          color: Colors.white,
          elevation: 5,
          child: Container(
            height: MediaQuery.of(context).size.height * .64,
            width: MediaQuery.of(context).size.width * .50,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let's collect some details on the Customer's Problem",
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: TextField(
                      focusNode: TitleFocusNode,
                      onTap: () {
                        requestFocus(TitleFocusNode);
                      },
                      controller: TitleTextController,
                      maxLines: 1,
                      decoration: StepPageTextFields.copyWith(
                        labelText: 'Provide a title for your project',
                        labelStyle: TextStyle(
                            color: TitleFocusNode.hasFocus
                                ? Color(0XFFE95420)
                                : null),
                        errorText: validTitle ? null : 'This field is required',
                      ),
                      onChanged: (text) {
                        if (text == "") {
                          setState(() {
                            validTitle = false;
                          });
                        } else {
                          setState(() {
                            validTitle = true;
                          });
                        }
                      },
                      onSubmitted: (text) {
                        if (text == "") {
                          setState(() {
                            validTitle = false;
                          });
                        } else {
                          setState(() {
                            validTitle = true;
                          });
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: TextField(
                      focusNode: ProblemFocusNode,
                      onTap: () {
                        requestFocus(ProblemFocusNode);
                      },
                      controller: ProblemTextController,
                      maxLines: 3,
                      decoration: StepPageTextFields.copyWith(
                        labelText:
                            'Describe the problem that the customer is facing',
                        labelStyle: TextStyle(
                            color: ProblemFocusNode.hasFocus
                                ? Color(0XFFE95420)
                                : null),
                        errorText:
                            validProblem ? null : 'This field is required',
                      ),
                      onChanged: (text) {
                        if (text == "") {
                          setState(() {
                            validProblem = false;
                          });
                        } else {
                          setState(() {
                            validProblem = true;
                          });
                        }
                      },
                      onSubmitted: (text) {
                        if (text == "") {
                          setState(() {
                            validProblem = false;
                          });
                        } else {
                          setState(() {
                            validProblem = true;
                          });
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: TextField(
                      focusNode: ImportanceFocusNode,
                      onTap: () {
                        requestFocus(ImportanceFocusNode);
                      },
                      controller: ImportanceTextController,
                      maxLines: 3,
                      decoration: StepPageTextFields.copyWith(
                        labelText:
                            'Why is the problem important to the customer?',
                        labelStyle: TextStyle(
                            color: ImportanceFocusNode.hasFocus
                                ? Color(0XFFE95420)
                                : null),
                        errorText:
                            validImportance ? null : 'This field is required',
                      ),
                      onChanged: (text) {
                        if (text == "") {
                          setState(() {
                            validImportance = false;
                          });
                        } else {
                          setState(() {
                            validImportance = true;
                          });
                        }
                      },
                      onSubmitted: (text) {
                        if (text == "") {
                          setState(() {
                            validImportance = false;
                          });
                        } else {
                          setState(() {
                            validImportance = true;
                          });
                        }
                      },
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        headBackButtton(),
                        SizedBox(
                          width: 50,
                        ),
                        goNextButton(
                          routeName: '/addpainpoints',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
