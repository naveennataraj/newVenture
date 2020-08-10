import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/DropDown.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/StudyTheUser/addUserEnvironment.dart';
import 'package:iventure001/Data/CardData.dart';
import 'package:iventure001/Widgets/GoNextButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AddUserEnvironmentDetails extends StatefulWidget {
  @override
  _AddUserEnvironmentDetailsState createState() =>
      _AddUserEnvironmentDetailsState();
}

double ageValuesStart = 18;
double ageValuesEnd = 35;

class _AddUserEnvironmentDetailsState extends State<AddUserEnvironmentDetails> {
  bool spinner = false;

  String SelectedProblemDomain;

  String SelectedUserEnvironment;
  RangeValues ageValues = RangeValues(ageValuesStart, ageValuesEnd);
  RangeLabels ageLabels = RangeLabels(
      ageValuesStart.toInt().toString(), ageValuesEnd.toInt().toString());
  final _firestore = Firestore.instance;

  bool validUserIssues = true;
  var UserIssueslabelColor = Color(0XFF919191);
  var UserIssuesTextController = TextEditingController();
  final UserIssuesFocusNode = new FocusNode();
  String UserIssues;

  bool validUserDetails = true;
  var UserDetailslabelColor = Color(0XFF919191);
  var UserDetailsTextController = TextEditingController();
  final UserDetailsFocusNode = new FocusNode();
  String UserDetails;

  validator() {
    setState(() {
      UserIssuesTextController.text.isEmpty
          ? validUserIssues = false
          : validUserIssues = true;
      UserIssuesTextController.text.isEmpty
          ? UserIssueslabelColor = Color(0xFFF53E70)
          : UserIssueslabelColor = Color(0xFF919191);
      UserDetailsTextController.text.isEmpty
          ? validUserDetails = false
          : validUserDetails = true;
      UserDetailsTextController.text.isEmpty
          ? UserDetailslabelColor = Color(0xFFF53E70)
          : UserDetailslabelColor = Color(0xFF919191);
    });
  }

  void getDocument() async {
    spinner = true;
    final document = await _firestore
        .collection('$currentUser/StudyingTheUser/UserEnvironment')
        .getDocuments();
//    print("GEt method called");

    for (var message in document.documents) {
      UserEnvironmentArray = [];
      final double Start = message.data['AgeStart'];
      final double End = message.data['AgeEnd'];
      final ProblemDropdownValue = message.data['ProblemDropdownValue'];

      final EnvironmentDropdownValue = message.data['EnvironmentDropdownValue'];

      final Issues = message.data['Issues'];
      final Details = message.data['Details'];
      final ID = message.documentID;

      final fields = addUserEnvironment(
          ageRangeStart: Start,
          ageRangeEnd: End,
          ProblemDrop: ProblemDropdownValue,
          EnvironmentDrop: EnvironmentDropdownValue,
          issues: Issues,
          detail: Details,
          ID: ID);

      UserEnvironmentArray.add(fields);
      print('Get Method called');
    }
    setState(() {
      spinner = false;

      if (UserEnvironmentArray.length != 0) {
        ageValuesStart = UserEnvironmentArray[0].ageRangeStart;
        ageValuesEnd = UserEnvironmentArray[0].ageRangeEnd;
        UserIssuesTextController =
            TextEditingController(text: UserEnvironmentArray[0].issues);
        UserDetailsTextController =
            TextEditingController(text: UserEnvironmentArray[0].detail);
        SelectedProblemDomain = UserEnvironmentArray[0].ProblemDrop;
        SelectedUserEnvironment = UserEnvironmentArray[0].EnvironmentDrop;
        ageValues = RangeValues(ageValuesStart, ageValuesEnd);
        ageLabels = RangeLabels(
            ageValuesStart.toInt().toString(), ageValuesEnd.toInt().toString());
      }
    });
  }

  update() {
    print("Update method called");

    _firestore
        .collection('$currentUser/StudyingTheUser/UserEnvironment')
        .document(UserEnvironmentArray[0].ID)
        .updateData({
      'AgeStart': ageValues.start,
      'AgeEnd': ageValues.end,
      'ProblemDropdownValue': SelectedProblemDomain,
      'EnvironmentDropdownValue': SelectedUserEnvironment,
      'Issues': UserIssuesTextController.text,
      'Details': UserDetailsTextController.text,
      'Sender': currentUser,
    });
  }

