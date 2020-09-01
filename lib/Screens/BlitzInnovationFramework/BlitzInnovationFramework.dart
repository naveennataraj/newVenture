import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionValidation/reviewcustomerrequirements.dart';
import 'package:iventure001/Data/CardData.dart';
import 'package:iventure001/Widgets/FrameworkCards.dart';
import 'package:iventure001/Widgets/ReviewFitDialog.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

String ID;

class BlitzInnovationFramework extends StatefulWidget {
  @override
  _BlitzInnovationFrameworkState createState() =>
      _BlitzInnovationFrameworkState();
}

bool spinner = false;
List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(
      label: "Blitz Innovation Framework ", route: '/BlitzInnovationFramework'),
];

class _BlitzInnovationFrameworkState extends State<BlitzInnovationFramework> {
  final _firestore = Firestore.instance;
  DateTime selectedDate;
  DateTime currentDate = DateTime.now();
  int i = 0;
  var diff;
  bool firebaseStep0;
  bool firebaseStep1;
  bool firebaseStep2;
  bool firebaseStep3;
  bool firebaseStep4;
  bool firebaseStep5;
  bool firebaseStep6;
  bool firebaseStep7;
  void getDocuments() async {
    setState(() {
      spinner = true;
    });

    final document = await _firestore
        .collection(currentUser)
        .document('stepValidationInnovationFramework')
        .get();

    if (document.exists) {
      try {
        firebaseStep0 = document.data['bcStepsContent0'];
        firebaseStep1 = document.data['bcStepsContent1'];
        firebaseStep2 = document.data['bcStepsContent2'];
        firebaseStep3 = document.data['bcStepsContent3'];
        firebaseStep4 = document.data['bcStepsContent4'];
        firebaseStep5 = document.data['bcStepsContent5'];
        firebaseStep6 = document.data['bcStepsContent6'];
        firebaseStep7 = document.data['bcStepsContent7'];

        ID = document.documentID;

        setState(() {
          bcpData[0].CompletionValidator = firebaseStep0;
          bcpData[1].CompletionValidator = firebaseStep1;
          bcpData[2].CompletionValidator = firebaseStep2;
          bcpData[3].CompletionValidator = firebaseStep3;
          bcpData[4].CompletionValidator = firebaseStep4;
          bcpData[5].CompletionValidator = firebaseStep5;
          bcpData[6].CompletionValidator = firebaseStep6;
          bcpData[7].CompletionValidator = firebaseStep7;
        });
      } catch (e) {
        print(e);
        setState(() {
          spinner = false;
        });
      }
    }
    final reviewDocument = await _firestore
        .collection('$currentUser/SolutionValidation/reviewDate')
        .getDocuments();
    print("GEt method called");

    for (var message in reviewDocument.documents) {
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
        diff = selectedDate.difference(currentDate).inDays;
        print("----------------- date difference $diff");
        bcpData[5].daysRemaining = diff;
        if (diff < 1) {
          showDialog(
            context: context,
            builder: (BuildContext context) => ReviewFitDialog(
              firebaseStep0: firebaseStep0,
              firebaseStep1: firebaseStep1,
              firebaseStep2: firebaseStep2,
              firebaseStep3: firebaseStep3,
              firebaseStep4: firebaseStep4,
              firebaseStep5: firebaseStep5,
            ),
          ).then((_) => setState(() {}));
        }
      }
    });
  }

  @override
  void initState() {
//    getCurrentUser();
    print(currentUser);
    if (currentUser != null) {
      getDocuments();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iVENTURE'),
        backgroundColor: Color(0XFFE95420),
      ),
      backgroundColor: Color(0XFFFAFAFA),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Breadcrumb(breads: breads, color: Color(0xFFE95420)),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Blitz Innovation Framework',
                  style: topHeadingTextStyle,
                  //TextStyle(fontSize: 60),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Material(
                  color: Colors.white,
                  elevation: 5,
                  child: Container(
                    margin: EdgeInsets.all(15),
                    height: 300,
                    width: 800,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Text(
                            'Blitz Unified Framework',
                            style: TextStyle(fontSize: 30),
                            textAlign: TextAlign.center,
                          ),
                          Flexible(
                            child: SizedBox(
                              height: 30,
                            ),
                          ),
                          Text(
                            'Welcome to a innovation oriented software product development exercise using the Blitz Innovation Framework.',
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                          Flexible(
                            child: SizedBox(
                              height: 30,
                            ),
                          ),
                          Text(
                            'In the NEXT EIGHT STEPS, we will go through the steps of developing an SAMPLE innovative software product concept. For the purpose of this exercise, the fictional product offered to the customer is a To-Do list application',
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                          Flexible(
                            child: SizedBox(
                              height: 30,
                            ),
                          ),
                          Text(
                            'PLEASE NOTE: THIS IS AN INNOVATION DRIVEN NEW PRODUCT CONCEPTUALIZATION EXERCISE. THE ENTRIES FOR EACH STEP HAS ALREADY BEEN FILLED IN.',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Flexible(
                            child: SizedBox(
                              height: 30,
                            ),
                          ),
                          Text(
                            "Please choose the 'Let's get started' button below to get started with this process.",
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                          Flexible(
                            child: SizedBox(
                              height: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: (MediaQuery.of(context).size.width >= 1400)
                      ? 30
                      : (MediaQuery.of(context).size.width <= 750) ? 5 : 10,
                  right: (MediaQuery.of(context).size.width >= 1400)
                      ? 30
                      : (MediaQuery.of(context).size.width <= 750) ? 20 : 30,
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: bcpData.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1.5,
                      childAspectRatio:
                          (MediaQuery.of(context).size.width >= 1400)
                              ? 2.3
                              : (MediaQuery.of(context).size.width <= 800)
                                  ? 1.5
                                  : 1.8,
                      crossAxisCount: (MediaQuery.of(context).size.width >=
                              1400)
                          ? 3
                          : (MediaQuery.of(context).size.width <= 800) ? 1 : 2),
                  itemBuilder: (BuildContext context, int index) {
                    return ModalProgressHUD(
                      inAsyncCall: spinner,
                      child: FrameworkCards(
                        stepCompleteValidator:
                            bcpData[index].CompletionValidator,
                        frameworkicon: bcpData[index].frameworkicon,
                        frameworkStep: bcpData[index].frameworkStep,
                        frameworkdescrip: bcpData[index].frameworkdescrip,
                        buttonText: bcpData[index].buttonText,
                        navigateTo: bcpData[index].navigateTo,
                        daysRemaining: bcpData[index].daysRemaining,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: (firebaseStep0 == true &&
              firebaseStep1 == true &&
              firebaseStep2 == true &&
              firebaseStep3 == true &&
              firebaseStep4 == true &&
              firebaseStep5 == true &&
              firebaseStep6 == true &&
              firebaseStep7 == true)
          ? Container(
              margin: EdgeInsets.all(100),
              child: FloatingActionButton(
                tooltip: "Proceeds To Concept Dashboard",
                backgroundColor: Color(0XFFE95420),
                onPressed: () {
                  Navigator.pushNamed(context, '/conceptDashboard');
                },
                child: Icon(Icons.dashboard),
              ),
            )
          : Container(),
    );
  }
}
