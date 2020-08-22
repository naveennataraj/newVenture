import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:iventure001/Constants/DropDown.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/Metrics/addMetrics.dart';
import 'package:iventure001/Data/CardData.dart';
import 'package:iventure001/Widgets/GenericStepValidationButtonBIF.dart';
import 'package:iventure001/Widgets/HeadBackMenu.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AddProductMetrics extends StatefulWidget {
  @override
  _AddProductMetricsState createState() => _AddProductMetricsState();
}

class _AddProductMetricsState extends State<AddProductMetrics> {
  List<Bread> breads = [
    Bread(label: "Home ", route: '/'),
    Bread(
        label: "Blitz Innovation Framework ",
        route: '/BlitzInnovationFramework'),
    Bread(label: "Add Product Metrics ", route: '/addproductmetrics'),
  ];
  final _firestore = Firestore.instance;

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
  bool spinner = false;

  validator() {
    setState(() {
      CustomerProblemTextController.text.isEmpty
          ? validCustomerProblem = false
          : validCustomerProblem = true;
      CustomerProblemTextController.text.isEmpty
          ? CustomerProblemlabelColor = Color(0xFFF53E70)
          : CustomerProblemlabelColor = Color(0xFF919191);
      SolutionTextController.text.isEmpty
          ? validSolution = false
          : validSolution = true;
      SolutionTextController.text.isEmpty
          ? SolutionlabelColor = Color(0xFFF53E70)
          : SolutionlabelColor = Color(0xFF919191);
      EvangelismTextController.text.isEmpty
          ? validEvangelism = false
          : validEvangelism = true;
      EvangelismTextController.text.isEmpty
          ? EvangelismlabelColor = Color(0xFFF53E70)
          : EvangelismlabelColor = Color(0xFF919191);
      ScaleTextController.text.isEmpty ? validScale = false : validScale = true;
      ScaleTextController.text.isEmpty
          ? ScalelabelColor = Color(0xFFF53E70)
          : ScalelabelColor = Color(0xFF919191);
      EvolutionTextController.text.isEmpty
          ? validEvolution = false
          : validEvolution = true;
      EvolutionTextController.text.isEmpty
          ? EvolutionlabelColor = Color(0xFFF53E70)
          : EvolutionlabelColor = Color(0xFF919191);
      ParallelSolutionTextController.text.isEmpty
          ? ParallelSolutionlabelColor = Color(0xFFF53E70)
          : ParallelSolutionlabelColor = Color(0xFF919191);
      ParallelSolutionTextController.text.isEmpty
          ? validParallelSolution = false
          : validParallelSolution = true;
    });
  }

