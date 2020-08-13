import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step9_ManagingGrowth/ContentParallelSolution.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step9_ManagingGrowth/BcEcosystemDialogue.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithTitle.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:dots_indicator/dots_indicator.dart';

class BcCreatingEcosystems extends StatefulWidget {
  @override
  _BcCreatingEcosystemsState createState() => _BcCreatingEcosystemsState();
}

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
  Bread(label: "Business Growth", route: '/BCStep9Growth'),
  Bread(label: "Product Offerings", route: '/BCStep9CreatingEcosystems'),
];

class _BcCreatingEcosystemsState extends State<BcCreatingEcosystems> {
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
                  Breadcrumb(
                    breads: breads,
                    color: Color(0xFFE95420),
                  ),
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
                            "Creating Ecosystems with new product offerings",
                            style:
                            cardTitleTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        NoteCard(
                          Note:
                          "Tip: Tip: Based on your solution concept which has been designed until this point, is there any parallel solution concept(s) which you can think of which would provide value to the customer?\nOne example of this is Uber Eats which was derived from the Original Uber solution. Another example is the Apple watch which was designed as a complementary offering to the iPhone/iPad line of products.",
                        ),

                        StreamBuilder<QuerySnapshot>(
                          stream: _firestore
                              .collection('$currentUser/Bc9_managingGrowth/addConcepts')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final messages = snapshot.data.documents.reversed;
                              AddingNewParallelInnovations = [];
                              for (var message in messages) {
                                final Name = message.data['Name'];
                                final Description = message.data['Description'];
                                final CheckedSolution =
                                message.data['CheckedSolution'];
                                final ID = message.documentID;

                                final card = ContentParallelSolution(
                                  Name: Name,
                                  Description: Description,
                                  CheckedSolution: CheckedSolution,
                                  ID: ID,
                                );
                                AddingNewParallelInnovations.add(card);
                              }
                            }

                            return (AddingNewParallelInnovations.length != 0)
                                ? ListView.builder(
                              itemCount: AddingNewParallelInnovations.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 10.0),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: AddingNewParallelInnovations != null
                                      ? <Widget>[
                                    SmallOrangeCardWithTitle(
                                      title: AddingNewParallelInnovations[
                                      index]
                                          .Name,
                                      description:
                                      AddingNewParallelInnovations[
                                      index]
                                          .Description,
                                      index: index,
                                      removingat:
                                      AddingNewParallelInnovations,
                                      Dialogue: BcEcosystemsDialogue(
                                        index: index,
                                      ),
                                      CollectionName:
                                      '$currentUser/Bc9_managingGrowth/addConcepts',
                                      ID: AddingNewParallelInnovations[
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "There are no parallel solution concepts listed at the moment.\n Would you like to add some? Use the '+’ button to get started.",
                                      style: emptyStateTextStyle, textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            );
                          },
                        ),

//                  (AddingNewParallelInnovations.length == 0)
//                      ? Padding(
//                    padding: const EdgeInsets.all(25.0),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: [
//                        Text(
//                          "Click on '+' to add the Competing Products",
//                          style: TextStyle(color: Colors.grey),
//                        )
//                      ],
//                    ),
//                  )
//                      : ListView.builder(
//                    itemCount: AddingNewParallelInnovations.length,
//                    shrinkWrap: true,
//                    padding: EdgeInsets.only(top: 10.0),
//                    itemBuilder: (context, index) {
//                      return Column(
//                        children: AddingNewParallelInnovations != null
//                            ? <Widget>[
//                          SmallOrangeCardWithTitle(
//                            title: AddingNewParallelInnovations[index]
//                                .Name,
//                            description:
//                            AddingNewParallelInnovations[index]
//                                .Description,
//                            index: index,
//                            removingat: AddingNewParallelInnovations,
//                            Dialogue: BcEcosystemsDialogue(
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
                                buttonName: 'COMPLETE STEP 9',
                                routeName: '/BCHomeView',
                                step: 8,
                                stepBool: true,
//                          OnTap: () {
//                            bcStepsContent[8].bcCompletionValidator = true;
//                            Navigator.pushNamed(context, '/BCHomeView');
//                          },
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
                    dotsCount: 2,
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
              builder: (BuildContext context) => BcEcosystemsDialogue(),
            ).then((_) => setState(() {}));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
