import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/CardData.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';

import '../../../Widgets/GoNextButton.dart';
import '../../../Widgets/HeadBackButton.dart';

String customerProblems = '';
bool StepValidator;

class ProblemStudy extends StatefulWidget {
  @override
  _ProblemStudyState createState() => _ProblemStudyState();
}

var TitlelabelColor = Color(0XFF919191);
bool validTitle = true;
final TitleTextController = TextEditingController();
final TitleFocusNode = new FocusNode();
String Title;

var ProblemlabelColor = Color(0XFF919191);
bool validProblem = true;
final ProblemTextController = TextEditingController();
final ProblemFocusNode = new FocusNode();
String Problem;

var ImportancelabelColor = Color(0XFF919191);
bool validImportance = true;
final ImportanceTextController = TextEditingController();
final ImportanceFocusNode = new FocusNode();
String Importance;

class _ProblemStudyState extends State<ProblemStudy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFAFAFA),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: NavigationBar(),
      ),
      body: Center(
        child: Container(
          //height: MediaQuery.of(context).size.height * .40,
          margin: EdgeInsets.only(top: 40.0),
          width: MediaQuery.of(context).size.width * .40,
          decoration: BoxDecoration(
            color: Colors.white,
            //shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 2.0,
              ),
            ],
          ),
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Let's collect some details on the Customer's Problem",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                  TextFieldWidget(
                    labelText: 'Provide a title for your project',
                    myTextController: TitleTextController,
                    myFocusNode: TitleFocusNode,
                    validText: validTitle,
                    maxLines: 1,
                    textCollecter: Title,
                    helperText: '',
                    labelcolour: TitlelabelColor,
                  ),
                  TextFieldWidget(
                    labelText:
                        'Describe the problem that the customer is facing',
                    myTextController: ProblemTextController,
                    myFocusNode: ProblemFocusNode,
                    validText: validProblem,
                    maxLines: 3,
                    textCollecter: Problem,
                    helperText: '',
                    labelcolour: ProblemlabelColor,
                  ),
                  TextFieldWidget(
                    labelText: 'Why is the problem important to the customer?',
                    myTextController: ImportanceTextController,
                    myFocusNode: ImportanceFocusNode,
                    validText: validImportance,
                    maxLines: 3,
                    textCollecter: Importance,
                    helperText: '',
                    labelcolour: ImportancelabelColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        headBackButtton(),
                        SizedBox(
                          width: 50,
                        ),
                        goNextButton(OnTap: () {
                          bcpData[0].CompletionValidator = false;
                          print(bcpData[0].CompletionValidator);
                          Navigator.pushNamed(context, '/addpainpoints');
                        }),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
