import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionIdeation/addSolutions.dart';
import 'package:iventure001/Data/CardData.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/SolutionIdeation/ranksolutions.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/SolutionIdeation/solutionideationDialogue.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:iventure001/Widgets/RankSolutionsButton.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithoutTitleForDropdown.dart';

class SolutionIdeation extends StatefulWidget {
  @override
  _SolutionIdeationState createState() => _SolutionIdeationState();
}

class _SolutionIdeationState extends State<SolutionIdeation> {
  ValueofSolution() {
    int value = AddingNewSolutions.length - 1;
    return value;
  }

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
                      "How do you plan to resolve the customer pain points? Let's add possible solutions:",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  NoteCard(
                    Note:
                        'Tip: To start with, it is ideal to add as many solutions as possible. The relevant solutions can then be shortlisted and the ideal solution option can be selected at the end.',
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: _firestore
                        .collection(
                            '$currentUser/SolutionIdeation/solutionIdeation')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final messsages = snapshot.data.documents.reversed;
                        AddingNewSolutions = [];
                        SolutionRankingList = [];
                        for (var message in messsages) {
                          final Name = message.data['Name'];
                          final BriefDesctiption =
                              message.data['BriefDesctiption'];
                          final ID = message.documentID;

                          final card = addSolutions(
                              Name: Name,
                              BriefDesctiption: BriefDesctiption,
                              ID: ID);
                          AddingNewSolutions.add(card);
                          //Adding solutions to dropdown
                          final AddingSolutinstoDropdown = Name;

                          SolutionRankingList.add(AddingSolutinstoDropdown);
                        }
                      }

                      return (AddingNewSolutions.length != 0)
                          ? ListView.builder(
                              itemCount: AddingNewSolutions.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 10.0),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: AddingNewSolutions != null
                                      ? <Widget>[
                                          SmallOrangeCardWithoutTitleForDropDown(
                                            description:
                                                AddingNewSolutions[index].Name,
                                            index: index,
                                            removingat: AddingNewSolutions,
                                            Dialogue: solutionIdeationDialogue(
                                              index: index,
                                            ),
                                            CollectionName:
                                                '$currentUser/SolutionIdeation/solutionIdeation',
                                            ID: AddingNewSolutions[index].ID,
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
                                    "Click on '+' to add the solutions",
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
                        RankSolutionsButton(
                          OnTap: () {
                            bcpData[2].CompletionValidator = false;
                            print(bcpData[2].CompletionValidator);
                            Navigator.pushNamed(context, '/ranksolutions');
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
              builder: (BuildContext context) => solutionIdeationDialogue(),
            ).then((_) => setState(() {}));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
