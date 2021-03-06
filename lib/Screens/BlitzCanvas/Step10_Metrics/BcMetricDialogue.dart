import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Constants/DropDown.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step10_Metrics/ContentBcMetrics.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step10_Metrics/BcAddMoreMetrics.dart';
import 'package:iventure001/Widgets/AddGenericButton.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:iventure001/Constants/ResposiveLayout.dart';

class BcMetricDialogue extends StatefulWidget {
  final int index;
  const BcMetricDialogue({this.index});
  @override
  _BcMetricDialogueState createState() => _BcMetricDialogueState(index);
}

var MetricsNamelabelColor = Color(0XFF919191);
bool validSMetricsName = true;
var MetricsNameTextController = TextEditingController();
final MetricsNameFocusNode = new FocusNode();
String MetricsName;

class _BcMetricDialogueState extends State<BcMetricDialogue> {
  int index;
  String selectedMetric;
  final _firestore = Firestore.instance;
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

        selectedMetric = AddingNewMetrics[widget.index].Name;
        //print('the wierd item selected $SelectedMetric');
      });
    } else {
      MetricsNameTextController.clear();
      selectedMetric = null;
    }
  }

  var dropBorderColor = Color(0xFFABABAB);
  var dropValuerColor = Color(0xFFE95420);

  validator() {
    setState(() {
      MetricsNameTextController.text.isEmpty
          ? validSMetricsName = false
          : validSMetricsName = true;
      MetricsNameTextController.text.isEmpty
          ? MetricsNamelabelColor = Color(0xFFF53E70)
          : MetricsNamelabelColor = Color(0xFF919191);
      (selectedMetric == null)
          ? dropBorderColor = Color(0xFFF53E70)
          : dropBorderColor = Color(0xFFABABAB);
      (selectedMetric == null)
          ? dropValuerColor = Color(0xFFF53E70)
          : dropValuerColor = Color(0xFFE95420);
    });
  }

  _BcMetricDialogueState(this.index);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)), //this right here
      child: Container(
        //height: 400, // MediaQuery.of(context).size.height * 0.50,
        width: 800, //MediaQuery.of(context).size.width * 0.5,
        child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "Add a metric:",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                TextFieldWidget(
                  labelText: "Enter a name briefly describing the metric",
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
                      border: Border.all(width: 1, color: dropBorderColor),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: (!ResponsiveLayout.isSmallScreen(context)
                        ? Row(
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
                                      color: dropValuerColor,
                                    ),
                                  ),
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedMetric = newValue;
                                    });
                                  },
                                  items: MetricList.map((String singleItem) {
                                    return DropdownMenuItem<String>(
                                        value: singleItem,
                                        child: Text(singleItem));
                                  }).toList(),
                                  value: selectedMetric,
                                ),
                              ),
                            ],
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                'What category does the metric fall under?                               ',
                                style: TextStyle(
                                    color: Colors.grey.shade600, fontSize: 12),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: DropdownButton(
                                  hint: Text(
                                    'Choose',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: dropValuerColor,
                                    ),
                                  ),
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedMetric = newValue;
                                    });
                                  },
                                  items: MetricList.map((String singleItem) {
                                    return DropdownMenuItem<String>(
                                        value: singleItem,
                                        child: Text(singleItem));
                                  }).toList(),
                                  value: selectedMetric,
                                ),
                              ),
                            ],
                          )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AddGenericButton(
                        buttonName: 'Add metric',
                        onTap: () {
                          if (MetricsNameTextController.text != '' &&
                              selectedMetric != null) {
                            setState(() {
//                                final NewMetrics = ContentBcMetrics(
//                                  Name: SelectedMetrics.name,
//                                  Description: MetricsNameTextController.text,
//
//                                );

                              if (index == null) {
                                //AddingNewMetrics.add(NewMetrics);
                                _firestore
                                    .collection(
                                    '$currentUser/Bc10_metrics/addMoreMetrics')
                                    .add({
                                  'Name': selectedMetric,
                                  'Description': MetricsNameTextController.text,
                                  'Sender': currentUser,
                                });
                              } else {
//                                  AddingNewMetrics.removeAt(index);
//                                  AddingNewMetrics.insert(index, NewMetrics);
                                _firestore
                                    .collection(
                                    '$currentUser/Bc10_metrics/addMoreMetrics')
                                    .document(AddingNewMetrics[index].ID)
                                    .updateData({
                                  'Name': selectedMetric,
                                  'Description': MetricsNameTextController.text,
                                  'Sender': currentUser,
                                });
                              }

                              Navigator.pop(context);
//                                Navigator.push(context, new MaterialPageRoute(builder: (context) => BcAddMoreMetrics()),
//                                )
//                                    .then((value) => setState(() {}),);
                            });
                          } else {
                            validator();
                          }


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
    );
  }
}
