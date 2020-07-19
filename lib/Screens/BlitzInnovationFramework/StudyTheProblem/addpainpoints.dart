import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcAddFoundation/ContentBcAddFoundation.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/StudyTheProblem/painPointDialogue.dart';
import 'package:iventure001/Widgets/CompleteStepButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/SmallOrangeCardWithoutTitle.dart';

class AddPainPoints extends StatefulWidget {
  @override
  _AddPainPointsState createState() => _AddPainPointsState();
}

var ChallengelabelColor = Color(0XFF919191);
bool validChallenge = true;
final ChallengeTextController = TextEditingController();
final ChallengeFocusNode = new FocusNode();

var MoreDetailslabelColor = Color(0XFF919191);
bool validMoreDetails = true;
final MoreDetailsTextController = TextEditingController();
final MoreDetailsFocusNode = new FocusNode();

var ConsequencelabelColor = Color(0XFF919191);
bool validConsequence = true;
final ConsequenceTextController = TextEditingController();
final ConsequenceFocusNode = new FocusNode();

var addresspplabelColor = Color(0XFF919191);
bool validaddresspp = true;
final addressppTextController = TextEditingController();
final addressppFocusNode = new FocusNode();

var expectationslabelColor = Color(0XFF919191);
bool validexpectations = true;
final expectationsTextController = TextEditingController();
final expectationsFocusNode = new FocusNode();

bool validTitle = true;
final TitleTextController = TextEditingController();
final TitleFocusNode = new FocusNode();

class _AddPainPointsState extends State<AddPainPoints> {
  void requestFocus(BuildContext mycontext, FocusNode myFocusNode) {
    setState(() {
      FocusScope.of(mycontext).requestFocus(myFocusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iVENTURE'),
        backgroundColor: Color(0XFFE95420),
      ),
      backgroundColor: Color(0XFFFAFAFA),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Material(
              color: Colors.white,
              elevation: 5,
              child: Container(
                height: MediaQuery.of(context).size.height * .60,
                width: MediaQuery.of(context).size.width * .40,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Let's collect some details on the Customer's Problem",
                        style: TextStyle(fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        itemCount: addPainPointsContent.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: 10.0),
                        itemBuilder: (context, index) {
                          return Column(
                            children: <Widget>[
                              //CardRectangleLarge(subjects[index]),
                              SmallOrangeCardWithoutTitle(
                                  addPainPointsContent[index]),
                            ],
                          );
                        },
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(100),
                child: FloatingActionButton(
                  tooltip: "Add's New Card",
                  backgroundColor: Color(0XFFE95420),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext dialcontext) =>
                          painpointDialogue(),
                    );
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
