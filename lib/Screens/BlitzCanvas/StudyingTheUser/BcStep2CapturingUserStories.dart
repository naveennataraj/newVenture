import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step2_StudyingTheUser/ContentUserStories.dart';
import 'package:iventure001/Screens/BlitzCanvas/StudyingTheUser/BcStoryDialogue.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:iventure001/Widgets/HeadBackMenu.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithoutTitle.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';

class BcStep2CapturingUserStories extends StatefulWidget {
  @override
  _BcStep2CapturingUserStoriesState createState() =>
      _BcStep2CapturingUserStoriesState();
}

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
  Bread(label: "User Profile", route: '/BCStep2UserProfile'),
  Bread(label: "User Stories", route: '/BCStep2CaptureUserStories'),
];


class _BcStep2CapturingUserStoriesState
    extends State<BcStep2CapturingUserStories> {
  final _firestore = Firestore.instance;

  UserStory(int index) {
    String A = userStoriesContent[index].Asa;
    String B = userStoriesContent[index].IWantTo;
    String C = userStoriesContent[index].SoThat;

    return 'As a $A, I want to $B so that $C';
  }

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
                      "Add details of the foundational aspects of the business",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: _firestore
                        .collection(
                            '$currentUser/Bc2_studyingTheUser/addFoundations')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final messages = snapshot.data.documents.reversed;
                        print(messages);
                        userStoriesContent = [];
                        for (var message in messages) {
                          final Asa = message.data['Asa'];
                          final IWantTo = message.data['IWantTo'];
                          final SoThat = message.data['SoThat'];
                          final ID = message.documentID;

                          final card = BcContentUserStories(
                            Asa: Asa,
                            IWantTo: IWantTo,
                            SoThat: SoThat,
                            ID: ID,
                          );
                          userStoriesContent.add(card);
                        }
                      }

                      return (userStoriesContent.length != 0)
                          ? ListView.builder(
                              itemCount: userStoriesContent.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 10.0),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: userStoriesContent != null
                                      ?<Widget>[
                                    SmallOrangeCardWithoutTitle(
                                      description: UserStory(index),
                                      index: index,
                                      removingat: userStoriesContent,
                                      Dialogue: BcUserStoryDialogue(
                                        index: index,
                                      ),
                                      CollectionName:
                                          '$currentUser/Bc2_studyingTheUser/addFoundations',
                                      ID: userStoriesContent[index].ID,
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

//          SingleChildScrollView(
//              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//              child: Column(
//                children: <Widget>[
//                  Padding(
//                      padding: EdgeInsets.symmetric(vertical: 10.0),
//                      child: Text(
//                        "Capturing User stories",
//                        style: TextStyle(
//                            fontSize: 22, fontWeight: FontWeight.bold),
//                        textAlign: TextAlign.center,
//                      ),),
//                  (userStoriesContent.length == 0)
//                      ? Padding(
//                    padding: const EdgeInsets.all(25.0),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: [
//                        Text(
//                          "Click on '+' to add the User Stories",
//                          style: TextStyle(color: Colors.grey),
//                        )
//                      ],
//                    ),
//                  )
//                      :
//                  ListView.builder(
//                    itemCount: userStoriesContent.length,
//                    shrinkWrap: true,
//                    padding: EdgeInsets.only(top: 10.0),
//                    itemBuilder: (context, index) {
//                      return Column(
//                        children: userStoriesContent != null
//                            ? <Widget>[
//                          SmallOrangeCardWithoutTitle(
//                            description: UserStory(index),
//                            index: index,
//                            removingat: userStoriesContent,
//                            Dialogue: BcUserStoryDialogue(
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
                          buttonName: 'COMPLETE STEP 2',
                          routeName: '/BCHomeView',
                          step: 1,
                          stepBool: true,
//                          OnTap: () {
//                            bcStepsContent[1].bcCompletionValidator = true;
//                            Navigator.pushNamed(context, '/BCHomeView');
//                          },
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
              builder: (BuildContext context) => BcUserStoryDialogue(),
            ).then((_) => setState(() {}));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
