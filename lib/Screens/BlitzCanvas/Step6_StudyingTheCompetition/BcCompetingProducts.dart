import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step6_StudyingTheCompetition/ContentCompetingProduct.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step6_StudyingTheCompetition/DialogueCompetingProduct.dart';
import 'package:iventure001/Widgets/CanvasCompleteStepButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithTittleDynamic.dart';

class BcStep6CompetingProducts extends StatefulWidget {
  @override
  _BcStep6CompetingProductsState createState() => _BcStep6CompetingProductsState();
}

class _BcStep6CompetingProductsState extends State<BcStep6CompetingProducts> {
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
                      "List of current competing players in the market",
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  NoteCard(
                    Note:
                    "Tip: This section contains a list of solutions available in the market, which can cater to the customer's pain points.",
                  ),
                  (AddingNewCompetingProduct.length == 0)
                      ? Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Click on '+' to add the Competing Products",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  )
                      : ListView.builder(
                    itemCount: AddingNewCompetingProduct.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 10.0),
                    itemBuilder: (context, index) {
                      return Column(
                        children: AddingNewCompetingProduct != null
                            ? <Widget>[
                          SmallOrangeCardWithTitleDynamic(
                            title: AddingNewCompetingProduct[index]
                                .ProductName,
                            description:
                            AddingNewCompetingProduct[index]
                                .Features,
                            index: index,
                            removingat: AddingNewCompetingProduct,
                            Dialogue: BcCompetingProductDialogue(
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
                        CompleteStepButton(),
//                        goNextButton(
////                          routeName: '/addwireframelink',
//                          OnTap: () {
////                            bcpData[3].CompletionValidator = false;
////                            print(bcpData[3].CompletionValidator);
//                            Navigator.pushNamed(context, '/addwireframelink');
//                          },
//                        ),
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
              builder: (BuildContext context) => BcCompetingProductDialogue(),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
