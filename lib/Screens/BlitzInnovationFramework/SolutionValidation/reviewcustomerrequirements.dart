import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionValidation/reviewcustomerrequirements.dart';
import 'package:iventure001/Data/CardData.dart';
import 'package:iventure001/Widgets/CompleteStepButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ReviewCustomerRequirements extends StatefulWidget {
  @override
  _ReviewCustomerRequirementsState createState() =>
      _ReviewCustomerRequirementsState();
}

DateTime selectDate = DateTime.now();
DateTime selectedDate;

class _ReviewCustomerRequirementsState
    extends State<ReviewCustomerRequirements> {
//  Date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: (selectedDate == null) ? DateTime.now() : selectedDate,
      firstDate: DateTime.now(),
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

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        selectDate = selectedDate;
      });
  }

  bool spinner = false;
  final _firestore = Firestore.instance;
  var dateColor = Color(0xFFE95420);

  validator() {
    setState(() {
      (selectDate == null)
          ? dateColor = Color(0xFFF53E70)
          : dateColor = Color(0xFFE95420);
    });
  }

  void getDocument() async {
    spinner = true;
    final document = await _firestore
        .collection('$currentUser/SolutionValidation/reviewDate')
        .getDocuments();
//    print("GEt method called");

    for (var message in document.documents) {
      addRequirementsArray = [];
      final selectedDate = message.data['ReviewDate'];
      final ID = message.documentID;

      final fields = reviewCustomerrequirements(
          SelectedDate: selectedDate.toDate(), ID: ID);

      addRequirementsArray.add(fields);
    }
    setState(() {
      spinner = false;
      if (addRequirementsArray.length != 0) {
        selectedDate = addRequirementsArray[0].SelectedDate;
      }
    });
  }

  update() {
    print("Update method called");
    _firestore
        .collection('$currentUser/SolutionValidation/reviewDate')
        .document(addRequirementsArray[0].ID)
        .updateData({
      'ReviewDate': selectDate,
      'Sender': currentUser,
    });
  }

  add() {
    print("add method called");
    _firestore.collection('$currentUser/SolutionValidation/reviewDate').add({
      'ReviewDate': selectDate,
      'Sender': currentUser,
    });
  }

  @override
  void initState() {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 40),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            "Schedule a Review of Problem-Solution fit",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        NoteCard(
                          Note:
                              'Tip: Customer pain points can change over time and the solution will need to evolve accordingly to stay relevant. Additionally, It might be a good idea to have a review of the problem-solution fit after some time, to see if the current solution concept is still the best option to resolve the customer pain points. These can be done after a 3 month, 6 month or 1 year window.',
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
                                  color: Color(0XFFABABAB),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(Icons.calendar_today),
                                    SizedBox(width: 20),
                                    (selectedDate != null)
                                        ? Text(
                                            "${selectDate.toLocal()}"
                                                .split(' ')[0],
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
                          padding: const EdgeInsets.all(30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              headBackButtton(),
                              SizedBox(
                                width: 50,
                              ),
                              CompleteStepButton(
                                OnTap: (selectDate == null)
                                    ? () {
                                        validator();
                                      }
                                    : () {
                                        if (addRequirementsArray.length != 0) {
                                          update();
                                        } else {
                                          add();
                                        }
                                        selectedDate = null;
                                        bcpData[5].CompletionValidator = true;
                                        print(bcpData[5].CompletionValidator);
                                        Navigator.pushNamed(context,
                                            '/BlitzInnovationFramework');
                                      },
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              DotsIndicator(
                decorator: DotsDecorator(
                  activeColor: const Color(0xFFE95420),
                ),
                dotsCount: 2,
                position: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
