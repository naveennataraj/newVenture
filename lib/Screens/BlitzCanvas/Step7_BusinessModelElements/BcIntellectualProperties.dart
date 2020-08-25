import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step7_BusinessModelElements/ContentBcIntellectualAssets.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step7_BusinessModelElements/BcIntellectualDialogue.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithTitle.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:dots_indicator/dots_indicator.dart';

class BcIntellectualPropertyAssets extends StatefulWidget {
  @override
  _BcIntellectualPropertyAssetsState createState() =>
      _BcIntellectualPropertyAssetsState();
}

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
  Bread(label: "Business Model Elements ", route: '/BCStep7BusinessModelElements'),
  Bread(label: "Add Foundational Aspects", route: '/BCStep7IntellectualAssets'),
];

class _BcIntellectualPropertyAssetsState
    extends State<BcIntellectualPropertyAssets> {
  final _firestore = Firestore.instance;
  bool spinner = false;
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Breadcrumb(breads: breads, color: Color(0xFFE95420),),
                  Container(
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
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            "Let's add some Intellectual property assets:",
                            style:
                            cardTitleTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),

                        StreamBuilder<QuerySnapshot>(
                          stream: _firestore
                              .collection(
                              '$currentUser/Bc7_businessModelElements/addIntellectualProperties')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final messages = snapshot.data.documents.reversed;
                              addingIntellectualAssets = [];
                              for (var message in messages) {
                                final intellectualProperty =
                                message.data['intellectualProperty'];
                                final intellectualCode =
                                message.data['intellectualCode'];
                                final intellectualDetails =
                                message.data['intellectualDetails'];
                                final ID = message.documentID;

                                final card = ContentBcIntellectualAssets(
                                  intellectualProperty: intellectualProperty,
                                  intellectualCode: intellectualCode,
                                  intellectualDetails: intellectualDetails,
                                  ID: ID,
                                );
                                addingIntellectualAssets.add(card);
                              }
                            }

                            return (addingIntellectualAssets.length != 0)
                                ? ListView.builder(
                              itemCount: addingIntellectualAssets.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 10.0),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: addingIntellectualAssets != null
                                      ? <Widget>[
                                    SmallOrangeCardWithTitle(
                                      title:
                                      addingIntellectualAssets[index]
                                          .intellectualProperty,
                                      description:
                                      addingIntellectualAssets[index]
                                          .intellectualCode,
                                      index: index,
                                      removingat:
                                      addingIntellectualAssets,
                                      Dialogue: BcIntellectualDialogue(
                                        index: index,
                                      ),
                                      CollectionName:
                                      '$currentUser/Bc7_businessModelElements/addIntellectualProperties',
                                      ID: addingIntellectualAssets[index]
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
                                    "There are no IP Assets at the moment.\n Would you like to add some? Use the '+’ button to get started.",
                                      style: emptyStateTextStyle, textAlign: TextAlign.center
                                  )
                                ],
                              ),
                            );
                          },
                        ),

//                  (addingIntellectualAssets.length == 0)
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
//                    itemCount: addingIntellectualAssets.length,
//                    shrinkWrap: true,
//                    padding: EdgeInsets.only(top: 10.0),
//                    itemBuilder: (context, index) {
//                      return Column(
//                        children: addingIntellectualAssets != null
//                            ? <Widget>[
//                          SmallOrangeCardWithTitle(
//                            title: addingIntellectualAssets[index]
//                                .intellectualProperty,
//                            description:
//                            addingIntellectualAssets[index]
//                                .intellectualCode,
//                            index: index,
//                            removingat: addingIntellectualAssets,
//                            Dialogue: BcIntellectualDialogue(
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
                                routeName: '/BCStep7ServiceOffering',
                                step: 6,
                                stepBool: false,
//                          OnTap: () {
//                            bcStepsContent[6].bcCompletionValidator = false;
////                            print(bcpData[0].CompletionValidator);
//                            Navigator.pushNamed(
//                                context, '/BCStep7ServiceOffering');
//                          },
                                //routeName: '/BCStep3WireFrameLink',
                                // write here
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
                    dotsCount: 3,
                    position: 1,
                  ),
                ],
              ),
            ),
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
              builder: (BuildContext context) => BcIntellectualDialogue(),
            ).then(
              (_) => setState(() {}),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
