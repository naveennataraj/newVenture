import 'dart:async';
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
import 'package:dots_indicator/dots_indicator.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:iventure001/Widgets/ValidationDialogue.dart';
import 'package:iventure001/Widgets/MaximumCardsDialog.dart';

class Step3GoalsTheSolution extends StatefulWidget {
  @override
  _Step3GoalsTheSolutionState createState() => _Step3GoalsTheSolutionState();
}

class _Step3GoalsTheSolutionState extends State<Step3GoalsTheSolution> {
  final _firestore = Firestore.instance;
  bool spinner = false;

  List<Bread> breads = [
    Bread(label: "Home ", route: '/'),
    Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
    Bread(label: "Goals", route: '/BCStep3Goals'),
  ];

  @override
  void initState() {
    if (currentUser != null) {
    } else {
      _AnimatedFlutterLogoState();
    }
    super.initState();
  }

  Timer _timer;

  _AnimatedFlutterLogoState() {
    _timer = new Timer(const Duration(seconds: 1), () {
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
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: SingleChildScrollView(
          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisAlignment: MainAxisAlignment.center,
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
                              "List of the product goals for the solution concept",
                              style:
                              cardTitleTextStyle,
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
                                    Expanded(
                                      child: Text(
                                        "There are no Product goals at the moment. Would you like to add some? Use the '+’ button to get started.",
                                        style: emptyStateTextStyle,
                                        textAlign: TextAlign.center,
                                      ),
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
                                headBackButtton(
                                  routeName: '/BCHomeView',
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                GenericStepButton(
                                  buttonName: 'GO NEXT',
                                  //routeName: '/BCStep3FeatureProduct',
                                  step: 2,
                                  stepBool: false,
                                  widget: () {
                                    var count = productGoals
                                        .length;
                                    (count < 1)
                                        ?
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          ValidationDialogue(contentDescription: 'At the least 1 Product goal needs to be added before proceeding next',),
                                    )
                                        : Navigator.pushNamed(
                                        context, '/BCStep3FeatureProduct');
                                  },
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
                      ),
                    ),
                  ],)
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
                position: 0
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
          onPressed: (productGoals.length < 18)
              ? () {
            showDialog(
              context: context,
              builder: (BuildContext context) => GoalDialogue(),
            ).then((_) => setState(() {}));
          }
          :() {
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