  void getDocument() async {
    spinner = true;
    final document = await _firestore
        .collection('$currentUser/Metrics/metrics')
        .getDocuments();
//    print("GEt method called");

    for (var message in document.documents) {
      AddingNewMetrics = [];
      final Name = message.data['Name'];
      final Description = message.data['Description'];
      final ID = message.documentID;

      final card = addMetrics(Name: Name, Description: Description, ID: ID);
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
    setState(() {
      spinner = false;
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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Breadcrumb(breads: breads, color: Color(0xFFE95420)),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        //height: MediaQuery.of(context).size.height * .40,
                        margin: EdgeInsets.only(top: 40.0),
                        width: 600,
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
                                "Metrics - Provide one metric for each of the following:",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
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
                              labelText:
                                  "Provide one metric to measure evangelism",
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
                                  "Provide one metric for new parallel solutions",
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
                                  headBackButtton(
                                    routeName: '/BlitzInnovationFramework',
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  GenericStepButtonBIF(
                                    buttonName: 'GO NEXT',
//                                    routeName: '/addpainpoints',
                                    step: 7,
                                    stepBool: false,
                                    widget: (CustomerProblemTextController.text ==
                                                '' ||
                                            SolutionTextController.text == '' ||
                                            EvangelismTextController.text ==
                                                '' ||
                                            ScaleTextController.text == '' ||
                                            EvolutionTextController.text ==
                                                '' ||
                                            ParallelSolutionTextController
                                                    .text ==
                                                '')
                                        ? () {
                                            validator();
                                          }
                                        : () {
                                            bcpData[7].CompletionValidator =
                                                false;

//                            final NewMetric1 = addMetrics(
//                                Name: 'Problem Space',
//                                Description: CustomerProblemTextController.text,
//                                SelectedOption: MetricsList[0]);
                                            _firestore
                                                .collection(
                                                    '$currentUser/Metrics/metrics')
                                                .document('ProblemSpace')
                                                .setData({
                                              'Name': 'Problem Space',
                                              'Description':
                                                  CustomerProblemTextController
                                                      .text,
                                              'SelectedOption': [
                                                MetricsList[0].value,
                                                MetricsList[0].name
                                              ],
                                              'Sender': currentUser,
                                            });
//                            final NewMetric2 = addMetrics(
//                                Name: 'Solution Space',
//                                Description: SolutionTextController.text,
//                                SelectedOption: MetricsList[1]);
                                            _firestore
                                                .collection(
                                                    '$currentUser/Metrics/metrics')
                                                .document('SolutionSpace')
                                                .setData({
                                              'Name': 'Solution Space',
                                              'Description':
                                                  SolutionTextController.text,
                                              'SelectedOption': [
                                                MetricsList[1].value,
                                                MetricsList[1].name
                                              ],
                                              'Sender': currentUser,
                                            });
//                            final NewMetic3 = addMetrics(
//                                Name: 'Evangelism',
//                                Description: EvangelismTextController.text,
//                                SelectedOption: MetricsList[2]);
                                            _firestore
                                                .collection(
                                                    '$currentUser/Metrics/metrics')
                                                .document('Evangelism')
                                                .setData({
                                              'Name': 'Evangelism',
                                              'Description':
                                                  EvangelismTextController.text,
                                              'SelectedOption': [
                                                MetricsList[2].value,
                                                MetricsList[2].name
                                              ],
                                              'Sender': currentUser,
                                            });
//                            final NewMetic4 = addMetrics(
//                                Name: 'Scale',
//                                Description: ScaleTextController.text,
//                                SelectedOption: MetricsList[3]);
                                            _firestore
                                                .collection(
                                                    '$currentUser/Metrics/metrics')
                                                .document('Scale')
                                                .setData({
                                              'Name': 'Scale',
                                              'Description':
                                                  ScaleTextController.text,
                                              'SelectedOption': [
                                                MetricsList[3].value,
                                                MetricsList[3].name
                                              ],
                                              'Sender': currentUser,
                                            });
//                            final NewMetic5 = addMetrics(
//                                Name: 'Evolution',
//                                Description: EvolutionTextController.text,
//                                SelectedOption: MetricsList[4]);
                                            _firestore
                                                .collection(
                                                    '$currentUser/Metrics/metrics')
                                                .document('Evolution')
                                                .setData({
                                              'Name': 'Evolution',
                                              'Description':
                                                  EvolutionTextController.text,
                                              'SelectedOption': [
                                                MetricsList[4].value,
                                                MetricsList[4].name
                                              ],
                                              'Sender': currentUser,
                                            });
//                            final NewMetic6 = addMetrics(
//                                Name: 'Ecosystem',
//                                Description:
//                                    ParallelSolutionTextController.text,
//                                SelectedOption: MetricsList[5]);
                                            _firestore
                                                .collection(
                                                    '$currentUser/Metrics/metrics')
                                                .document('Ecosystem')
                                                .setData({
                                              'Name': 'Ecosystem',
                                              'Description':
                                                  ParallelSolutionTextController
                                                      .text,
                                              'SelectedOption': [
                                                MetricsList[5].value,
                                                MetricsList[5].name
                                              ],
                                              'Sender': currentUser,
                                            });

                                            setState(() {
                                              if (CustomerProblemTextController
                                                      .text !=
                                                  null) {
//                                AddingNewMetrics.removeAt(0);
//                                AddingNewMetrics.insert(0, NewMetric1);
                                                _firestore
                                                    .collection(
                                                        '$currentUser/Metrics/metrics')
                                                    .document('ProblemSpace')
                                                    .updateData({
                                                  'Name': 'Problem Space',
                                                  'Description':
                                                      CustomerProblemTextController
                                                          .text,
                                                  'SelectedOption': [
                                                    MetricsList[0].value,
                                                    MetricsList[0].name
                                                  ],
                                                  'Sender': currentUser,
                                                });
                                              }
                                              if (SolutionTextController.text !=
                                                  null) {
//                                AddingNewMetrics.removeAt(1);
//                                AddingNewMetrics.insert(1, NewMetric2);
                                                _firestore
                                                    .collection(
                                                        '$currentUser/Metrics/metrics')
                                                    .document('SolutionSpace')
                                                    .updateData({
                                                  'Name': 'Solution Space',
                                                  'Description':
                                                      SolutionTextController
                                                          .text,
                                                  'SelectedOption': [
                                                    MetricsList[1].value,
                                                    MetricsList[1].name
                                                  ],
                                                  'Sender': currentUser,
                                                });
                                              }
                                              if (EvangelismTextController
                                                      .text !=
                                                  null) {
//                                AddingNewMetrics.removeAt(2);
//                                AddingNewMetrics.insert(2, NewMetic3);
                                                _firestore
                                                    .collection(
                                                        '$currentUser/Metrics/metrics')
                                                    .document('Evangelism')
                                                    .updateData({
                                                  'Name': 'Evangelism',
                                                  'Description':
                                                      EvangelismTextController
                                                          .text,
                                                  'SelectedOption': [
                                                    MetricsList[2].value,
                                                    MetricsList[2].name
                                                  ],
                                                  'Sender': currentUser,
                                                });
                                              }
                                              if (ScaleTextController.text !=
                                                  null) {
//                                AddingNewMetrics.removeAt(3);
//                                AddingNewMetrics.insert(3, NewMetic4);
                                                _firestore
                                                    .collection(
                                                        '$currentUser/Metrics/metrics')
                                                    .document('Scale')
                                                    .updateData({
                                                  'Name': 'Scale',
                                                  'Description':
                                                      ScaleTextController.text,
                                                  'SelectedOption': [
                                                    MetricsList[3].value,
                                                    MetricsList[3].name
                                                  ],
                                                  'Sender': currentUser,
                                                });
                                              }
                                              if (EvolutionTextController
                                                      .text !=
                                                  null) {
//                                AddingNewMetrics.removeAt(4);
//                                AddingNewMetrics.insert(4, NewMetic5);
                                                _firestore
                                                    .collection(
                                                        '$currentUser/Metrics/metrics')
                                                    .document('Evolution')
                                                    .updateData({
                                                  'Name': 'Evolution',
                                                  'Description':
                                                      EvolutionTextController
                                                          .text,
                                                  'SelectedOption': [
                                                    MetricsList[4].value,
                                                    MetricsList[4].name
                                                  ],
                                                  'Sender': currentUser,
                                                });
                                              }
                                              if (ParallelSolutionTextController
                                                      .text !=
                                                  null) {
//                                AddingNewMetrics.removeAt(5);
//                                AddingNewMetrics.insert(5, NewMetic6);
                                                _firestore
                                                    .collection(
                                                        '$currentUser/Metrics/metrics')
                                                    .document('Ecosystem')
                                                    .updateData({
                                                  'Name': 'Ecosystem',
                                                  'Description':
                                                      ParallelSolutionTextController
                                                          .text,
                                                  'SelectedOption': [
                                                    MetricsList[5].value,
                                                    MetricsList[5].name
                                                  ],
                                                  'Sender': currentUser,
                                                });
                                              }

                                              (CustomerProblemTextController.text != '' &&
                                                      SolutionTextController
                                                              .text !=
                                                          '' &&
                                                      EvangelismTextController.text !=
                                                          '' &&
                                                      ScaleTextController
                                                              .text !=
                                                          '' &&
                                                      EvolutionTextController
                                                              .text !=
                                                          '' &&
                                                      ParallelSolutionTextController
                                                              .text !=
                                                          '')
                                                  ? Navigator.pushNamed(
                                                      context, '/addmetrics')
                                                  : {};
                                            });
                                          },
                                  ),
                                ],
                              ),
                            ),
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
                        dotsCount: 2,
                        position: 0,
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
