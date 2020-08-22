import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/ManagingGrowth/addparallelinnovations.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/ManagingGrowth/addParallelInnovationsDialogue.dart';
import 'package:iventure001/Widgets/GenericStepValidationButtonBIF.dart';
import 'package:iventure001/Widgets/HeadBackMenu.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithTitle.dart';

class AddParallelInnovations extends StatefulWidget {
  @override
  _AddParallelInnovationsState createState() => _AddParallelInnovationsState();
}

class _AddParallelInnovationsState extends State<AddParallelInnovations> {
  List<Bread> breads = [
    Bread(label: "Home ", route: '/'),
    Bread(
        label: "Blitz Innovation Framework ",
        route: '/BlitzInnovationFramework'),
    Bread(label: "Handling Scale ", route: '/handlingscale'),
    Bread(label: "Add Parallel Innovations ", route: '/addparallelinnovations'),
  ];
  final _firestore = Firestore.instance;
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
                              "Let's add possible parallel innovation concepts",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          NoteCard(
                            Note:
                                'Tip: Based on your solution concept which has been designed until this point, is there any parallel solution concept(s) which you can think of which would provide value to the customer?\nOne example of this is Uber Eats which was derived from the Original Uber solution. Another example is the Apple watch which was designed as a complementary offering to the iPhone/iPad line of products.',
                          ),
                          StreamBuilder<QuerySnapshot>(
                            stream: _firestore
                                .collection(
                                    '$currentUser/ManagingGrowth/parallelInnovations')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final messsages =
                                    snapshot.data.documents.reversed;
                                AddingNewParallelInnovations = [];
                                for (var message in messsages) {
                                  final Name = message.data['Name'];
                                  final Description =
                                      message.data['Description'];
                                  final CheckedSolution =
                                      message.data['CheckedSolution'];
                                  final ID = message.documentID;

                                  final card = addparallelinnovations(
                                      Name: Name,
                                      Description: Description,
                                      CheckedSolution: CheckedSolution,
                                      ID: ID);
                                  AddingNewParallelInnovations.add(card);
                                }
                              }

                              return (AddingNewParallelInnovations.length != 0)
                                  ? ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount:
                                          AddingNewParallelInnovations.length,
                                      shrinkWrap: true,
                                      padding: EdgeInsets.only(top: 10.0),
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children:
                                              AddingNewParallelInnovations !=
                                                      null
                                                  ? <Widget>[
                                                      SmallOrangeCardWithTitle(
                                                        title:
                                                            AddingNewParallelInnovations[
                                                                    index]
                                                                .Name,
                                                        description:
                                                            AddingNewParallelInnovations[
                                                                    index]
                                                                .Description,
                                                        index: index,
                                                        removingat:
                                                            AddingNewParallelInnovations,
                                                        Dialogue:
                                                            addParallelInnovationDialogue(
                                                          index: index,
                                                        ),
                                                        CollectionName:
                                                            '$currentUser/ManagingGrowth/parallelInnovations',
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Click on ‘+’ to add the solution concept' please add ‘There are no solution concepts listed at the moment. Would you like to add some? Use the '+’ button to get started.",
                                              style:
                                                  TextStyle(color: Colors.grey),
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
                                  routeName: '/handlingscale',
                                ),
                                SizedBox(
                                  width: 50,
                                ),
//                                CompleteStepButton(
//                                  OnTap: () {
//                                    bcpData[6].CompletionValidator = true;
//                                    print(bcpData[6].CompletionValidator);
//                                    Navigator.pushNamed(
//                                        context, '/BlitzInnovationFramework');
//                                  },
//                                ),
                                GenericStepButtonBIF(
                                  buttonName: 'COMPLETE STEP',
//                                    routeName: '/addpainpoints',
                                  step: 6,
                                  stepBool: true,
                                  widget: () {
//                                    bcpData[6].CompletionValidator = true;
//                                    print(bcpData[6].CompletionValidator);
                                    Navigator.pushNamed(
                                        context, '/BlitzInnovationFramework');
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
                      dotsCount: 2,
                      position: 1,
                    ),
                  ],
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
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) =>
                  addParallelInnovationDialogue(),
            ).then((_) => setState(() {}));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
