import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step10_Metrics/ContentBcMetrics.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step10_Metrics/BcMetricDialogue.dart';
import 'package:iventure001/Widgets/HeadBackMenu.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithTitle.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:dots_indicator/dots_indicator.dart';

class BcAddMoreMetrics extends StatefulWidget {
  @override
  _BcAddMoreMetricsState createState() => _BcAddMoreMetricsState();
}

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
  Bread(label: "Section 1", route: '/BCStep10MetricSection1'),
  Bread(label: "Section 2", route: '/BCStep10MetricSection2'),
  Bread(label: "More Metrics", route: '/BCStep10AddMoreMetrics'),
];


class _BcAddMoreMetricsState extends State<BcAddMoreMetrics> {
  final _firestore = Firestore.instance;
  bool spinner = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      AddingNewMetrics;
      print(AddingNewMetrics);
    });
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Congratulations!", style: TextStyle(fontWeight: FontWeight.bold),),
          content: new Text("You have created a business model using the Blitz Canvas!\n \nWould you like to view the dashboard for the business model?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("HEAD BACK", style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold),),
              onPressed: () {
//                setState(() {
//                  erased = true;
//                  widget.removingat.removeAt(widget.index);
//                });
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: new Text("PROCEED TO DASHBOARD", style: TextStyle( color: Color(0XFFE95420,), fontWeight: FontWeight.bold),),
              onPressed: () {
                Navigator.pushNamed(
                    context, '/BCHomeView');
              },
            ),
          ],
        );
      },
    );
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Breadcrumb(breads: breads, color: Color(0xFFE95420)),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
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
                                "Add more metrics",
                                style:
                                TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            NoteCard(
                              Note:
                              'Please note: Metrics which have already been added are listed below. To add more\nmetrics, please use the add button at the button of the page.\nTip: Metrics help measure and keep track of what is important in the solution concept and business model.\nThe framework for capture of metrics used by this application is based on the MESOPS Framework. To study this further, please refer to this link.',
                            ),

                            StreamBuilder<QuerySnapshot>(
                              stream: _firestore
                                  .collection('$currentUser/Bc10_metrics/addMoreMetrics')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final messages = snapshot.data.documents.reversed;
                                  AddingNewMetrics = [];
                                  for (var message in messages) {
                                    final Name = message.data['Name'];
                                    final Description =
                                    message.data['Description'];
                                    final ID = message.documentID;

                                    final card = ContentBcMetrics(
                                      Name: Name,
                                      Description: Description,
                                      ID: ID,
                                    );
                                    if(Description != '') {AddingNewMetrics.add(card);}
                                  }
                                }
                                return (AddingNewMetrics.length != 0)
                                    ? ListView.builder(
                                  itemCount: AddingNewMetrics.length,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(top: 10.0),
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: AddingNewMetrics != null
                                          ? <Widget>[
                                        SmallOrangeCardWithTitle(
                                          title: AddingNewMetrics[index]
                                              .Name,
                                          description:
                                          AddingNewMetrics[index]
                                              .Description,
                                          index: index,
                                          removingat: AddingNewMetrics,
                                          Dialogue: BcMetricDialogue(
                                            index: index,
                                          ),
                                          CollectionName:
                                          '$currentUser/Bc10_metrics/addMoreMetrics',
                                          ID: AddingNewMetrics[index].ID,
                                        )
                                      ]
                                          : null,
                                    );
                                  },
                                )
                                    : Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Click on '+' to add the Pain Points",
                                          style: TextStyle(color: Colors.grey),
                                            textAlign: TextAlign.center
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),


//                  (AddingNewMetrics.length == 0)
//                      ? Padding(
//                    padding: const EdgeInsets.all(25.0),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: [
//                        Text(
//                          "Click on '+' to add the solution concept",
//                          style: TextStyle(color: Colors.grey),
//                        )
//                      ],
//                    ),
//                  )
//                      : ListView.builder(
//                    itemCount: AddingNewMetrics.length,
//                    shrinkWrap: true,
//                    padding: EdgeInsets.only(top: 10.0),
//                    itemBuilder: (context, index) {
//                      return Column(
//                        children: AddingNewMetrics != null
//                            ? <Widget>[
//                          SmallOrangeCardWithTitle(
//                            title: AddingNewMetrics[index].Name,
//                            description:
//                            AddingNewMetrics[index].Description,
//                            index: index,
//                            removingat: AddingNewMetrics,
//                            Dialogue: BcMetricDialogue(
//                              index: index,
//                            ),
//                          )
//                        ]
//                            : null,
//                      );
//                    },
//                  ),
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  headBackButtton(
                                    routeName: '/BCStep10MetricSection2',
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  GenericStepButton(
                                    buttonName: 'COMPLETE STEP',
                                    //routeName: '/BCHomeView',
                                    step: 9,
                                    stepBool: true,
                                    widget:_showDialog ,

//                          OnTap: () {
//                            _showDialog();
//                            bcStepsContent[9].bcCompletionValidator = true;
////                            Navigator.pushNamed(
////                                context, '/BCHomeView');
//                          },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                dotsCount: 3,
                position: 2,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.all(100),
        child: FloatingActionButton(
          tooltip: "Add's New Card",
          backgroundColor: Color(0XFFE95420),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => BcMetricDialogue(),
            ).then((_) => setState(() {}));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

