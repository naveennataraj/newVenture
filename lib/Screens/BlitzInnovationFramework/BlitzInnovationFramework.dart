import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/CardData.dart';
import 'package:iventure001/Widgets/FrameworkCards.dart';
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
  final _firestore = Firestore.instance
      .collection(currentUser)
      .document('stepValidationInnovationFramework');
  int i = 0;
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
    final document = await _firestore.get();

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

        bcpData[0].CompletionValidator = firebaseStep0;
        bcpData[1].CompletionValidator = firebaseStep1;
        bcpData[2].CompletionValidator = firebaseStep2;
        bcpData[3].CompletionValidator = firebaseStep3;
        bcpData[4].CompletionValidator = firebaseStep4;
        bcpData[5].CompletionValidator = firebaseStep5;
        bcpData[6].CompletionValidator = firebaseStep6;
        bcpData[7].CompletionValidator = firebaseStep7;
        setState(() {
          spinner = false;
        });
        ID = document.documentID;

        setState(() {
          print('I should update');
        });
      } catch (e) {
        print(e);
        setState(() {
          spinner = false;
        });
      }
    }
  }

  @override
  void initState() {
    getDocuments();
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
                      ? 50
                      : (MediaQuery.of(context).size.width <= 750) ? 50 : 30,
                  right: (MediaQuery.of(context).size.width >= 1400)
                      ? 50
                      : (MediaQuery.of(context).size.width <= 750) ? 50 : 30,
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
                                  ? 1.6
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
                          navigateTo: bcpData[index].navigateTo),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
