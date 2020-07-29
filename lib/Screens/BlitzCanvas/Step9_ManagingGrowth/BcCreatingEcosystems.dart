import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step9_ManagingGrowth/ContentParallelSolution.dart';
import 'package:iventure001/Screens/BlitzCanvas/Step9_ManagingGrowth/BcEcosystemDialogue.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithTitle.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcFrameworkData.dart';
import 'package:iventure001/Widgets/CompleteStepButton.dart';

class BcCreatingEcosystems extends StatefulWidget {
  @override
  _BcCreatingEcosystemsState createState() => _BcCreatingEcosystemsState();
}

class _BcCreatingEcosystemsState extends State<BcCreatingEcosystems> {
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
                      "Creating Ecosystems with new product offerings",
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  NoteCard(
                    Note:
                    "Tip: Tip: Based on your solution concept which has been designed until this point, is there any parallel solution concept(s) which you can think of which would provide value to the customer?\nOne example of this is Uber Eats which was derived from the Original Uber solution. Another example is the Apple watch which was designed as a complementary offering to the iPhone/iPad line of products.",
                  ),
                  (AddingNewParallelInnovations.length == 0)
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
                    itemCount: AddingNewParallelInnovations.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 10.0),
                    itemBuilder: (context, index) {
                      return Column(
                        children: AddingNewParallelInnovations != null
                            ? <Widget>[
                          SmallOrangeCardWithTitle(
                            title: AddingNewParallelInnovations[index]
                                .Name,
                            description:
                            AddingNewParallelInnovations[index]
                                .Description,
                            index: index,
                            removingat: AddingNewParallelInnovations,
                            Dialogue: BcEcosystemsDialogue(
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
                            bcStepsContent[8].bcCompletionValidator = true;
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
              builder: (BuildContext context) => BcEcosystemsDialogue(),
            ).then((_) => setState(() {}));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
