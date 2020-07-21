import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/StudyTheUser/addUserStoriesData.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/StudyingTheUser/UserStoryDialogue.dart';
import 'package:iventure001/Widgets/CompleteStepButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithoutTitle.dart';

class AddStoriesPainPoints extends StatefulWidget {
  @override
  _AddStoriesPainPointsState createState() => _AddStoriesPainPointsState();
}

class _AddStoriesPainPointsState extends State<AddStoriesPainPoints> {
  UserStory(int index) {
    String A = AddingNewUserStory[index].Asa;
    String B = AddingNewUserStory[index].IWantTo;
    String C = AddingNewUserStory[index].SoThat;

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
                        "Let's capture some user stories",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                  ListView.builder(
                    itemCount: AddingNewUserStory.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 10.0),
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          SmallOrangeCardWithoutTitle(
                            description: UserStory(index),
                            index: index,
                            removingat: AddingNewUserStory,
                            Dialogue: userStoryDialogue(
                              index: index,
                            ),
                          )
                        ],
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
                        CompleteStepButton(),
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
              builder: (BuildContext context) => userStoryDialogue(),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
