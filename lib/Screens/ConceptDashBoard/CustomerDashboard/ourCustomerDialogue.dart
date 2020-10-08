import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/DropDown.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/StudyTheUser/addUserEnvironment.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/SaveButton.dart';

class ourCustomerDialogue extends StatefulWidget {
  final int ageStart;
  final int ageEnd;
  final String problemDomain;
  final bool inConceptDashboard;

  const ourCustomerDialogue(
      {this.ageStart,
      this.ageEnd,
      this.problemDomain,
      this.inConceptDashboard});

  @override
  _ourCustomerDialogueState createState() => _ourCustomerDialogueState();
}

double ageValuesStart = 18;
double ageValuesEnd = 35;

class _ourCustomerDialogueState extends State<ourCustomerDialogue> {
  RangeValues ageValues = RangeValues(ageValuesStart, ageValuesEnd);
  RangeLabels ageLabels = RangeLabels(
      ageValuesStart.toInt().toString(), ageValuesEnd.toInt().toString());
  final _firestore = Firestore.instance;
  var problemDroplabelColor = Colors.grey.shade600;
  var problemDropBorderColor = Color(0xFFABABAB);
  var problemDropValuerColor = Color(0xFFE95420);
  String SelectedProblemDomain;

  void initState() {
    //  implement initState
    setState(() {
      ageValuesStart = widget.ageStart.toDouble();
      ageValuesEnd = widget.ageEnd.toDouble();
      SelectedProblemDomain = widget.problemDomain;
      ageValues = RangeValues(ageValuesStart, ageValuesEnd);
      ageLabels = RangeLabels(
          ageValuesStart.toInt().toString(), ageValuesEnd.toInt().toString());
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
                  "Who are our customers?",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(width: 1, color: Color(0xFFABABAB)),
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
                                    fontWeight: FontWeight.bold, fontSize: 20),
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
                                ageValuesStart =
                                    ageValues.start.toInt() as double;
                                ageValuesEnd = ageValues.end.toInt() as double;
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
                                    fontWeight: FontWeight.bold, fontSize: 20),
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
                          Border.all(width: 1, color: problemDropBorderColor),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          'Which domain does this Problem fall in?',
                          style: TextStyle(
                              color: problemDroplabelColor, fontSize: 16),
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
                              color: problemDropValuerColor,
                            ),
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              SelectedProblemDomain = newValue;
                            });
                          },
                          items: ProblemDomainlist.map((String singleItem) {
                            return DropdownMenuItem<String>(
                                value: singleItem, child: Text(singleItem));
                          }).toList(),
                          value: SelectedProblemDomain,
                        ),
                      ],
                    ),
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
                        editableCard: false,
                        cardIcon: Icons.face,
                        cardTitle: 'Who are our customers?',
                        cardNote:
                            'Urban dwellers who are employed and aged between $ageValuesStart and $ageValuesEnd years . Solution is aimed at $SelectedProblemDomain market segment(s).',
                        onTap: () {},
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
                                  '$currentUser/StudyingTheUser/UserEnvironment')
                              .document(UserEnvironmentArray[0].ID)
                              .updateData({
                            'AgeStart': ageValues.start,
                            'AgeEnd': ageValues.end,
                            'ProblemDropdownValue': SelectedProblemDomain,
                          });
                          (widget.inConceptDashboard)
                              ? Navigator.popAndPushNamed(
                                  context, '/conceptDashboard')
                              : Navigator.popAndPushNamed(
                                  context, '/BUFDashboard');
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