  add() {
    print("add method called");
    _firestore.collection('$currentUser/StudyingTheUser/UserEnvironment').add({
      'AgeStart': ageValues.start,
      'AgeEnd': ageValues.end,
      'ProblemDropdownValue': SelectedProblemDomain,
      'EnvironmentDropdownValue': SelectedUserEnvironment,
      'Issues': UserIssuesTextController.text,
      'Details': UserDetailsTextController.text,
      'Sender': currentUser,
    });
  }

  @override
  void initState() {
    super.initState();
    getDocument();
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  //height: MediaQuery.of(context).size.height * .40,
                  margin: EdgeInsets.only(top: 40.0),
                  width: MediaQuery.of(context).size.width * .50,
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
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            "Let's collect some additional details on the Customer and their Environment",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                      Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border:
                                Border.all(width: 1, color: Color(0XFFABABAB)),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Age Range:'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                          width: 1, color: Color(0XFFABABAB)),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  width: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      ageLabels.start,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: RangeSlider(
                                  labels: ageLabels,
                                  activeColor: Color(0XFFE95420),
                                  inactiveColor: Colors.grey,
                                  min: 5,
                                  max: 99,
                                  onChanged: (value) {
                                    setState(() {
                                      ageValues = value;
                                      ageLabels = RangeLabels(
                                          value.start.toInt().toString(),
                                          value.end.toInt().toString());
                                    });
                                  },
                                  values: ageValues,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                          width: 1, color: Color(0XFFABABAB)),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  width: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      ageLabels.end,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border:
                                Border.all(width: 1, color: Color(0XFFABABAB)),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                'Which domain does this Problem fall in?',
                                style: TextStyle(
                                    color: Colors.grey.shade600, fontSize: 16),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              DropdownButton(
                                isExpanded: true,
                                elevation: 30,
                                hint: Text(
                                  'Choose',
                                  style: TextStyle(
                                    color: Color(0XFFE95420),
                                  ),
                                ),
                                onChanged: (newValue) {
                                  setState(() {
                                    SelectedProblemDomain = newValue;
                                  });
                                },
                                items:
                                    ProblemDomainlist.map((String singleItem) {
                                  return DropdownMenuItem<String>(
                                      value: singleItem,
                                      child: Text(singleItem));
                                }).toList(),
                                value: SelectedProblemDomain,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border:
                                Border.all(width: 1, color: Color(0XFFABABAB)),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                'What Type of environment do the users live in?',
                                style: TextStyle(
                                    color: Colors.grey.shade600, fontSize: 16),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              DropdownButton(
                                isExpanded: true,
                                hint: Text(
                                  'Choose',
                                  style: TextStyle(
                                    color: Color(0XFFE95420),
                                  ),
                                ),
                                onChanged: (newValue) {
                                  setState(() {
                                    SelectedUserEnvironment = newValue;
                                  });
                                },
                                items: UserEnvironmentList.map(
                                    (String singleItem) {
                                  return DropdownMenuItem<String>(
                                      value: singleItem,
                                      child: Text(singleItem));
                                }).toList(),
                                value: SelectedUserEnvironment,
                              ),
                            ],
                          ),
                        ),
                      ),
                      TextFieldWidget(
                        labelText: "Where do the users face these issues?",
                        maxLines: 1,
                        validText: validUserIssues,
                        myFocusNode: UserIssuesFocusNode,
                        myTextController: UserIssuesTextController,
                        textCollecter: UserIssues,
                        helperText: '',
                        labelcolour: UserIssueslabelColor,
                      ),
                      TextFieldWidget(
                        labelText:
                            "Is there any other detail you would like to add?",
                        maxLines: 1,
                        validText: validUserDetails,
                        myFocusNode: UserDetailsFocusNode,
                        myTextController: UserDetailsTextController,
                        textCollecter: UserDetails,
                        helperText: '',
                        labelcolour: UserDetailslabelColor,
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
                              OnTap: (UserIssuesTextController.text == '' ||
                                      UserDetailsTextController.text == '' ||
                                      SelectedUserEnvironment == null ||
                                      SelectedProblemDomain == null)
                                  ? () {
                                      validator();
                                    }
                                  : () {
                                      if (UserEnvironmentArray.length != 0) {
                                        update();
                                      } else {
                                        add();
                                      }

                                      bcpData[1].CompletionValidator = false;
                                      print(bcpData[1].CompletionValidator);
                                      Navigator.pushNamed(
                                          context, '/addstoriespainpoints');
                                    },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DotsIndicator(
                  decorator: DotsDecorator(
                    activeColor: const Color(0xFFE95420),
                  ),
                  dotsCount: 3,
                  position: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
