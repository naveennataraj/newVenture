import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step8_Synergies/ContentSynergies.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step8_Synergies/BcSynergiesDialogue.dart';
import 'package:iventure001/Widgets/HeadBackMenu.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithTitle.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcFrameworkData.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';

class BcAddSynergies extends StatefulWidget {
  @override
  _BcAddSynergiesState createState() => _BcAddSynergiesState();
}

class _BcAddSynergiesState extends State<BcAddSynergies> {
  final _firestore = Firestore.instance;
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
                      "Can we spot any Synergies between the Business segments?",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  StreamBuilder<QuerySnapshot>(
                    stream: _firestore
                        .collection('$currentUser/Bc8_synergies/addSynergies')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final messages = snapshot.data.documents.reversed;
                        addingNewSynergies = [];
                        for (var message in messages) {
                          final synergyName = message.data['synergyName'];
                          //final synergyValueProposition =
                              //message.data['synergyValueProposition'];
//                          final serviceType = message.data['serviceType'];
//                          final parentCompany = message.data['parentCompany'];
                          final synergyDescription =
                              message.data['synergyDescription'];
                          final synergyValues = message.data['synergyValues'];

                          final ID = message.documentID;

                          final card = ContentSynergies(
                            synergyName: synergyName,
                            //synergyValueProposition: synergyValueProposition,
//                            serviceType: serviceType,
//                            parentCompany: parentCompany,
                            synergyDescription: synergyDescription,
                            synergyValues: synergyValues,
                            ID: ID,
                          );
                          addingNewSynergies.add(card);
                        }
                      }
                      return (addingNewSynergies.length != 0)
                          ? ListView.builder(
                              itemCount: addingNewSynergies.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 10.0),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: addingNewSynergies != null
                                      ? <Widget>[
                                          SmallOrangeCardWithTitle(
                                            title: addingNewSynergies[index]
                                                .synergyName,
                                            description:
                                                addingNewSynergies[index]
                                                    .synergyDescription,
                                            index: index,
                                            removingat: addingNewSynergies,
                                            Dialogue: BcSynergiesDialogue(
                                              index: index,
                                            ),
                                            CollectionName:
                                                '$currentUser/Bc8_synergies/addSynergies',
                                            ID: addingNewSynergies[index].ID,
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

//                  (addingNewSynergies.length == 0)
//                      ? Padding(
//                    padding: const EdgeInsets.all(25.0),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: [
//                        Text(
//                          "Click on '+' to add the Product Goals",
//                          style: TextStyle(color: Colors.grey),
//                        )
//                      ],
//                    ),
//                  )
//                      :
//                  ListView.builder(
//                    itemCount: addingNewSynergies.length,
//                    shrinkWrap: true,
//                    padding: EdgeInsets.only(top: 10.0),
//                    itemBuilder: (context, index) {
//                      return Column(
//                        children: addingNewSynergies != null
//                            ? <Widget>[
//                          SmallOrangeCardWithTitle(
//                            title: addingNewSynergies[index]
//                                .synergyName,
//                            description:
//                            addingNewSynergies[index]
//                                .synergyDescription,
//                            index: index,
//                            removingat: addingNewSynergies,
//                            Dialogue: BcSynergiesDialogue(
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
                          routeName: '/BCHomeView',
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        GenericStepButton(
                          buttonName: 'COMPLETE STEP 8',
                          routeName: '/BCHomeView',
                          step: 7,
                          stepBool: true,
//                          OnTap: () {
//                            bcStepsContent[7].bcCompletionValidator = true;
//                            Navigator.pushNamed(context, '/BCHomeView');
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
              builder: (BuildContext context) => BcSynergiesDialogue(),
            ).then((_) => setState(() {}));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
