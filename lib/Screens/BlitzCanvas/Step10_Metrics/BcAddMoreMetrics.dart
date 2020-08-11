import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step10_Metrics/ContentBcMetrics.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step10_Metrics/BcMetricDialogue.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithTitle.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcFrameworkData.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';

class BcAddMoreMetrics extends StatefulWidget {
  @override
  _BcAddMoreMetricsState createState() => _BcAddMoreMetricsState();
}


class _BcAddMoreMetricsState extends State<BcAddMoreMetrics> {
  final _firestore = Firestore.instance;


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
                          AddingNewMetrics.add(card);
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
                            Text(
                              "Click on '+' to add the Pain Points",
                              style: TextStyle(color: Colors.grey),
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
                        headBackButtton(),
                        SizedBox(
                          width: 50,
                        ),
                        GenericStepButton(
                          buttonName: 'COMPLETE STEP 10',
                          routeName: '/BCHomeView',
                          step: 9,
                          stepBool: true,

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
              )),
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

