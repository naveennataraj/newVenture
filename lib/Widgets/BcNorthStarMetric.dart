import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:iventure001/Widgets/HeadBackMenu.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step10_Metrics/ContentNorthStarMetric.dart';

class BcNorthStarMetric extends StatefulWidget {
  final List breads;
  final String headBackRoute;
  final String goNextRoute;
  final String titleCard;
  final int dotsCount;
  final double dotPosition;
  final String buttonName;
  BcNorthStarMetric({this.breads, this.headBackRoute, this.goNextRoute, this.titleCard, this.dotsCount, this.dotPosition, this.buttonName});
  @override
  _BcNorthStarMetricState createState() => _BcNorthStarMetricState(breads, headBackRoute, goNextRoute, titleCard, dotsCount, dotPosition, buttonName);
}

class _BcNorthStarMetricState extends State<BcNorthStarMetric> {
  String ID;
  List breads;
  String headBackRoute;
  String goNextRoute;
  String titleCard;
  int dotsCount;
  double dotPosition;
  String buttonName;

  _BcNorthStarMetricState(this.breads, this.headBackRoute, this.goNextRoute, this.titleCard, this.dotsCount, this.dotPosition, this.buttonName);

  final _firestore = Firestore.instance.collection(currentUser).document('Bc10_metrics');
  String fireMetricData;
  bool spinner = false;

  var metricSectionOneLabelColor = Color(0XFF919191);
  bool validMetricSectionOne = true;
  var metricSectionOneTextController = TextEditingController();
  final metricSectionOneFocusNode = new FocusNode();
  String metricSectionOneText;

  void initState() {
    super.initState();
    (fireMetricData == null)? getDocuments() : {} ;
  }

  void getDocuments() async {
    final document = await _firestore.get();

    if (document.exists) {
      try {
        setState(() {
          metricSectionOneText = document.data['metricSectionOne'];
          ID = document.documentID;
          fireMetricData = document.data['metricSectionOne'];
          metricSectionOneTextController.text = metricSectionOneText;

          final fields = ContentNorthStarMetric(
              northStarMetric: metricSectionOneText,
              ID: ID);
          collectionNorthStarMetric.insert(0, fields);

        });
      } catch (e) {
        print(e);
      }
    } else {
      _firestore.setData(
          {}
      );
    }
    setState(() {
      spinner = false;
    });
  }

  validator() {
    setState(() {
      metricSectionOneTextController.text.isEmpty
          ? validMetricSectionOne = false
          : validMetricSectionOne = true;
      metricSectionOneTextController.text.isEmpty
          ? metricSectionOneLabelColor = Color(0xFFF53E70)
          : metricSectionOneLabelColor = Color(0xFF919191);
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
            //crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(children: [
                  Breadcrumb(breads: breads, color: Color(0xFFE95420))
                ],),
              ),
              Center(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
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
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  child: Text(
                                    titleCard,
                                    style:
                                    TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                TextFieldWidget(
                                  labelText: "What is your North star metric?",
                                  maxLines: 2,
                                  validText: validMetricSectionOne,
                                  myFocusNode: metricSectionOneFocusNode,
                                  myTextController: metricSectionOneTextController,
                                  textCollecter: metricSectionOneText,
                                  helperText: '',
                                  labelcolour: metricSectionOneLabelColor,
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      headBackButtton(
                                        routeName: headBackRoute,
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      GenericStepButton (
                                          buttonName: buttonName,
                                          //routeName: '/BCStep10MetricSection2',
                                          step: 9,
                                          stepBool: false,
                                          widget: () {

                                            (metricSectionOneTextController.text == '')
                                                ?
                                            validator()
                                                :
                                            (metricSectionOneTextController.text != '') ? Navigator.pushNamed(context, goNextRoute): {};

                                            if (fireMetricData == null || fireMetricData == '') {
                                              _firestore.setData({
                                                'metricSectionOne': metricSectionOneTextController.text,
                                              });
                                            }

                                            if (fireMetricData != metricSectionOneTextController.text ) {
                                              _firestore.updateData({
                                                'metricSectionOne': metricSectionOneTextController.text,
                                              });
                                            }

                                          }

//                          onTap: () {
//
//                            if (fireMetricData == null || fireMetricData == '') {
//                              _firestore.setData({
//                                'metricSectionOne': metricSectionOneTextController.text,
//                              });
//                            }
//
//                            if (fireMetricData != metricSectionOneTextController.text ) {
//                              _firestore.updateData({
//                                'metricSectionOne': metricSectionOneTextController.text,
//                              });
//                            }
//
//                            //bcStepsContent[9].bcCompletionValidator = false;
////                            print(bcpData[6].CompletionValidator);
////                            Navigator.pushNamed(
////                                context, '/BCStep10MetricSection2');
//                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),),
                        ),
                      ],
                    )
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DotsIndicator(
                decorator: DotsDecorator(
                  activeColor: const Color(0xFFE95420),
                ),
                dotsCount: dotsCount,
                position: dotPosition,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
