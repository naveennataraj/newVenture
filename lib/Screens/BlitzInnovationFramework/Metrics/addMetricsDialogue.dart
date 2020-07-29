import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/DropDown.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/Metrics/addMetrics.dart';
import 'package:iventure001/Widgets/AddMetricButton.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';

class addMetricsDialogue extends StatefulWidget {
  final int index;

  const addMetricsDialogue({this.index});
  @override
  _addMetricsDialogueState createState() => _addMetricsDialogueState(index);
}

var MetricsNamelabelColor = Color(0XFF919191);
bool validSMetricsName = true;
var MetricsNameTextController = TextEditingController();
final MetricsNameFocusNode = new FocusNode();
String MetricsName;

class _addMetricsDialogueState extends State<addMetricsDialogue> {
  int index;

  _addMetricsDialogueState(this.index);
  @override
  void initState() {
    super.initState();
    Metricsdropdown = buildDropDownMenuItems(MetricsList);
    if (index != null) {
      MetricsNameTextController =
          TextEditingController(text: AddingNewMetrics[index].Description);
      SelectedMetrics = AddingNewMetrics[index].SelectedOption;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)), //this right here
        child: Container(
          height: MediaQuery.of(context).size.height * 0.50,
          width: MediaQuery.of(context).size.width * 0.5,
          child: Center(
            child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Add a metric:",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TextFieldWidget(
                      labelText: "Wnter a name Briefly describing the metric",
                      maxLines: 2,
                      validText: validSMetricsName,
                      myFocusNode: MetricsNameFocusNode,
                      myTextController: MetricsNameTextController,
                      textCollecter: MetricsName,
                      helperText: '',
                      labelcolour: MetricsNamelabelColor,
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border:
                              Border.all(width: 1, color: Color(0XFFABABAB)),
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
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: DropdownButton(
                                hint: Text(
                                  'Choose',
                                  style: TextStyle(
                                    color: Color(0XFFE95420),
                                  ),
                                ),
                                onChanged: (newValue) {
                                  setState(() {
                                    SelectedMetrics = newValue;
                                  });
                                },
                                items: Metricsdropdown,
                                value: SelectedMetrics,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AddMetricButton(
                            onTap: () {
                              setState(() {
                                final NewMetrics = addMetrics(
                                  Name: SelectedMetrics.name,
                                  Description: MetricsNameTextController.text,
                                  SelectedOption: SelectedMetrics,
                                );

                                if (index == null) {
                                  AddingNewMetrics.add(NewMetrics);
                                } else {
                                  AddingNewMetrics.removeAt(index);
                                  AddingNewMetrics.insert(index, NewMetrics);
                                }

                                MetricsNameTextController.clear();
                                SelectedMetrics = null;

                                Navigator.pop(context);
                              });
                            },
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          CancelButtton(
                            OnTap: () {
                              MetricsNameTextController.clear();
                              SelectedMetrics = null;

                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }
}