import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Constants/DropDown.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step10_Metrics/ContentBcMetrics.dart';
import 'package:iventure001/Widgets/AddGenericButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcFrameworkData.dart';

class BcMetricsSection2 extends StatefulWidget {
  @override
  _BcMetricsSection2State createState() => _BcMetricsSection2State();
}

var CustomerProblemlabelColor = Color(0XFF919191);
bool validCustomerProblem = true;
var CustomerProblemTextController = TextEditingController();
final CustomerProblemFocusNode = new FocusNode();
String CustomerProblem;

var SolutionlabelColor = Color(0XFF919191);
bool validSolution = true;
var SolutionTextController = TextEditingController();
final SolutionFocusNode = new FocusNode();
String Solution;

var EvangelismlabelColor = Color(0XFF919191);
bool validEvangelism = true;
var EvangelismTextController = TextEditingController();
final EvangelismFocusNode = new FocusNode();
String Evangelism;

var ScalelabelColor = Color(0XFF919191);
bool validScale = true;
var ScaleTextController = TextEditingController();
final ScaleFocusNode = new FocusNode();
String Scale;

var EvolutionlabelColor = Color(0XFF919191);
bool validEvolution = true;
var EvolutionTextController = TextEditingController();
final EvolutionFocusNode = new FocusNode();
String Evolution;

var ParallelSolutionlabelColor = Color(0XFF919191);
bool validParallelSolution = true;
var ParallelSolutionTextController = TextEditingController();
final ParallelSolutionFocusNode = new FocusNode();
String ParallelSolution;

String ID;
bool spinner = false;
const userUid = "tester@gmail.com";

class _BcMetricsSection2State extends State<BcMetricsSection2> {
  final _firestore =
      Firestore.instance;

  String fireProblemData;
  String fireSolutionData;



