import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/StudyTheProblem/problemStudy.dart';
import 'package:iventure001/Widgets/GenericStepValidationButtonBIF.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailLabelColor = Color(0XFF919191);
  bool validEmail = true;
  var EmailTextController = TextEditingController(text: 'tester@gmail.com');
  final EmailFocusNode = new FocusNode();
  String Email;

  var PasswordlabelColor = Color(0XFF919191);
  bool validPassword = true;
  var PasswordTextController = TextEditingController(text: '123456');
  final PasswordFocusNode = new FocusNode();
  String Password;

  String ID;
  bool spinner = false;
  validator() {
    setState(() {
      EmailTextController.text.isEmpty ? validEmail = false : validEmail = true;
      EmailTextController.text.isEmpty
          ? emailLabelColor = Color(0xFFF53E70)
          : emailLabelColor = Color(0xFF919191);
      PasswordTextController.text.isEmpty
          ? validPassword = false
          : validPassword = true;
      PasswordTextController.text.isEmpty
          ? PasswordlabelColor = Color(0xFFF53E70)
          : PasswordlabelColor = Color(0xFF919191);

      print("(Validator is called)");
    });
  }

  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;

  void getDocument() async {
    spinner = true;
    final document = await _firestore
        .collection('$currentUser/StudyTheProblem/problemStudy')
        .getDocuments();
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
        EmailTextController =
            TextEditingController(text: ProblemStudyArray[0].title);
        PasswordTextController =
            TextEditingController(text: ProblemStudyArray[0].problem);
      }
    });
  }

  @override
  void initState() {
//    spinner = true;

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        //height: MediaQuery.of(context).size.height * .40,
                        margin: EdgeInsets.only(top: 40.0),
                        width: 500,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                "Welcome to Blitz Model Creation",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            TextFieldWidget(
                              labelText: 'Email',
                              myTextController: EmailTextController,
                              myFocusNode: EmailFocusNode,
                              validText: validEmail,
                              maxLines: 1,
                              textCollecter: Email,
                              helperText: '',
                              labelcolour: emailLabelColor,
                            ),
                            TextFieldWidget(
                              labelText: 'Password',
                              myTextController: PasswordTextController,
                              myFocusNode: PasswordFocusNode,
                              validText: validPassword,
                              maxLines: 1,
                              textCollecter: Password,
                              helperText: '',
                              labelcolour: PasswordlabelColor,
                              obscureText: true,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GenericStepButtonBIF(
                                    buttonName: 'LOGIN',
                                    widget: () async {
                                      setState(() {
                                        spinner = true;
                                      });
                                      print(EmailTextController.text);
                                      try {
                                        final user = await _auth
                                            .signInWithEmailAndPassword(
                                                email: EmailTextController.text,
                                                password: PasswordTextController
                                                    .text);
                                        if (user != null) {
                                          final loggedInUser =
                                              await _auth.currentUser();
                                          currentUser = loggedInUser.email;
                                          Navigator.pushNamed(
                                              context, '/homepage');
                                          setState(() {
                                            spinner = false;
                                          });
                                        }
                                      } catch (e) {
                                        print(e);

                                        spinner = false;
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: new Text(
                                              "Error!",
                                            ),
                                            content: new Text(e.message),
                                            actions: <Widget>[
                                              // usually buttons at the bottom of the dialog
                                              new FlatButton(
                                                child: new Text(
                                                  "OK",
                                                  style: TextStyle(
                                                    color: Color(
                                                      0XFFE95420,
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          ),
                                        ).then((_) => setState(() {}));
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  GenericStepButtonBIF(
                                    buttonName: 'SIGN UP',
                                    widget: () async {
                                      setState(() {
                                        spinner = true;
                                      });
                                      try {
                                        final newUser = await _auth
                                            .createUserWithEmailAndPassword(
                                                email: EmailTextController.text,
                                                password: PasswordTextController
                                                    .text);
                                        if (newUser != null) {
                                          final signedUpUser =
                                              await _auth.currentUser();
                                          currentUser = signedUpUser.email;
                                          Navigator.pushNamed(
                                              context, '/homepage');
                                        }
                                        setState(() {
                                          spinner = false;
                                        });
                                      } catch (e) {
                                        print(e);
                                        spinner = false;
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: new Text(
                                              "Error!",
                                            ),
                                            content: new Text(e.message),
                                            actions: <Widget>[
                                              // usually buttons at the bottom of the dialog
                                              new FlatButton(
                                                child: new Text(
                                                  "OK",
                                                  style: TextStyle(
                                                    color: Color(
                                                      0XFFE95420,
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          ),
                                        ).then((_) => setState(() {}));
                                      }
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
