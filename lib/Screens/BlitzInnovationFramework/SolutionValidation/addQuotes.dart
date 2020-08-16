import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionValidation/addQuote.dart';
import 'package:iventure001/Widgets/GenericStepValidationButtonBIF.dart';
import 'package:iventure001/Widgets/HeadBackMenu.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithoutTitle.dart';

import 'addQuotesDialogue.dart';

class AddQuotes extends StatefulWidget {
  @override
  _AddQuotesState createState() => _AddQuotesState();
}

class _AddQuotesState extends State<AddQuotes> {
  List<Bread> breads = [
    Bread(label: "Home ", route: '/'),
    Bread(
        label: "Blitz Innovation Framework ",
        route: '/BlitzInnovationFramework'),
    Bread(label: "Add Quotes ", route: '/addquotes'),
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
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
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
                              "Let's add some customer quotes (after they have reviewed the product concept)",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          NoteCard(
                            Note:
                                'Tip: When speaking with prospective customers or potential end users, do we get the impression that the preferred solution concept will provide relief on their pain points? If yes, at the least one of these can be added to demonstrate the effectiveness of the solution concept.',
                          ),
                          StreamBuilder<QuerySnapshot>(
                            stream: _firestore
                                .collection(
                                    '$currentUser/SolutionValidation/Quote')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final messsages =
                                    snapshot.data.documents.reversed;
                                AddingNewQuote = [];
                                for (var message in messsages) {
                                  final Content = message.data['Content'];
                                  final CheckQuote = message.data['CheckQuote'];
                                  final ID = message.documentID;

                                  final card = addQuote(
                                      Content: Content,
                                      CheckQuote: CheckQuote,
                                      ID: ID);
                                  AddingNewQuote.add(card);
                                }
                              }

                              return (AddingNewQuote.length != 0)
                                  ? ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: AddingNewQuote.length,
                                      shrinkWrap: true,
                                      padding: EdgeInsets.only(top: 10.0),
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: AddingNewQuote != null
                                              ? <Widget>[
                                                  SmallOrangeCardWithoutTitle(
                                                    description:
                                                        AddingNewQuote[index]
                                                            .Content,
                                                    index: index,
                                                    removingat: AddingNewQuote,
                                                    Dialogue: addQuotesDialogue(
                                                      index: index,
                                                    ),
                                                    CollectionName:
                                                        '$currentUser/SolutionValidation/Quote',
                                                    ID: AddingNewQuote[index]
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
                                          Text(
                                            "There are no Quotes listed at the moment. Would you like to add some? Use the '+’ button to get started.",
                                            style:
                                                TextStyle(color: Colors.grey),
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
                                  routeName: '/BlitzInnovationFramework',
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                GenericStepButtonBIF(
                                  buttonName: 'GO NEXT',
//                                    routeName: '/addpainpoints',
                                  step: 5,
                                  stepBool: false,
                                  widget: () {
                                    Navigator.pushNamed(
                                        context, '/reviewcustomerrequirements');
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
                      position: 0,
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
              builder: (BuildContext context) => addQuotesDialogue(),
            ).then((_) => setState(() {}));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