  void getDocument() async {
    spinner = true;
    final document = await _firestore
        .collection('$currentUser/Bc10_metrics/addMoreMetrics')
        .getDocuments();
//    print("GEt method called");

    if (document.documents.isNotEmpty) {
      for (var message in document.documents) {
        AddingNewMetrics = [];
        final Name = message.data['Name'];
        final Description = message.data['Description'];
        final ID = message.documentID;

        final card = ContentBcMetrics(Name: Name, Description: Description, ID: ID);
        AddingNewMetrics.add(card);
        switch (ID) {
          case 'ProblemSpace':
            CustomerProblemTextController =
                TextEditingController(text: Description);
            break;
          case 'SolutionSpace':
            SolutionTextController = TextEditingController(text: Description);
            break;
          case 'Evangelism':
            EvangelismTextController = TextEditingController(text: Description);
            break;
          case 'Scale':
            ScaleTextController = TextEditingController(text: Description);
            break;
          case 'Evolution':
            EvolutionTextController = TextEditingController(text: Description);
            break;
          case 'Ecosystem':
            ParallelSolutionTextController =
                TextEditingController(text: Description);
            break;
        }
        print('Get Method called');
      }

    }

    setState(() {
      spinner = false;
    });
  }


//  void initState() {
//    super.initState();
//    //(fireMetricData == null)? getDocuments() : print ('data exists') ;
//    getDocuments();
//  }
//
//  void getDocuments() async {
//    final document = await _firestore.get();
//
//    if (document.exists) {
//      try {
//        setState(() {
//          CustomerProblem = document.data['CustomerProblem'];
//          Solution = document.data['SolutionSpace'];
//          Evangelism = document.data['Evangelism'];
//          Scale = document.data['Scale'];
//          Evolution = document.data['Evolution'];
//          ParallelSolution = document.data['ParallelSolution'];
//          ID = document.documentID;
//          //fireMetricData = document.data['metricSectionOne'];
//          CustomerProblemTextController.text = CustomerProblem;
//          SolutionTextController.text = Solution;
//          EvangelismTextController.text = Evangelism;
//          ScaleTextController.text = Scale;
//          EvolutionTextController.text = Evolution;
//          ParallelSolutionTextController.text = ParallelSolution;
//
//
//        });
//      } catch (e) {
//        print(e);
//      }
//
//      if (CustomerProblemTextController.text != null) {
//        AddingNewMetrics.removeAt(0);
//        final NewMetric1 = ContentBcMetrics(
//            Name: 'Problem Space',
//            Description: CustomerProblem,
//            ID: document.documentID
//            );
//        AddingNewMetrics.insert(0, NewMetric1);
//        _firestore.collection('Problem').add({
//          'Name': 'Problem Space',
//          'Description': CustomerProblem,
//        });
//      }
//
//
//      if (SolutionTextController.text != null) {
//        AddingNewMetrics.removeAt(1);
//        final NewMetric2 = ContentBcMetrics(
//            Name: 'Solution Space',
//            Description: Solution,
//            ID: document.documentID,
//            );
//        AddingNewMetrics.insert(1, NewMetric2);
//          _firestore.collection('addMoreMetrics').add({
//            'Name': 'Solution Space',
//            'Description': Solution,
//          });
//
//      }
//
//      if (EvangelismTextController.text != null) {
//        AddingNewMetrics.removeAt(2);
//        final NewMetric3 = ContentBcMetrics(
//            Name: 'Evangelism',
//            Description: Evangelism,
//            );
//        AddingNewMetrics.insert(2, NewMetric3);
//        _firestore.collection('addMoreMetrics').add({
//          'Name': 'Evangelism',
//          'Description': Evangelism,
//        });
//      }
//
//
//      if (ScaleTextController.text != null) {
//        AddingNewMetrics.removeAt(3);
//        final NewMetric4 = ContentBcMetrics(
//            Name: 'Scale',
//            Description: ScaleTextController.text,
//            );
//        AddingNewMetrics.insert(3, NewMetric4);
//        _firestore.collection('Scale').add({
//          'Name': 'Scale',
//          'Description': ScaleTextController.text,
//        });
//      }
//
//
//      if (EvolutionTextController.text != null) {
//        AddingNewMetrics.removeAt(4);
//        final NewMetic5 = ContentBcMetrics(
//            Name: 'Evolution',
//            Description: EvolutionTextController.text,
//            );
//        AddingNewMetrics.insert(4, NewMetic5);
//        _firestore.collection('Evolution').add({
//          'Name': 'Evolution',
//          'Description': Evolution,
//        });
//      }
//
//      if (ParallelSolutionTextController.text != '') {
//        AddingNewMetrics.removeAt(5);
//        final NewMetic6 = ContentBcMetrics(
//            Name: 'Ecosystem',
//            Description:
//            ParallelSolutionTextController.text,
//            );
//
//        AddingNewMetrics.insert(5, NewMetic6);
//        _firestore.collection('Ecosystem').add({
//          'Name': 'Ecosystem',
//          'Description': ParallelSolution,
//        });
//      }
//
////      final fields = ContentBcMetrics(
////
////          proposition: sellingProposition,
////          ID: ID);
////
//      //AddingNewMetrics.add(NewMetic6);
//    }
//  }




