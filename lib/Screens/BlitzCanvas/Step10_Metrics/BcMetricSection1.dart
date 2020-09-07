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
import 'package:iventure001/Widgets/BcNorthStarMetric.dart';

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
  Bread(label: "Section 1", route: '/BCStep10MetricSection1'),
];



class BcStep10MetricSection1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BcNorthStarMetric(breads: breads, headBackRoute:'/BCHomeView', goNextRoute: '/BCStep10MetricSection2',
        titleCard:"Metrics (Section 1) - Let's list the single most important metric for your business", dotsCount:3, dotPosition: 0,
    buttonName: 'PROCEED TO METRICS-SECTION2',);
  }
}

//String ID;
//
//class BcStep10MetricSection1 extends StatefulWidget {
//  @override
//  _BcStep10MetricSection1State createState() => _BcStep10MetricSection1State();
//}
//
//List<Bread> breads = [
//  Bread(label: "Home ", route: '/'),
//  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
//  Bread(label: "Section 1", route: '/BCStep10MetricSection1'),
//];
//
//
//class _BcStep10MetricSection1State extends State<BcStep10MetricSection1> {
//  final _firestore = Firestore.instance.collection(currentUser).document('Bc10_metrics');
//  String fireMetricData;
//  bool spinner = false;
//
//  var metricSectionOneLabelColor = Color(0XFF919191);
//  bool validMetricSectionOne = true;
//  var metricSectionOneTextController = TextEditingController();
//  final metricSectionOneFocusNode = new FocusNode();
//  String metricSectionOneText;
//
//  void initState() {
//    super.initState();
//    (fireMetricData == null)? getDocuments() : {} ;
//  }
//
//  void getDocuments() async {
//    final document = await _firestore.get();
//
//    if (document.exists) {
//      try {
//        setState(() {
//          metricSectionOneText = document.data['metricSectionOne'];
//          ID = document.documentID;
//          fireMetricData = document.data['metricSectionOne'];
//          metricSectionOneTextController.text = metricSectionOneText;
//
//          final fields = ContentNorthStarMetric(
//              northStarMetric: metricSectionOneText,
//              ID: ID);
//          collectionNorthStarMetric.insert(0, fields);
//
//        });
//      } catch (e) {
//        print(e);
//      }
//    } else {
//      _firestore.setData(
//          {}
//      );
//    }
//    setState(() {
//      spinner = false;
//    });
//  }
//
//  validator() {
//    setState(() {
//      metricSectionOneTextController.text.isEmpty
//          ? validMetricSectionOne = false
//          : validMetricSectionOne = true;
//      metricSectionOneTextController.text.isEmpty
//          ? metricSectionOneLabelColor = Color(0xFFF53E70)
//          : metricSectionOneLabelColor = Color(0xFF919191);
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Color(0XFFFAFAFA),
//      appBar: PreferredSize(
//        preferredSize: Size.fromHeight(60.0),
//        child: NavigationBar(),
//      ),
//      body: ModalProgressHUD(
//        inAsyncCall: spinner,
//        child: SingleChildScrollView(
//          child: Column(
//            //crossAxisAlignment: CrossAxisAlignment.center,
//            //mainAxisAlignment: MainAxisAlignment.center,
//            children: [
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Wrap(children: [
//                  Breadcrumb(breads: breads, color: Color(0xFFE95420))
//                ],),
//              ),
//              Center(
//                child: Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: [
//                      Container(
//                        //height: MediaQuery.of(context).size.height * .40,
//                        margin: EdgeInsets.only(top: 40.0),
//                        width: 600, //MediaQuery.of(context).size.width * .40,
//                        decoration: BoxDecoration(
//                          color: Colors.white,
//                          //shape: BoxShape.rectangle,
//                          boxShadow: [
//                            BoxShadow(
//                              color: Colors.grey,
//                              offset: Offset(0.0, 1.0), //(x,y)
//                              blurRadius: 2.0,
//                            ),
//                          ],
//                        ),
//                        child: SingleChildScrollView(
//                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//                          child: Column(
//                            children: <Widget>[
//                              Padding(
//                                padding: EdgeInsets.symmetric(vertical: 10.0),
//                                child: Text(
//                                  "Metrics (Section 1) - Let's list the single most important metric for your business",
//                                  style:
//                                  TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                                  textAlign: TextAlign.center,
//                                ),
//                              ),
//                              TextFieldWidget(
//                                labelText: "What is your North star metric?",
//                                maxLines: 2,
//                                validText: validMetricSectionOne,
//                                myFocusNode: metricSectionOneFocusNode,
//                                myTextController: metricSectionOneTextController,
//                                textCollecter: metricSectionOneText,
//                                helperText: '',
//                                labelcolour: metricSectionOneLabelColor,
//                              ),
//
//                              Padding(
//                                padding: const EdgeInsets.all(30.0),
//                                child: Row(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: [
//                                    headBackButtton(
//                                      routeName: '/BCHomeView',
//                                    ),
//                                    SizedBox(
//                                      width: 50,
//                                    ),
//                                    GenericStepButton (
//                                      buttonName: 'PROCEED TO METRICS-SECTION2',
//                                      //routeName: '/BCStep10MetricSection2',
//                                      step: 9,
//                                      stepBool: false,
//                                      widget: () {
//
//                                        (metricSectionOneTextController.text == '')
//                                            ?
//                                        validator()
//                                            :
//                                        (metricSectionOneTextController.text != '') ? Navigator.pushNamed(context, '/BCStep10MetricSection2'): {};
//
//                                        if (fireMetricData == null || fireMetricData == '') {
//                                          _firestore.setData({
//                                            'metricSectionOne': metricSectionOneTextController.text,
//                                          });
//                                        }
//
//                                        if (fireMetricData != metricSectionOneTextController.text ) {
//                                          _firestore.updateData({
//                                            'metricSectionOne': metricSectionOneTextController.text,
//                                          });
//                                        }
//
//                                      }
//
////                          onTap: () {
////
////                            if (fireMetricData == null || fireMetricData == '') {
////                              _firestore.setData({
////                                'metricSectionOne': metricSectionOneTextController.text,
////                              });
////                            }
////
////                            if (fireMetricData != metricSectionOneTextController.text ) {
////                              _firestore.updateData({
////                                'metricSectionOne': metricSectionOneTextController.text,
////                              });
////                            }
////
////                            //bcStepsContent[9].bcCompletionValidator = false;
//////                            print(bcpData[6].CompletionValidator);
//////                            Navigator.pushNamed(
//////                                context, '/BCStep10MetricSection2');
////                          },
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ],
//                          ),),
//                      ),
//                    ],
//                  )
//                ),
//              ),
//              SizedBox(
//                height: 20,
//              ),
//              DotsIndicator(
//                decorator: DotsDecorator(
//                  activeColor: const Color(0xFFE95420),
//                ),
//                dotsCount: 3,
//                position: 0,
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//
//
//}
