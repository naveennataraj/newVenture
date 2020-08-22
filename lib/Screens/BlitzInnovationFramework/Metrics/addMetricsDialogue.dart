import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/DropDown.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
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
  String SelectedMetric;

  _addMetricsDialogueState(this.index);
  @override
  void initState() {
    super.initState();

    Metricsdropdown = buildDropDownMenuItems(MetricsList);
    if (index != null) {
      MetricsNameTextController =
          TextEditingController(text: AddingNewMetrics[index].Description);
      setState(() {
//        SelectedMetrics = DropDownItem(
//            widget.SelectedMetricsValue, widget.SelectedMetricsName);

        SelectedMetric = AddingNewMetrics[widget.index].Name;
        print('the wierd item selected $SelectedMetric');
      });
    } else {
      MetricsNameTextController.clear();
      SelectedMetrics = null;
    }
  }

  var metricDroplabelColor = Colors.grey.shade600;

  var metricDropBorderColor = Color(0xFFABABAB);

  var metricDropValuerColor = Color(0xFFE95420);

  validator() {
    setState(() {
      MetricsNameTextController.text.isEmpty
          ? validSMetricsName = false
          : validSMetricsName = true;
      MetricsNameTextController.text.isEmpty
          ? MetricsNamelabelColor = Color(0xFFF53E70)
          : MetricsNamelabelColor = Color(0xFF919191);
      (SelectedMetric == null)
          ? metricDropBorderColor = Color(0xFFF53E70)
          : metricDropBorderColor = Color(0xFFABABAB);
      (SelectedMetric == null)
          ? metricDropValuerColor = Color(0xFFF53E70)
          : metricDropValuerColor = Color(0xFFE95420);
    });
  }

  final _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)), //this right here
        child: Container(
          height: 400,
          width: 800,
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
                      labelText: "Enter a name Briefly describing the metric",
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
                          border: Border.all(
                              width: 1, color: metricDropBorderColor),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(
                              'What category does the metric fall under?',
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
                                    color: metricDropValuerColor,
                                  ),
                                ),
                                onChanged: (newValue) {
                                  setState(() {
                                    SelectedMetric = newValue;
                                  });
                                },
                                items:
                                    MetricDropdownList.map((String singleItem) {
                                  return DropdownMenuItem<String>(
                                      value: singleItem,
                                      child: Text(singleItem));
                                }).toList(),
                                value: SelectedMetric,
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
                            onTap: (MetricsNameTextController.text == '' ||
                                    SelectedMetric == null)
                                ? () {
                                    validator();
                                  }
                                : () {
                                    (MetricsNameTextController.text != '' &&
                                            SelectedMetric != null)
                                        ? Navigator.pop(context)
                                        : {};

                                    setState(() {
//                                final NewMetrics = addMetrics(
//                                  Name: SelectedMetrics.name,
//                                  Description: MetricsNameTextController.text,
//                                  SelectedOption: SelectedMetrics,
//                                );

                                      if (index == null) {
//                                  AddingNewMetrics.add(NewMetrics);
                                        _firestore
                                            .collection(
                                                '$currentUser/Metrics/metrics')
                                            .add({
                                          'Name': SelectedMetric,
                                          'Description':
                                              MetricsNameTextController.text,
                                          'Sender': "tester@gmail.com",
                                        });
                                      } else {
//                                  AddingNewMetrics.removeAt(index);
//                                  AddingNewMetrics.insert(index, NewMetrics);
                                        _firestore
                                            .collection(
                                                '$currentUser/Metrics/metrics')
                                            .document(
                                                AddingNewMetrics[index].ID)
                                            .updateData({
                                          'Name': SelectedMetric,
                                          'Description':
                                              MetricsNameTextController.text,
                                          'Sender': "tester@gmail.com",
                                        });
                                      }
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
