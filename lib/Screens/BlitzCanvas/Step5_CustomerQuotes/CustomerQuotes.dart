import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step5_CustomerQuotes/BcAddQuote.dart';
import 'package:iventure001/Widgets/HeadBackMenu.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithoutTitle.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step5_CustomerQuotes/QuotesDialogue.dart';
import 'package:iventure001/Widgets/GenericStepValidationButton.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
import 'package:dots_indicator/dots_indicator.dart';


class BcStep5CustomerQuotes extends StatefulWidget {
  @override
  _BcStep5CustomerQuotesState createState() => _BcStep5CustomerQuotesState();
}

List<Bread> breads = [
  Bread(label: "Home ", route: '/'),
  Bread(label: "Blitz Canvas ", route: '/BCHomeView'),
  Bread(label: "Customer Quotes", route: '/BCStep5CustomersQuotes'),
];

class _BcStep5CustomerQuotesState extends State<BcStep5CustomerQuotes> {
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
                            "Adding customer quotes",
                            style:
                            cardTitleTextStyle,
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
                              '$currentUser/Bc5_userFeedback/addQuotes')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final messages = snapshot.data.documents.reversed;
                              //print('these are the messages $messages');
                              addingNewQuote = [];
                              for (var message in messages) {
                                final content = message.data['content'];
                                final checkQuote =
                                message.data['checkQuote'];
                                final ID = message.documentID;

                                final card = BcAddQuote(
                                  content: content,
                                  checkQuote: checkQuote,
                                  ID: ID,
                                );
                                addingNewQuote.add(card);
                              }
                            }

                            return (addingNewQuote.length != 0)
                                ? ListView.builder(
                              itemCount: addingNewQuote.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 10.0),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: addingNewQuote != null
                                      ? <Widget>[
                                    SmallOrangeCardWithoutTitle(
                                      description:
                                      addingNewQuote[index]
                                          .content,
                                      index: index,
                                      removingat: addingNewQuote,
                                      Dialogue:
                                      BcQuoteDialogue(
                                        index: index,
                                      ),
                                      CollectionName: '$currentUser/Bc5_userFeedback/addQuotes',
                                      ID: addingNewQuote[index]
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
                                    "There are no customer quotes at the moment. \n Would you like to add some? Use the '+’ button to get started.",
                                    style: emptyStateTextStyle,
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            );
                          },
                        ),


//                  (addingNewQuote.length == 0)
//                      ? Padding(
//                    padding: const EdgeInsets.all(25.0),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: [
//                        Text(
//                          "Click on '+' to add the solutions",
//                          style: TextStyle(color: Colors.grey),
//                        )
//                      ],
//                    ),
//                  )
//                      : ListView.builder(
//                    itemCount: addingNewQuote.length,
//                    shrinkWrap: true,
//                    padding: EdgeInsets.only(top: 10.0),
//                    itemBuilder: (context, index) {
//                      return Column(
//                        children: addingNewQuote != null
//                            ? <Widget>[
//                          SmallOrangeCardWithoutTitle(
//                            description:
//                            addingNewQuote[index].content,
//                            index: index,
//                            removingat: addingNewQuote,
//                            Dialogue: BcQuoteDialogue(
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
                                buttonName: 'COMPLETE STEP 5',
                                routeName: '/BCHomeView',
                                step: 4,
                                stepBool: true,
//                        OnTap: () {
//                          bcStepsContent[4].bcCompletionValidator = true;
//                          Navigator.pushNamed(
//                              context, '/BCHomeView');
//                        },
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
                    dotsCount: 1,
                    position: 0,
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
              builder: (BuildContext context) => BcQuoteDialogue(),
            ).then((_) => setState(() {}));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

