import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/StudyTheProblem/addPainPointsData.dart';
import 'package:iventure001/Data/CardData.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/StudyTheProblem/painPointDialogue.dart';
import 'package:iventure001/Widgets/CompleteStepButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithoutTitle.dart';

class AddPainPoints extends StatefulWidget {
  @override
  _AddPainPointsState createState() => _AddPainPointsState();
}

class _AddPainPointsState extends State<AddPainPoints> {
  NotifyProgress() {
    setState(() {});
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
                        'Add details of the foundational aspects of the business',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                  (AddingNewPainPoint.length == 0)
                      ? Padding(
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
                        )
                      : ListView.builder(
                          itemCount: AddingNewPainPoint.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 10.0),
                          itemBuilder: (context, index) {
                            return Column(
                              children: <Widget>[
                                SmallOrangeCardWithoutTitle(
                                  description:
                                      AddingNewPainPoint[index].Challenge,
                                  index: index,
                                  removingat: AddingNewPainPoint,
                                  Dialogue: painpointDialogue(index: index),
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
                        CompleteStepButton(
                          OnTap: () {
                            bcpData[0].CompletionValidator = true;
                            print(bcpData[0].CompletionValidator);
                            Navigator.pushNamed(
                                context, '/BlitzInnovationFramework');
                          },
                        ),
                      ],
                    ),
                  )
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
              builder: (BuildContext context) => painpointDialogue(),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
