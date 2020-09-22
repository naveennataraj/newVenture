import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step6_StudyingTheCompetition/ContentCompetingProduct.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step6_StudyingTheCompetition/DialogueCompetingProduct.dart';
import 'package:iventure001/Widgets/HeadBackMenu.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithTitle.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:iventure001/Widgets/ValidationDialogue.dart';

class BcStep6CompetingProducts extends StatefulWidget {
  final bool fromDashboard;
  const BcStep6CompetingProducts({this.fromDashboard});
  @override
  _BcStep6CompetingProductsState createState() =>
      _BcStep6CompetingProductsState(fromDashboard);
}

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
  Bread(label: "Competing Players", route: '/BCStep6CompetingProduct'),
];

class _BcStep6CompetingProductsState extends State<BcStep6CompetingProducts> {
  bool fromDashboard;
  _BcStep6CompetingProductsState(this.fromDashboard);
  final _firestore = Firestore.instance;
  bool spinner = false;

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
    _timer = new Timer(const Duration(seconds: 1), () {
      setState(() {
        if (currentUser != null && currentUser != '') {
        }
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
                                "List of current competing players in the market",
                                style:
                                cardTitleTextStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            NoteCard(
                              Note:
                              "Tip: This section contains a list of solutions available in the market, which can cater to the customer's pain points.",
                            ),
                            StreamBuilder<QuerySnapshot>(
                              stream: _firestore
                                  .collection('$currentUser/Bc6_studyingTheCompetition/addPlayers')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final messages = snapshot.data.documents.reversed;
                                  AddingNewCompetingProduct = [];
                                  for (var message in messages) {
                                    final ProductName = message.data['ProductName'];
                                    final OrgName = message.data['OrgName'];
                                    final Features = message.data['Features'];
                                    final CurrentOffering =
                                    message.data['CurrentOffering'];
                                    final ID = message.documentID;

                                    final card = BcCompetingProduct(
                                      ProductName: ProductName,
                                      OrgName: OrgName,
                                      Features: Features,
                                      CurrentOffering: CurrentOffering,
                                      ID: ID,
                                    );
                                    AddingNewCompetingProduct.add(card);
                                  }
                                }

                                return (AddingNewCompetingProduct.length != 0)
                                    ? ListView.builder(
                                  itemCount: AddingNewCompetingProduct.length,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(top: 10.0),
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: AddingNewCompetingProduct != null
                                          ? <Widget>[
                                        SmallOrangeCardWithTitle(
                                          title:
                                          AddingNewCompetingProduct[index]
                                              .ProductName,
                                          description:
                                          AddingNewCompetingProduct[index]
                                              .Features,
                                          index: index,
                                          removingat:
                                          AddingNewCompetingProduct,
                                          Dialogue:
                                          BcCompetingProductDialogue(
                                            index: index,
                                          ),
                                          CollectionName:
                                          '$currentUser/Bc6_studyingTheCompetition/addPlayers',
                                          ID: AddingNewCompetingProduct[index]
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                            "There are no competing players at the moment.\n Would you like to add some? Use the '+’ button to get started.",
                                            style: emptyStateTextStyle, textAlign: TextAlign.center
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
//                  (AddingNewCompetingProduct.length == 0)
//                      ? Padding(
//                          padding: const EdgeInsets.all(25.0),
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: [
//                              Text(
//                                "Click on '+' to add the Competing Products",
//                                style: TextStyle(color: Colors.grey),
//                              )
//                            ],
//                          ),
//                        )
//                      : ListView.builder(
//                          itemCount: AddingNewCompetingProduct.length,
//                          shrinkWrap: true,
//                          padding: EdgeInsets.only(top: 10.0),
//                          itemBuilder: (context, index) {
//                            return Column(
//                              children: AddingNewCompetingProduct != null
//                                  ? <Widget>[
//                                      SmallOrangeCardWithTitle(
//                                        title: AddingNewCompetingProduct[index]
//                                            .ProductName,
//                                        description:
//                                            AddingNewCompetingProduct[index]
//                                                .Features,
//                                        index: index,
//                                        removingat: AddingNewCompetingProduct,
//                                        Dialogue: BcCompetingProductDialogue(
//                                          index: index,
//                                        ),
//                                      )
//                                    ]
//                                  : null,
//                            );
//                          },
//                        ),
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  headBackButtton(
                                    routeName: (fromDashboard != true) ? '/BCHomeView': '/BusinessModelDashboard',
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  GenericStepButton(
                                    buttonName: 'COMPLETE STEP',
                                    //routeName: '/BCHomeView',
                                    step: 5,
                                    stepBool: true,
                                    widget: () {
                                      var count = AddingNewCompetingProduct
                                          .length;
                                      (count < 1)
                                          ? showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            ValidationDialogue(contentDescription: 'At the least 1 Competing player needs to be added before proceeding next.',),
                                      )
                                          : Navigator.pushNamed(
                                          context, '/BCHomeView');
                                    },
//                          OnTap: () {
//                            bcStepsContent[5].bcCompletionValidator = true;
//                            Navigator.pushNamed(context, '/BCHomeView');
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
                dotsCount: 1,
                position: 0,
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
              builder: (BuildContext context) => BcCompetingProductDialogue(),
            ).then((_) => setState(() {}));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
