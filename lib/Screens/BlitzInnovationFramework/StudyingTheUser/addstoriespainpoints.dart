import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/StudyTheUser/addUserStoriesData.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/StudyingTheUser/UserStoryDialogue.dart';
import 'package:iventure001/Widgets/GenericStepValidationButtonBIF.dart';
import 'package:iventure001/Widgets/HeadBackMenu.dart';
import 'package:iventure001/Widgets/MaximumCardsDialog.dart';
import 'package:iventure001/Widgets/MinimumCardsDialog.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithoutTitle.dart';

class AddStoriesPainPoints extends StatefulWidget {
  @override
  _AddStoriesPainPointsState createState() => _AddStoriesPainPointsState();
}

class _AddStoriesPainPointsState extends State<AddStoriesPainPoints> {
  List<Bread> breads = [
    Bread(label: "Home ", route: '/'),
    Bread(
        label: "Blitz Innovation Framework ",
        route: '/BlitzInnovationFramework'),
    Bread(label: "Add User Persona ", route: '/adduserpersona'),
    Bread(
        label: "Add User Environment Details ",
        route: '/adduserenvironmentdetails'),
    Bread(label: "Add User Stories ", route: '/addstoriespainpoints'),
  ];

  UserStory(int index) {
    String A = AddingNewUserStory[index].Asa;
    String B = AddingNewUserStory[index].IWantTo;
    String C = AddingNewUserStory[index].SoThat;

    return 'As a $A, I want to $B so that $C';
  }

  DemoUserStory(int index) {
    String A = DemoAddingNewUserStory[index].Asa;
    String B = DemoAddingNewUserStory[index].IWantTo;
    String C = DemoAddingNewUserStory[index].SoThat;

    return 'As a $A, I want to $B so that $C';
  }

  final _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFAFAFA),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: NavigationBar(
          routeName: '/addstoriespainpoints',
        ),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                              "Let's capture some user stories",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          (demoSelected == false)
                              ? StreamBuilder<QuerySnapshot>(
                                  stream: _firestore
                                      .collection(
                                          '$currentUser/StudyingTheUser/userStory')
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      final messsages =
                                          snapshot.data.documents.reversed;
                                      AddingNewUserStory = [];
                                      for (var message in messsages) {
                                        final Asa = message.data['Asa'];
                                        final IWantTo = message.data['IWantTo'];
                                        final SoThat = message.data['SoThat'];
                                        final ID = message.documentID;

                                        final card = addUserStories(
                                            Asa: Asa,
                                            IWantTo: IWantTo,
                                            SoThat: SoThat,
                                            ID: ID);
                                        AddingNewUserStory.add(card);
                                      }
                                    }

                                    return (AddingNewUserStory.length != 0)
                                        ? ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
//                                scrollDirection: Axis.vertical,
                                            itemCount:
                                                AddingNewUserStory.length,
                                            shrinkWrap: true,
                                            padding: EdgeInsets.only(top: 10.0),
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: AddingNewUserStory !=
                                                        null
                                                    ? <Widget>[
                                                        SmallOrangeCardWithoutTitle(
                                                          description:
                                                              UserStory(index),
                                                          index: index,
                                                          removingat:
                                                              AddingNewUserStory,
                                                          Dialogue:
                                                              userStoryDialogue(
                                                            index: index,
                                                          ),
                                                          CollectionName:
                                                              '$currentUser/StudyingTheUser/userStory',
                                                          ID: AddingNewUserStory[
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
                                                    "There are no user stories at the moment. Would you like to add some? Use the '+’ button to get started.",
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                  },
                                )
                              : ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
//                                scrollDirection: Axis.vertical,
                                  itemCount: DemoAddingNewUserStory.length,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(top: 10.0),
                                  itemBuilder: (context, index) {
                                    return Column(children: <Widget>[
                                      SmallOrangeCardWithoutTitle(
                                        description: DemoUserStory(index),
                                        index: index,
                                        removingat: AddingNewUserStory,
                                        Dialogue: userStoryDialogue(
                                          index: index,
                                        ),
                                      )
                                    ]);
                                  },
                                ),
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                headBackButtton(
                                  routeName: '/adduserenvironmentdetails',
                                ),
                                SizedBox(
                                  width: 50,
                                ),
//                                CompleteStepButton(
//                                  OnTap: () {
//                                    bcpData[1].CompletionValidator = true;
//                                    print(bcpData[1].CompletionValidator);
//                                    Navigator.pushNamed(
//                                        context, '/BlitzInnovationFramework');
//                                  },
//
//                                ),
                                GenericStepButtonBIF(
                                  buttonName: 'COMPLETE STEP',
//                                    routeName: '/addpainpoints',
                                  step: 1,
                                  stepBool: true,
                                  widget: () {
                                    if (AddingNewUserStory.length < 3) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            MinimumCardsDialog(
                                          minimumcards: 3,
                                        ),
                                      ).then((_) => setState(() {}));
                                    } else if (AddingNewUserStory.length >= 3) {
                                      Navigator.popAndPushNamed(
                                          context, '/BlitzInnovationFramework');
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
                      dotsCount: 3,
                      position: 2,
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
          onPressed: (AddingNewUserStory.length < 18)
              ? () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => userStoryDialogue(),
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
