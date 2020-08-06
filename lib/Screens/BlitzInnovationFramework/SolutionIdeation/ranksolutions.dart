import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionIdeation/addRanking.dart';
import 'package:iventure001/Screens/BlitzInnovationFramework/SolutionIdeation/pickDetailsDialogue.dart';
import 'package:iventure001/Widgets/ConfirmPreferenceButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RankSolutions extends StatefulWidget {
  @override
  _RankSolutionsState createState() => _RankSolutionsState();
}

List<String> SolutionRankingList = [];

class _RankSolutionsState extends State<RankSolutions> {
  String SelectedFirstSolution;
  String SelectedSecondSolution;
  String SelectedThirdSolution;
  List<String> FirstDropDown = SolutionRankingList;
  List<String> SecondDropDown = SolutionRankingList;
  List<String> ThirdDropDown = SolutionRankingList;
  bool spinner = false;
  final _firestore = Firestore.instance;

  void getDocument() async {
    spinner = true;
    final document = await _firestore
        .collection('$currentUser/SolutionIdeation/rankSolutions')
        .getDocuments();
//    print("GEt method called");

    for (var message in document.documents) {
      AddingNewRankingArray = [];
      final FirstPreference = message.data['First'];
      final SecondPreference = message.data['Second'];
      final ThirdPreference = message.data['Third'];
      final ID = message.documentID;

      final fields = addRanking(
          ID: ID,
          FirstPreference: FirstPreference,
          SecondPreference: SecondPreference,
          ThirdPreference: ThirdPreference);

      AddingNewRankingArray.add(fields);
    }
    setState(() {
      spinner = false;
      if (AddingNewRankingArray.length != 0) {
        if (AddingNewRankingArray[0].FirstPreference != '') {
          SelectedFirstSolution = AddingNewRankingArray[0].FirstPreference;
        } else {
          SelectedFirstSolution = null;
        }
        if (AddingNewRankingArray[0].SecondPreference != '') {
          SelectedSecondSolution = AddingNewRankingArray[0].SecondPreference;
        } else {
          SelectedSecondSolution = null;
        }
        if (AddingNewRankingArray[0].ThirdPreference != '') {
          SelectedThirdSolution = AddingNewRankingArray[0].ThirdPreference;
        } else {
          SelectedThirdSolution = null;
        }
      }
    });
  }

  @override
  void initState() {
    getDocument();
    super.initState();
  }

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
        child: Center(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "Let's rank the solutions based on preference:",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )),
                    Container(
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border:
                              Border.all(width: 1, color: Color(0XFFABABAB)),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'First Preference or Ideal solution',
                              style: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 16),
                            ),
                            Flexible(
                              child: SizedBox(
                                width: 100,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: DropdownButton(
                                hint: Text(
                                  'Choose',
                                  style: TextStyle(
                                    color: Color(0XFFE95420),
                                  ),
                                ),
                                onChanged: (newValue) {
                                  setState(() {
                                    SelectedFirstSolution = newValue;
                                  });
                                },
                                items: FirstDropDown.map((String singleItem) {
                                  return DropdownMenuItem<String>(
                                      value: singleItem,
                                      child: Text(singleItem));
                                }).toList(),
                                value: SelectedFirstSolution,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border:
                              Border.all(width: 1, color: Color(0XFFABABAB)),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Second Preference',
                              style: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 16),
                            ),
                            Flexible(
                              child: SizedBox(
                                width: 100,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: DropdownButton(
                                hint: Text(
                                  'Choose',
                                  style: TextStyle(
                                    color: Color(0XFFE95420),
                                  ),
                                ),
                                onChanged: (newValue) {
                                  setState(() {
                                    SelectedSecondSolution = newValue;
                                  });
                                },
                                items: SecondDropDown.map((String singleItem) {
                                  return DropdownMenuItem<String>(
                                      value: singleItem,
                                      child: Text(singleItem));
                                }).toList(),
                                value: SelectedSecondSolution,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border:
                              Border.all(width: 1, color: Color(0XFFABABAB)),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Third Preference',
                              style: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 16),
                            ),
                            Flexible(
                              child: SizedBox(
                                width: 100,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: DropdownButton(
                                hint: Text(
                                  'Choose',
                                  style: TextStyle(
                                    color: Color(0XFFE95420),
                                  ),
                                ),
                                onChanged: (newValue) {
                                  setState(() {
                                    SelectedThirdSolution = newValue;
                                  });
                                },
                                items: ThirdDropDown.map((String singleItem) {
                                  return DropdownMenuItem<String>(
                                      value: singleItem,
                                      child: Text(singleItem));
                                }).toList(),
                                value: SelectedThirdSolution,
                              ),
                            ),
                          ],
                        ),
                      ),
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
                          confirmPreferenceButton(
                            DialogueName: pickDetailsDialogue(),
                            FirstPreference: SelectedFirstSolution,
                            ThirdPreference: SelectedThirdSolution,
                            SecondPreference: SelectedSecondSolution,
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
