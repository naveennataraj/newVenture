import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionValidation/addQuote.dart';
import 'package:iventure001/Data/CardData.dart';
import 'package:iventure001/Widgets/GoNextButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithoutTitle.dart';

import 'addQuotesDialogue.dart';

class AddQuotes extends StatefulWidget {
  @override
  _AddQuotesState createState() => _AddQuotesState();
}

class _AddQuotesState extends State<AddQuotes> {
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
                      "Add the contact list, with whom the product wireframe will need to be shared (for validation)",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  NoteCard(
                    Note:
                        'Tip: When speaking with prospective customers or potential end users, do we get the impression that the preferred solution concept will provide relief on their pain points? If yes, at the least one of these can be added to demonstrate the effectiveness of the solution concept.',
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: _firestore
                        .collection('$currentUser/SolutionValidation/Quote')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final messsages = snapshot.data.documents.reversed;
                        AddingNewQuote = [];
                        for (var message in messsages) {
                          final Content = message.data['Content'];
                          final CheckQuote = message.data['CheckQuote'];
                          final ID = message.documentID;

                          final card = addQuote(
                              Content: Content, CheckQuote: CheckQuote, ID: ID);
                          AddingNewQuote.add(card);
                        }
                      }

                      return (AddingNewQuote.length != 0)
                          ? ListView.builder(
                              itemCount: AddingNewQuote.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 10.0),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: AddingNewQuote != null
                                      ? <Widget>[
                                          SmallOrangeCardWithoutTitle(
                                            description:
                                                AddingNewQuote[index].Content,
                                            index: index,
                                            removingat: AddingNewQuote,
                                            Dialogue: addQuotesDialogue(
                                              index: index,
                                            ),
                                            CollectionName:
                                                '$currentUser/SolutionValidation/Quote',
                                            ID: AddingNewQuote[index].ID,
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
                        goNextButton(
                          OnTap: () {
                            bcpData[5].CompletionValidator = false;
                            print(bcpData[5].CompletionValidator);
                            Navigator.pushNamed(
                                context, '/reviewcustomerrequirements');
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
              builder: (BuildContext context) => addQuotesDialogue(),
            ).then((_) => setState(() {}));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
