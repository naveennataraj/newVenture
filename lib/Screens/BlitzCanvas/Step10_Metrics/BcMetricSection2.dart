import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step10_Metrics/ContentBcMetrics.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:dots_indicator/dots_indicator.dart';

class BcMetricsSection2 extends StatefulWidget {
  @override
  _BcMetricsSection2State createState() => _BcMetricsSection2State();
}

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
  Bread(label: "Section 1", route: '/BCStep10MetricSection1'),
  Bread(label: "Section 2", route: '/BCStep10MetricSection2'),
];

String ID;

class _BcMetricsSection2State extends State<BcMetricsSection2> {
  final _firestore = Firestore.instance;
  bool spinner = false;
  String fireEcosystemData;
  String fireSolutionData;

  List ecosystemList = [];


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

//  @override
//  void initState() {
//    getDocument();
//    super.initState();
//  }

  @override
  void initState() {
    if (currentUser != null) {
      getDocument();
    } else {
      _AnimatedFlutterLogoState();
    }
    super.initState();
  }

  void getDocument() async {
    spinner = true;
    final document = await _firestore
        .collection('$currentUser/Bc10_metrics/addMoreMetrics')
        .getDocuments();

    if (document.documents.isNotEmpty) {
      for (var message in document.documents) {
        AddingNewMetrics = [];
        final Name = message.data['Name'];
        final Description = message.data['Description'];
        final ID = message.documentID;

        (Name == 'Ecosystem') ? ecosystemList.add(Name) : {};

        final card =
            ContentBcMetrics(Name: Name, Description: Description, ID: ID);
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
            (ecosystemList.isNotEmpty) ?
            ParallelSolutionTextController =
                TextEditingController(text: Description) : ParallelSolutionTextController.text = '';
                fireEcosystemData = ParallelSolutionTextController.text;
            break;
        }
      }
    }
    setState(() {
      spinner = false;
    });
  }

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
//      ParallelSolutionTextController.text.isEmpty
//          ? ParallelSolutionlabelColor = Color(0xFFF53E70)
//          : ParallelSolutionlabelColor = Color(0xFF919191);
//      ParallelSolutionTextController.text.isEmpty
//          ? validParallelSolution = false
//          : validParallelSolution = true;
    });
  }

  Timer _timer;

  _AnimatedFlutterLogoState() {
    spinner = true;
    _timer = new Timer(const Duration(seconds: 2), () {
      setState(() {
        if (currentUser != null && currentUser != '') {
          getDocument();
        }
      });
    });
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
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Breadcrumb(breads: breads, color: Color(0xFFE95420)),
              ),
              Center(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          //height: MediaQuery.of(context).size.height * .40,
                          margin: EdgeInsets.only(top: 40.0),
                          width: 600, //MediaQuery.of(context).size.width * .40,
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
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
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
                                labelText:
                                    "Provide one Metric for the solution",
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
                                    "(Optional) Provide one metric for new parallel solutions",
                                maxLines: 2,
                                validText: validParallelSolution,
                                myFocusNode: ParallelSolutionFocusNode,
                                myTextController:
                                    ParallelSolutionTextController,
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
                                    GenericStepButton(
                                        buttonName: 'ADD ADDITIONAL METRICS',
                                        //routeName: '/BCStep10AddMoreMetrics',
                                        step: 9,
                                        stepBool: false,
                                        widget: (CustomerProblemTextController
                                                        .text ==
                                                    '' ||
                                                SolutionTextController.text ==
                                                    '' ||
                                                EvangelismTextController.text ==
                                                    '' ||
                                                ScaleTextController.text ==
                                                    '' ||
                                                EvolutionTextController.text ==
                                                    '')
                                            ? () {
                                                validator();
                                              }
                                            : () {
                                                _firestore
                                                    .collection(
                                                        '$currentUser/Bc10_metrics/addMoreMetrics')
                                                    .document('ProblemSpace')
                                                    .setData({
                                                  'Name': 'Problem Space',
                                                  'Description':
                                                      CustomerProblemTextController
                                                          .text,
                                                  'Sender': currentUser,
                                                });

                                                _firestore
                                                    .collection(
                                                        '$currentUser/Bc10_metrics/addMoreMetrics')
                                                    .document('SolutionSpace')
                                                    .setData({
                                                  'Name': 'Solution Space',
                                                  'Description':
                                                      SolutionTextController
                                                          .text,
                                                  'Sender': currentUser,
                                                });

                                                _firestore
                                                    .collection(
                                                        '$currentUser/Bc10_metrics/addMoreMetrics')
                                                    .document('Evangelism')
                                                    .setData({
                                                  'Name': 'Evangelism',
                                                  'Description':
                                                      EvangelismTextController
                                                          .text,
                                                  'Sender': currentUser,
                                                });

                                                _firestore
                                                    .collection(
                                                        '$currentUser/Bc10_metrics/addMoreMetrics')
                                                    .document('Scale')
                                                    .setData({
                                                  'Name': 'Scale',
                                                  'Description':
                                                      ScaleTextController.text,
                                                  'Sender': currentUser,
                                                });
                                                _firestore
                                                    .collection(
                                                        '$currentUser/Bc10_metrics/addMoreMetrics')
                                                    .document('Evolution')
                                                    .setData({
                                                  'Name': 'Evolution',
                                                  'Description':
                                                      EvolutionTextController
                                                          .text,
                                                  'Sender': currentUser,
                                                });

                                                if (ParallelSolutionTextController
                                                                .text != '')
                                                     {
                                                        _firestore
                                                            .collection(
                                                                '$currentUser/Bc10_metrics/addMoreMetrics')
                                                            .document(
                                                                'Ecosystem')
                                                            .setData({
                                                          'Name': 'Ecosystem',
                                                          'Description':
                                                              ParallelSolutionTextController
                                                                  .text,
                                                          'Sender': currentUser,
                                                        });
                                                      }


                                                setState(() {
                                                  if (CustomerProblemTextController
                                                          .text !=
                                                      null) {
//                                AddingNewMetrics.removeAt(0);
//                                AddingNewMetrics.insert(0, NewMetric1);
                                                    _firestore
                                                        .collection(
                                                            '$currentUser/Bc10_metrics/addMoreMetrics')
                                                        .document(
                                                            'ProblemSpace')
                                                        .updateData({
                                                      'Name': 'Problem Space',
                                                      'Description':
                                                          CustomerProblemTextController
                                                              .text,
                                                      'Sender': currentUser,
                                                    });
                                                  }
                                                  if (SolutionTextController
                                                          .text !=
                                                      null) {
//                                AddingNewMetrics.removeAt(1);
//                                AddingNewMetrics.insert(1, NewMetric2);
                                                    _firestore
                                                        .collection(
                                                            '$currentUser/Bc10_metrics/addMoreMetrics')
                                                        .document(
                                                            'SolutionSpace')
                                                        .updateData({
                                                      'Name': 'Solution Space',
                                                      'Description':
                                                          SolutionTextController
                                                              .text,
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
                                                            '$currentUser/Bc10_metrics/addMoreMetrics')
                                                        .document('Evangelism')
                                                        .updateData({
                                                      'Name': 'Evangelism',
                                                      'Description':
                                                          EvangelismTextController
                                                              .text,
                                                      'Sender': currentUser,
                                                    });
                                                  }
                                                  if (ScaleTextController
                                                          .text !=
                                                      null) {
//                                AddingNewMetrics.removeAt(3);
//                                AddingNewMetrics.insert(3, NewMetic4);
                                                    _firestore
                                                        .collection(
                                                            '$currentUser/Bc10_metrics/addMoreMetrics')
                                                        .document('Scale')
                                                        .updateData({
                                                      'Name': 'Scale',
                                                      'Description':
                                                          ScaleTextController
                                                              .text,
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
                                                            '$currentUser/Bc10_metrics/addMoreMetrics')
                                                        .document('Evolution')
                                                        .updateData({
                                                      'Name': 'Evolution',
                                                      'Description':
                                                          EvolutionTextController
                                                              .text,
                                                      'Sender': currentUser,
                                                    });
                                                  }
                                                  if (
                                                  fireEcosystemData != ParallelSolutionTextController.text
                                                       && fireEcosystemData !=
                                                          null ) {
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
                                                  } else {

                                                  }

                                                  (CustomerProblemTextController.text != '' &&
                                                          SolutionTextController
                                                                  .text !=
                                                              '' &&
                                                          EvangelismTextController
                                                                  .text !=
                                                              '' &&
                                                          ScaleTextController
                                                                  .text !=
                                                              '' &&
                                                          EvolutionTextController
                                                                  .text !=
                                                              '')
                                                      ? Navigator.pushNamed(
                                                          context,
                                                          '/BCStep10AddMoreMetrics')
                                                      : {};
//                              Navigator.pushNamed(
//                                  context, '/BCStep10AddMoreMetrics');

                                                  ParallelSolutionTextController.clear();


                                                });
                                              }),
                                  ],
                                ),
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
                dotsCount: 3,
                position: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
