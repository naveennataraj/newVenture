import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/DropDown.dart';
import 'package:iventure001/Widgets/GoNextButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';

class AddUserEnvironmentDetails extends StatefulWidget {
  @override
  _AddUserEnvironmentDetailsState createState() =>
      _AddUserEnvironmentDetailsState();
}

class _AddUserEnvironmentDetailsState extends State<AddUserEnvironmentDetails> {
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

  RangeValues ageValues = RangeValues(18, 35);
  RangeLabels ageLabels = RangeLabels('18', '35');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProblemDomaindropdown = buildDropDownMenuItems(ProblemDomainlist);
    UserEnvironmentdropdown = buildDropDownMenuItems(UserEnvironmentList);
  }

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
                        "Let's collect some additional details on the Customer and their Environment",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                  Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(width: 1, color: Color(0XFFABABAB)),
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
                        border: Border.all(width: 1, color: Color(0XFFABABAB)),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(
                            'Which domain does this Problem fall in?',
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 16),
                          ),
                          Flexible(
                            child: SizedBox(
                              width: 100,
                            ),
                          ),
                          DropdownButton(
                            hint: Text('Choose'),
                            onChanged: (newValue) {
                              setState(() {
                                SelectedProblemDomain = newValue;
                              });
                            },
                            items: ProblemDomaindropdown,
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
                        border: Border.all(width: 1, color: Color(0XFFABABAB)),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(
                            'What Type of environment do the users live in?',
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 16),
                          ),
                          Flexible(
                            child: SizedBox(
                              width: 100,
                            ),
                          ),
                          DropdownButton(
                            hint: Text('Choose'),
                            onChanged: (newValue) {
                              setState(() {
                                SelectedUserEnvironment = newValue;
                              });
                            },
                            items: UserEnvironmentdropdown,
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
                          routeName: '/addstoriespainpoints',
                        ),
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