  //final _firestore = Firestore.instance.collection(userUid).document('Bc1_buildTheFoundation');
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
                      "Metrics - Provide one metric for each of the following:",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextFieldWidget(
                    labelText:
                        "Provide one metric which help track the customer problem:",
                    maxLines: 2,
                    validText: validCustomerProblem,
                    myFocusNode: CustomerProblemFocusNode,
                    myTextController: CustomerProblemTextController,
                    textCollecter: CustomerProblem,
                    helperText: '',
                    labelcolour: CustomerProblemlabelColor,
                  ),
                  TextFieldWidget(
                    labelText: "Provide one Metric for the solution",
                    maxLines: 2,
                    validText: validSolution,
                    myFocusNode: SolutionFocusNode,
                    myTextController: SolutionTextController,
                    textCollecter: Solution,
                    helperText:
                        'Provide one metric which will help track the impact of the solution on the customer problem',
                    labelcolour: SolutionlabelColor,
                  ),
                  TextFieldWidget(
                    labelText: "Provide one metric to measure evangelism",
                    maxLines: 2,
                    validText: validEvangelism,
                    myFocusNode: EvangelismFocusNode,
                    myTextController: EvangelismTextController,
                    textCollecter: Evangelism,
                    helperText: '', //TODO helper text
                    labelcolour: EvangelismlabelColor,
                  ),
                  TextFieldWidget(
                    labelText: "Provide one metric to handle scale",
                    maxLines: 2,
                    validText: validScale,
                    myFocusNode: ScaleFocusNode,
                    myTextController: ScaleTextController,
                    textCollecter: Scale,
                    helperText: '', //TODO helper text
                    labelcolour: ScalelabelColor,
                  ),
                  TextFieldWidget(
                    labelText:
                        "Provide one metric to measure the evolution of the customer problem",
                    maxLines: 2,
                    validText: validEvolution,
                    myFocusNode: EvolutionFocusNode,
                    myTextController: EvolutionTextController,
                    textCollecter: Evolution,
                    helperText: '',
                    labelcolour: EvolutionlabelColor,
                  ),
                  TextFieldWidget(
                    labelText:
                        "(Optional) Provide one metric for new parallel solutions",
                    maxLines: 2,
                    validText: validParallelSolution,
                    myFocusNode: ParallelSolutionFocusNode,
                    myTextController: ParallelSolutionTextController,
                    textCollecter: ParallelSolution,
                    helperText: '',
                    labelcolour: ParallelSolutionlabelColor,
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
                        AddGenericButton(
                          buttonName: 'ADD ADDITIONAL METRICS',
                          onTap: () {
                            bcStepsContent[9].bcCompletionValidator = false;

//                            final NewMetric1 = ContentBcMetrics(
//                                Name: 'Problem Space',
//                                Description: CustomerProblemTextController.text,
//                               );
//                            final NewMetric2 = ContentBcMetrics(
//                                Name: 'Solution Space',
//                                Description: SolutionTextController.text,
//                                );
//                            final NewMetic3 = ContentBcMetrics(
//                                Name: 'Evangelism',
//                                Description: EvangelismTextController.text,
//                                );
//                            final NewMetic4 = ContentBcMetrics(
//                                Name: 'Scale',
//                                Description: ScaleTextController.text,
//                                );
//                            final NewMetic5 = ContentBcMetrics(
//                                Name: 'Evolution',
//                                Description: EvolutionTextController.text,
//                                );
//                            final NewMetic6 = ContentBcMetrics(
//                                Name: 'Ecosystem',
//                                Description:
//                                    ParallelSolutionTextController.text,
//                                );


                            _firestore
                                .collection(
                                '$currentUser/Bc10_metrics/addMoreMetrics')
                                .document('ProblemSpace')
                                .setData({
                              'Name': 'Problem Space',
                              'Description':
                              CustomerProblemTextController.text,
                              'Sender': currentUser,
                            });

                            _firestore
                                .collection(
                                '$currentUser/Bc10_metrics/addMoreMetrics')
                                .document('SolutionSpace')
                                .setData({
                              'Name': 'Solution Space',
                              'Description':
                              SolutionTextController.text,
                              'Sender': currentUser,
                            });

                            _firestore
                                .collection(
                                '$currentUser/Bc10_metrics/addMoreMetrics')
                                .document('Evangelism')
                                .setData({
                              'Name': 'Evangelism',
                              'Description':
                              EvangelismTextController.text,

                              'Sender': currentUser,
                            });

                            _firestore
                                .collection(
                                '$currentUser/Bc10_metrics/addMoreMetrics')
                                .document('Scale')
                                .setData({
                              'Name': 'Scale',
                              'Description': ScaleTextController.text,
                              'Sender': currentUser,
                            });
                            _firestore
                                .collection(
                                '$currentUser/Bc10_metrics/addMoreMetrics')
                                .document('Evolution')
                                .setData({
                              'Name': 'Evolution',
                              'Description':
                              EvolutionTextController.text,
                              'Sender': currentUser,
                            });
                            _firestore
                                .collection(
                                '$currentUser/Bc10_metrics/addMoreMetrics')
                                .document('Ecosystem')
                                .setData({
                              'Name': 'Ecosystem',
                              'Description':
                              ParallelSolutionTextController.text,
                              'Sender': currentUser,
                            });

                            setState(() {
                              if (CustomerProblemTextController.text !=
                                  null) {
//                                AddingNewMetrics.removeAt(0);
//                                AddingNewMetrics.insert(0, NewMetric1);
                                _firestore
                                    .collection(
                                    '$currentUser/Bc10_metrics/addMoreMetrics')
                                    .document('ProblemSpace')
                                    .updateData({
                                  'Name': 'Problem Space',
                                  'Description':
                                  CustomerProblemTextController
                                      .text,
                                  'Sender': currentUser,
                                });
                              }
                              if (SolutionTextController.text != null) {
//                                AddingNewMetrics.removeAt(1);
//                                AddingNewMetrics.insert(1, NewMetric2);
                                _firestore
                                    .collection(
                                    '$currentUser/Bc10_metrics/addMoreMetrics')
                                    .document('SolutionSpace')
                                    .updateData({
                                  'Name': 'Solution Space',
                                  'Description':
                                  SolutionTextController.text,
                                  'Sender': currentUser,
                                });
                              }
                              if (EvangelismTextController.text !=
                                  null) {
//                                AddingNewMetrics.removeAt(2);
//                                AddingNewMetrics.insert(2, NewMetic3);
                                _firestore
                                    .collection(
                                    '$currentUser/Bc10_metrics/addMoreMetrics')
                                    .document('Evangelism')
                                    .updateData({
                                  'Name': 'Evangelism',
                                  'Description':
                                  EvangelismTextController.text,

                                  'Sender': currentUser,
                                });
                              }
                              if (ScaleTextController.text != null) {
//                                AddingNewMetrics.removeAt(3);
//                                AddingNewMetrics.insert(3, NewMetic4);
                                _firestore
                                    .collection(
                                    '$currentUser/Bc10_metrics/addMoreMetrics')
                                    .document('Scale')
                                    .updateData({
                                  'Name': 'Scale',
                                  'Description':
                                  ScaleTextController.text,

                                  'Sender': currentUser,
                                });
                              }
                              if (EvolutionTextController.text !=
                                  null) {
//                                AddingNewMetrics.removeAt(4);
//                                AddingNewMetrics.insert(4, NewMetic5);
                                _firestore
                                    .collection(
                                    '$currentUser/Bc10_metrics/addMoreMetrics')
                                    .document('Evolution')
                                    .updateData({
                                  'Name': 'Evolution',
                                  'Description':
                                  EvolutionTextController.text,

                                  'Sender': currentUser,
                                });
                              }
                              if (ParallelSolutionTextController.text !=
                                  null) {
//                                AddingNewMetrics.removeAt(5);
//                                AddingNewMetrics.insert(5, NewMetic6);
                                _firestore
                                    .collection(
                                    '$currentUser/Bc10_metrics/addMoreMetrics')
                                    .document('Ecosystem')
                                    .updateData({
                                  'Name': 'Ecosystem',
                                  'Description':
                                  ParallelSolutionTextController
                                      .text,
                                  'Sender': currentUser,
                                });
                              }

                              Navigator.pushNamed(
                                  context, '/BCStep10AddMoreMetrics');
                            });

//                            setState(() {
//                              _firestore.updateData({
//                                'CustomerProblem':
//                                    CustomerProblemTextController.text,
//                                'SolutionSpace': SolutionTextController.text,
//                                'Evangelism': EvangelismTextController.text,
//                                'Scale': ScaleTextController.text,
//                                'Evolution': EvolutionTextController.text,
//                                'Ecosystem': ParallelSolutionTextController.text,
//
//                              });
//
//                              if (CustomerProblemTextController.text != null) {
//                                _firestore
//                                    .collection(
//                                    userUid +'/Bc10_metrics/metrics')
//                                    .document('Problem Space')
//                                    .setData({
//                                  'Name': 'Problem Space',
//                                  'Description':
//                                  CustomerProblemTextController.text,
//                                  //'Sender': currentUser,
//                                });
//
//
//
////                                AddingNewMetrics.removeAt(0);
////                                AddingNewMetrics.insert(0, NewMetric1);
//                              }
//                              if (SolutionTextController.text != null) {
//                                AddingNewMetrics.removeAt(1);
//                                AddingNewMetrics.insert(1, NewMetric2);
//                              }
//                              if (EvangelismTextController.text != null) {
//                                AddingNewMetrics.removeAt(2);
//                                AddingNewMetrics.insert(2, NewMetic3);
//                              }
//                              if (ScaleTextController.text != null) {
//                                AddingNewMetrics.removeAt(3);
//                                AddingNewMetrics.insert(3, NewMetic4);
//                              }
//                              if (EvolutionTextController.text != null) {
//                                AddingNewMetrics.removeAt(4);
//                                AddingNewMetrics.insert(4, NewMetic5);
//                              }
//                              if (ParallelSolutionTextController.text != null) {
//                                AddingNewMetrics.removeAt(5);
//                                AddingNewMetrics.insert(5, NewMetic6);
//                              }
//
//                              Navigator.pushNamed(
//                                  context, '/BCStep10AddMoreMetrics');
//                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
