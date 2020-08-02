import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionFormulation/addProductGoal.dart';
import 'package:iventure001/Data/CardData.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/SolutionFormation/addProductGoalsDialogue.dart';
import 'package:iventure001/Widgets/GoNextButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithoutTitle.dart';

class AddProductGoals extends StatefulWidget {
  @override
  _AddProductGoalsState createState() => _AddProductGoalsState();
}

class _AddProductGoalsState extends State<AddProductGoals> {
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
                      "Let's list out the product goals for the solution concept",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: _firestore.collection('productGoal').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final messsages = snapshot.data.documents.reversed;
                        AddingNewProductGoals = [];
                        for (var message in messsages) {
                          final goal = message.data['goal'];
                          final ID = message.documentID;

                          final card = addProductGoal(goal: goal, ID: ID);
                          AddingNewProductGoals.add(card);
                        }
                      }

                      return (AddingNewProductGoals.length != 0)
                          ? ListView.builder(
                              itemCount: AddingNewProductGoals.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 10.0),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: AddingNewProductGoals != null
                                      ? <Widget>[
                                          SmallOrangeCardWithoutTitle(
                                            description:
                                                AddingNewProductGoals[index]
                                                    .goal,
                                            index: index,
                                            removingat: AddingNewProductGoals,
                                            Dialogue: addProductGoalsDialogue(
                                              index: index,
                                            ),
                                            CollectionName: 'productGoal',
                                            ID: AddingNewProductGoals[index].ID,
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
                                    "Click on '+' to add the Product Goals",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            );
                    },
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
                            bcpData[3].CompletionValidator = false;
                            print(bcpData[3].CompletionValidator);
                            Navigator.pushNamed(context, '/addproductfeatures');
                          },
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
              builder: (BuildContext context) => addProductGoalsDialogue(),
            ).then((_) => setState(() {}));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
