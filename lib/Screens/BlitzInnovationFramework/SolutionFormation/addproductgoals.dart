import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionFormulation/addProductGoal.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/SolutionFormation/addProductGoalsDialogue.dart';
import 'package:iventure001/Widgets/GenericStepValidationButtonBIF.dart';
import 'package:iventure001/Widgets/HeadBackMenu.dart';
import 'package:iventure001/Widgets/MaximumCardsDialog.dart';
import 'package:iventure001/Widgets/MinimumCardsDialog.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithoutTitle.dart';

class AddProductGoals extends StatefulWidget {
  @override
  _AddProductGoalsState createState() => _AddProductGoalsState();
}

class _AddProductGoalsState extends State<AddProductGoals> {
  List<Bread> breads = [
    Bread(label: "Home ", route: '/'),
    Bread(
        label: "Blitz Innovation Framework ",
        route: '/BlitzInnovationFramework'),
    Bread(label: "Add Product Goals ", route: '/addproductgoals'),
  ];

  final _firestore = Firestore.instance;

  @override
  void initState() {
//    spinner = true;

    if (currentUser != null) {
    } else {
      _AnimatedFlutterLogoState();
    }

    super.initState();
  }

  Timer _timer;

  _AnimatedFlutterLogoState() {
    _timer = new Timer(const Duration(seconds: 2), () {
      setState(() {
        if (currentUser != null && currentUser != '') {}
      });
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Breadcrumb(breads: breads, color: Color(0xFFE95420)),
            ),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        //height: MediaQuery.of(context).size.height * .40,
                        margin: EdgeInsets.only(top: 40.0),
                        width: 600,
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
                                "Let's list out the product goals for the solution concept",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            StreamBuilder<QuerySnapshot>(
                              stream: _firestore
                                  .collection(
                                      '$currentUser/SolutionFormulation/productGoal')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final messsages =
                                      snapshot.data.documents.reversed;
                                  AddingNewProductGoals = [];
                                  for (var message in messsages) {
                                    final goal = message.data['goal'];
                                    final ID = message.documentID;

                                    final card =
                                        addProductGoal(goal: goal, ID: ID);
                                    AddingNewProductGoals.add(card);
                                  }
                                }

                                return (AddingNewProductGoals.length != 0)
                                    ? ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: AddingNewProductGoals.length,
                                        shrinkWrap: true,
                                        padding: EdgeInsets.only(top: 10.0),
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children:
                                                AddingNewProductGoals != null
                                                    ? <Widget>[
                                                        SmallOrangeCardWithoutTitle(
                                                          description:
                                                              AddingNewProductGoals[
                                                                      index]
                                                                  .goal,
                                                          index: index,
                                                          removingat:
                                                              AddingNewProductGoals,
                                                          Dialogue:
                                                              addProductGoalsDialogue(
                                                            index: index,
                                                          ),
                                                          CollectionName:
                                                              '$currentUser/SolutionFormulation/productGoal',
                                                          ID: AddingNewProductGoals[
                                                                  index]
                                                              .ID,
                                                        )
                                                      ]
                                                    : null,
                                          );
                                        },
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(25.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "There are no Product Goals at the moment. Would you like to add some? Use the '+’ button to get started.",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                                textAlign: TextAlign.center,
                                              ),
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
                                  headBackButtton(
                                    routeName: '/BlitzInnovationFramework',
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  GenericStepButtonBIF(
                                    buttonName: 'GO NEXT',
                                    step: 3,
                                    stepBool: false,
                                    widget: () {
                                      if (AddingNewProductGoals.length == 0) {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              MinimumCardsDialog(
                                            minimumcards: 1,
                                          ),
                                        ).then((_) => setState(() {}));
                                      } else if (AddingNewProductGoals.length !=
                                          0) {
                                        Navigator.popAndPushNamed(
                                            context, '/addproductfeatures');
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DotsIndicator(
                        decorator: DotsDecorator(
                          activeColor: const Color(0xFFE95420),
                        ),
                        dotsCount: 4,
                        position: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.all(100),
        child: FloatingActionButton(
          tooltip: "Add's New Card",
          backgroundColor: Color(0XFFE95420),
          onPressed: (AddingNewProductGoals.length < 18)
              ? () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        addProductGoalsDialogue(),
                  ).then((_) => setState(() {}));
                }
              : () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => MaximumCardsDialog(),
                  ).then((_) => setState(() {}));
                },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
