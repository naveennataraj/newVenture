import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/MainTextField.dart';

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
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MainTextFields(
                    labelText: 'Provide a title for your project',
                    myTextController: TitleTextController,
                    myFocusNode: TitleFocusNode,
                    validText: validTitle,
                    maxLines: 1,
                  ),
                  MainTextFields(
                    labelText:
                        'Describe the problem that the customer is facing',
                    myTextController: ProblemTextController,
                    myFocusNode: ProblemFocusNode,
                    validText: validProblem,
                    maxLines: 3,
                  ),
                  MainTextFields(
                    labelText: 'Why is the problem important to the customer?',
                    myTextController: ImportanceTextController,
                    myFocusNode: ImportanceFocusNode,
                    validText: validImportance,
                    maxLines: 3,
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
