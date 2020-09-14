import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionValidation/reviewcustomerrequirements.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/DashboardCard.dart';
import 'package:iventure001/Widgets/SaveButton.dart';

class solutionFitDialogue extends StatefulWidget {
  DateTime selectedDate;

  solutionFitDialogue({this.selectedDate});

  @override
  _solutionFitDialogueState createState() => _solutionFitDialogueState();
}

String date = '';

class _solutionFitDialogueState extends State<solutionFitDialogue> {
  final df = new DateFormat('dd-MMM-yyyy');

  final _firestore = Firestore.instance;
  var SolutionNamelabelColor = Color(0XFF919191);
  bool validSolutionName = true;
  var SolutionNameTextController = TextEditingController();
  final SolutiontNameFocusNode = new FocusNode();
  String SolutionName;

  var SolutionDescriptionLabelColor = Color(0XFF919191);
  bool validSolutionDescription = true;
  var SolutionDescriptionTextController = TextEditingController();
  final SolutionDescriptionFocusNode = new FocusNode();
  String SolutionDescription;

  requestFocus(FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

//  Date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate:
          (widget.selectedDate == null) ? DateTime.now() : widget.selectedDate,
      firstDate:
          (widget.selectedDate == null) ? DateTime.now() : widget.selectedDate,
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color(0xFFE95420),
            accentColor: const Color(0xFFE95420),
            colorScheme: ColorScheme.light(primary: const Color(0xFFE95420)),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child,
        );
      },
    );

    if (picked != null)
      setState(() {
        widget.selectedDate = picked;
//        selectDate = selectedDate;
        date = df.format(widget.selectedDate);
      });
  }

  bool spinner = false;

  var dateColor = Color(0xFFE95420);
  var borderColor = Color(0xFFABABAB);

  validator() {
    setState(() {
      (widget.selectedDate == null)
          ? dateColor = Color(0xFFF53E70)
          : dateColor = Color(0xFFE95420);
      (widget.selectedDate == null)
          ? borderColor = Color(0xFFF53E70)
          : borderColor = Color(0xFFABABAB);
    });
  }

  void initState() {
    //  implement initState
    setState(() {
      final df = new DateFormat('dd-MMM-yyyy');
      date = df.format(widget.selectedDate);
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
                    "Problem-Solution fit review",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          width: 1,
                          color: borderColor,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Icon(Icons.calendar_today),
                            SizedBox(width: 20),
                            (widget.selectedDate != null)
                                ? Text(
                                    date,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )
                                : Text(
                                    'Pick a date',
                                    style: TextStyle(color: dateColor),
                                  ),
                          ],
                        ),
                      ),
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
                    child: DashboardCards(
                      editableCard: false,
                      cardIcon: Icons.person,
                      cardTitle: 'Problem-Solution fit review',
                      cardNote:
                          'The Customer problem always keeps evolving. We need to check back for relevance of problem-solution fit. The date for the next review is : $date',
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
                                  '$currentUser/SolutionValidation/reviewDate')
                              .document(addRequirementsArray[0].ID)
                              .updateData({
                            'ReviewDate': widget.selectedDate,
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
