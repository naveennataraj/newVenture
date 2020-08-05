import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionFormulation/addCompetingProduct.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionFormulation/addProductFeature.dart';
import 'package:iventure001/Data/CardData.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/SolutionFormation/addCompetingProductsDialogue.dart';
import 'package:iventure001/Widgets/GoNextButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithTitle.dart';

class AddCompetingProducts extends StatefulWidget {
  @override
  _AddCompetingProductsState createState() => _AddCompetingProductsState();
}

class _AddCompetingProductsState extends State<AddCompetingProducts> {
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
                      "Let's list out the competing products currently in the market",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  NoteCard(
                    Note:
                        "Tip: This section is a list of products in the market which currently cater to the customer's pain points",
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: _firestore
                        .collection(
                            '$currentUser/SolutionFormulation/competingProducts')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final messsages = snapshot.data.documents.reversed;
                        AddingNewCompetingProduct = [];
                        for (var message in messsages) {
                          final ProductName = message.data['ProductName'];
                          final OrgName = message.data['OrgName'];
                          final Features = message.data['Features'];
                          final CurrentOffering =
                              message.data['CurrentOffering'];
                          final ID = message.documentID;

                          final card = addCompetingProduct(
                              CurrentOffering: CurrentOffering,
                              Features: Features,
                              OrgName: OrgName,
                              ProductName: ProductName,
                              ID: ID);
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
                                            removingat: AddingNewProductFeature,
                                            Dialogue:
                                                addCompetingProductsDialogue(
                                              index: index,
                                            ),
                                            CollectionName:
                                                '$currentUser/SolutionFormulation/competingProducts',
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
                                    "Click on '+' to add the Competing Products",
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
//                          routeName: '/addwireframelink',
                          OnTap: () {
                            bcpData[3].CompletionValidator = false;
                            print(bcpData[3].CompletionValidator);
                            Navigator.pushNamed(context, '/addwireframelink');
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
              builder: (BuildContext context) => addCompetingProductsDialogue(),
            ).then((_) => setState(() {}));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
