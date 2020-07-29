import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step5_CustomerQuotes/BcAddQuote.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithoutTitle.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step5_CustomerQuotes/QuotesDialogue.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcFrameworkData.dart';
import 'package:iventure001/Widgets/CompleteStepButton.dart';
//import 'addQuotesDialogue.dart';

class BcStep5CustomerQuotes extends StatefulWidget {
  @override
  _BcStep5CustomerQuotesState createState() => _BcStep5CustomerQuotesState();
}

class _BcStep5CustomerQuotesState extends State<BcStep5CustomerQuotes> {
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
                      "Adding customer quotes",
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  NoteCard(
                    Note:
                    'Tip: When speaking with prospective customers or potential end users, do we get the impression that the preferred solution concept will provide relief on their pain points? If yes, at the least one of these can be added to demonstrate the effectiveness of the solution concept.',
                  ),
                  (addingNewQuote.length == 0)
                      ? Padding(
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
                  )
                      : ListView.builder(
                    itemCount: addingNewQuote.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 10.0),
                    itemBuilder: (context, index) {
                      return Column(
                        children: addingNewQuote != null
                            ? <Widget>[
                          SmallOrangeCardWithoutTitle(
                            description:
                            addingNewQuote[index].content,
                            index: index,
                            removingat: addingNewQuote,
                            Dialogue: BcQuoteDialogue(
                              index: index,
                            ),
                          )
                        ]
                            : null,
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
                        CompleteStepButton(
                        OnTap: () {
                          bcStepsContent[4].bcCompletionValidator = true;
                          Navigator.pushNamed(
                              context, '/BCHomeView');
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
              builder: (BuildContext context) => BcQuoteDialogue(),
            ).then((_) => setState(() {}));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

