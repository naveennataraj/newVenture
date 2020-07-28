import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/DropDown.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/Metrics/addMetrics.dart';
import 'package:iventure001/Data/CardData.dart';
import 'package:iventure001/Widgets/GoNextButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';

class AddProductMetrics extends StatefulWidget {
  @override
  _AddProductMetricsState createState() => _AddProductMetricsState();
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

class _AddProductMetricsState extends State<AddProductMetrics> {
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
                        goNextButton(
                          OnTap: () {
                            bcpData[7].CompletionValidator = false;

                            final NewMetric1 = addMetrics(
                                Name: 'Problem Space',
                                Description: CustomerProblemTextController.text,
                                SelectedOption: MetricsList[0]);
                            final NewMetric2 = addMetrics(
                                Name: 'Solution Space',
                                Description: SolutionTextController.text,
                                SelectedOption: MetricsList[1]);
                            final NewMetic3 = addMetrics(
                                Name: 'Evangelism',
                                Description: EvangelismTextController.text,
                                SelectedOption: MetricsList[2]);
                            final NewMetic4 = addMetrics(
                                Name: 'Scale',
                                Description: ScaleTextController.text,
                                SelectedOption: MetricsList[3]);
                            final NewMetic5 = addMetrics(
                                Name: 'Evolution',
                                Description: EvolutionTextController.text,
                                SelectedOption: MetricsList[4]);
                            final NewMetic6 = addMetrics(
                                Name: 'Ecosystem',
                                Description:
                                    ParallelSolutionTextController.text,
                                SelectedOption: MetricsList[5]);

                            setState(() {
                              if (CustomerProblemTextController.text != null) {
                                AddingNewMetrics.removeAt(0);
                                AddingNewMetrics.insert(0, NewMetric1);
                              }
                              if (SolutionTextController.text != null) {
                                AddingNewMetrics.removeAt(1);
                                AddingNewMetrics.insert(1, NewMetric2);
                              }
                              if (EvangelismTextController.text != null) {
                                AddingNewMetrics.removeAt(2);
                                AddingNewMetrics.insert(2, NewMetic3);
                              }
                              if (ScaleTextController.text != null) {
                                AddingNewMetrics.removeAt(3);
                                AddingNewMetrics.insert(3, NewMetic4);
                              }
                              if (EvolutionTextController.text != null) {
                                AddingNewMetrics.removeAt(4);
                                AddingNewMetrics.insert(4, NewMetic5);
                              }
                              if (ParallelSolutionTextController.text != null) {
                                AddingNewMetrics.removeAt(5);
                                AddingNewMetrics.insert(5, NewMetic6);
                              }

                              Navigator.pushNamed(context, '/addmetrics');
                            });
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
