import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Stu3_DefiningTheSolution/ContentBcProductGoals.dart';
import 'package:iventure001/Screens/BlitzCanvas/Stu3_DefiningTheSolution/GoalDialogue.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:iventure001/Widgets/HeadBackMenu.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithoutTitle.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcFrameworkData.dart';

class Step3GoalsTheSolution extends StatefulWidget {
  @override
  _Step3GoalsTheSolutionState createState() => _Step3GoalsTheSolutionState();
}


class _Step3GoalsTheSolutionState extends State<Step3GoalsTheSolution> {
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
                      "List of the product goals for the solution concept",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  StreamBuilder<QuerySnapshot>(
                    stream: _firestore
                        .collection(
                            '$currentUser/Bc3_definingTheSolution/addGoals')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final messages = snapshot.data.documents.reversed;
                        print('these are the messages $messages');
                        productGoals = [];
                        for (var message in messages) {
                          final goal = message.data['goal'];
                          final ID = message.documentID;

                          final card = BcContentProductGoals(
                            goals: goal,
                            ID: ID,
                          );
                          productGoals.add(card);
                        }
                      }

                      return (productGoals.length != 0)
                          ? ListView.builder(
                              itemCount: productGoals.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 10.0),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: productGoals != null
                                      ? <Widget>[
                                          SmallOrangeCardWithoutTitle(
                                            description:
                                                productGoals[index].goals,
                                            index: index,
                                            removingat: productGoals,
                                            Dialogue: GoalDialogue(
                                              index: index,
                                            ),
                                            CollectionName:
                                                '$currentUser/Bc3_definingTheSolution/addGoals',
                                            ID: productGoals[index].ID,
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

//                  (productGoals.length == 0)
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
//                    itemCount: productGoals.length,
//                    shrinkWrap: true,
//                    padding: EdgeInsets.only(top: 10.0),
//                    itemBuilder: (context, index) {
//                      return Column(
//                        children: productGoals != null
//                            ? <Widget>[
//                          SmallOrangeCardWithoutTitle(
//                            description: productGoals[index].goals,
//                            index: index,
//                            removingat: productGoals,
//                            Dialogue: GoalDialogue(
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
                          buttonName: 'GO NEXT',
                          routeName: '/BCStep3FeatureProduct',
                          step: 2,
                          stepBool: false,
//                          OnTap: () {
//                            bcStepsContent[2].bcCompletionValidator = false;
//                            Navigator.pushNamed(
//                                context, '/BCStep3FeatureProduct');
//                          },
                          //routeName: '/BCStep3FeatureProduct',
                          // write here
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
              builder: (BuildContext context) => GoalDialogue(),
            ).then((_) => setState(() {}));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
