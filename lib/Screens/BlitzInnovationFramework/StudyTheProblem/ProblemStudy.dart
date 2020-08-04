import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/StudyTheUser/problemStudy.dart';
import 'package:iventure001/Data/CardData.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../../../Widgets/GoNextButton.dart';
import '../../../Widgets/HeadBackButton.dart';

class ProblemStudy extends StatefulWidget {
  @override
  _ProblemStudyState createState() => _ProblemStudyState();
}

class _ProblemStudyState extends State<ProblemStudy> {
  var TitlelabelColor = Color(0XFF919191);
  bool validTitle = true;
  var TitleTextController = TextEditingController();
  final TitleFocusNode = new FocusNode();
  String Title;

  var ProblemlabelColor = Color(0XFF919191);
  bool validProblem = true;
  var ProblemTextController = TextEditingController();
  final ProblemFocusNode = new FocusNode();
  String Problem;

  var ImportancelabelColor = Color(0XFF919191);
  bool validImportance = true;
  var ImportanceTextController = TextEditingController();
  final ImportanceFocusNode = new FocusNode();
  String Importance;

  String ID;
  bool spinner = false;
  validator() {
    setState(() {
      TitleTextController.text.isEmpty ? validTitle = false : validTitle = true;
      TitleTextController.text.isEmpty
          ? TitlelabelColor = Color(0xFFF53E70)
          : TitlelabelColor = Color(0xFF919191);
      ProblemTextController.text.isEmpty
          ? validProblem = false
          : validProblem = true;
      ProblemTextController.text.isEmpty
          ? ProblemlabelColor = Color(0xFFF53E70)
          : ProblemlabelColor = Color(0xFF919191);
      ImportanceTextController.text.isEmpty
          ? validImportance = false
          : validImportance = true;
      ImportanceTextController.text.isEmpty
          ? ImportancelabelColor = Color(0xFFF53E70)
          : ImportancelabelColor = Color(0xFF919191);
      print("(Validator is called)");
    });
  }

  final _firestore = Firestore.instance;

  void getDocument() async {
    spinner = true;
    final document = await _firestore.collection('problemStudy').getDocuments();
    print("GEt method called");

    for (var message in document.documents) {
      ProblemStudyArray = [];
      final Title = message.data['Title'];
      final Problem = message.data['Problem'];
      final Importance = message.data['Importance'];
      final ID = message.documentID;

      final fields = problemStudy(
          title: Title, problem: Problem, importance: Importance, ID: ID);

      ProblemStudyArray.add(fields);
    }
    setState(() {
      spinner = false;
      if (ProblemStudyArray.length != 0) {
        TitleTextController =
            TextEditingController(text: ProblemStudyArray[0].title);
        ProblemTextController =
            TextEditingController(text: ProblemStudyArray[0].problem);
        ImportanceTextController =
            TextEditingController(text: ProblemStudyArray[0].importance);
      }
    });
  }

  @override
  void initState() {
//    spinner = true;

    getDocument();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFAFAFA),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: NavigationBar(),
      ),
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Center(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Let's collect some details on the Customer's Problem",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
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
                      labelText:
                          'Why is the problem important to the customer?',
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
                          goNextButton(
                            OnTap: (TitleTextController.text == '' ||
                                    ProblemTextController.text == '' ||
                                    ImportanceTextController.text == '')
                                ? () {
                                    validator();
                                  }
                                : () {
                                    if (ProblemStudyArray.length != 0) {
                                      print("Update method called");
                                      _firestore
                                          .collection('problemStudy')
                                          .document(ProblemStudyArray[0].ID)
                                          .updateData({
                                        'Title': TitleTextController.text,
                                        'Problem': ProblemTextController.text,
                                        'Importance':
                                            ImportanceTextController.text,
                                        'Sender': "tester@gmail.com",
                                      });
//                                      ProblemStudyArray[0].title =
//                                          TitleTextController.text;
//                                      ProblemStudyArray[0].problem =
//                                          ProblemTextController.text;
//                                      ProblemStudyArray[0].importance =
//                                          ImportanceTextController.text;
                                    } else {
                                      print("add method called");
                                      _firestore
                                          .collection('problemStudy')
                                          .add({
                                        'Title': TitleTextController.text,
                                        'Problem': ProblemTextController.text,
                                        'Importance':
                                            ImportanceTextController.text,
                                        'Sender': "tester@gmail.com",
                                      });
//                                      final _field = problemStudy(
//                                          title: TitleTextController.text,
//                                          problem: ProblemTextController.text,
//                                          importance:
//                                              ImportanceTextController.text);
//                                      ProblemStudyArray.add(_field);
                                    }
                                    bcpData[0].CompletionValidator = false;
                                    Navigator.pushNamed(
                                        context, '/addpainpoints');
                                  },
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
