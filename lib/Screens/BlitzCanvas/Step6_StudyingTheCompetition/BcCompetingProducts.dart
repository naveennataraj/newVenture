import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step6_StudyingTheCompetition/ContentCompetingProduct.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step6_StudyingTheCompetition/DialogueCompetingProduct.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithTitle.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcFrameworkData.dart';
import 'package:iventure001/Widgets/CompleteStepButton.dart';

class BcStep6CompetingProducts extends StatefulWidget {
  @override
  _BcStep6CompetingProductsState createState() =>
      _BcStep6CompetingProductsState();
}

const userUid = "tester@gmail.com";

class _BcStep6CompetingProductsState extends State<BcStep6CompetingProducts> {
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
                      "List of current competing players in the market",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  NoteCard(
                    Note:
                        "Tip: This section contains a list of solutions available in the market, which can cater to the customer's pain points.",
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: _firestore
                        .collection(
                            userUid + '/Bc6_studyingTheCompetition/addPlayers')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final messages = snapshot.data.documents.reversed;
                        print('these are the messages $messages');
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
                                            CollectionName: userUid +
                                                '/Bc6_studyingTheCompetition/addPlayers',
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
                                  Text(
                                    "Click on '+' to add the Pain Points",
                                    style: TextStyle(color: Colors.grey),
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
                        headBackButtton(),
                        SizedBox(
                          width: 50,
                        ),
                        CompleteStepButton(
                          OnTap: () {
                            bcStepsContent[5].bcCompletionValidator = true;
                            Navigator.pushNamed(context, '/BCHomeView');
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
              builder: (BuildContext context) => BcCompetingProductDialogue(),
            ).then((_) => setState(() {}));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
