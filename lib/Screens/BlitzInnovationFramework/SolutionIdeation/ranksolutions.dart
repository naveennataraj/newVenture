import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';
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
  List<Bread> breads = [
    Bread(label: "Home ", route: '/'),
    Bread(
        label: "Blitz Innovation Framework ",
        route: '/BlitzInnovationFramework'),
    Bread(label: "Add Solutions ", route: '/solutionideation'),
    Bread(label: "Rank Solutions ", route: '/ranksolutions'),
  ];

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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Breadcrumb(breads: breads, color: Color(0xFFE95420)),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                                  "Let's rank the solutions based on preference:",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                )),
                            Container(
                              margin: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                      width: 1, color: Color(0XFFABABAB)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'First Preference or Ideal solution',
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    DropdownButton(
                                      isExpanded: true,
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
                                      items: FirstDropDown.map(
                                          (String singleItem) {
                                        return DropdownMenuItem<String>(
                                            value: singleItem,
                                            child: Text(singleItem));
                                      }).toList(),
                                      value: SelectedFirstSolution,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                      width: 1, color: Color(0XFFABABAB)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Second Preference',
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    DropdownButton(
                                      isExpanded: true,
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
                                      items: SecondDropDown.map(
                                          (String singleItem) {
                                        return DropdownMenuItem<String>(
                                            value: singleItem,
                                            child: Text(singleItem));
                                      }).toList(),
                                      value: SelectedSecondSolution,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                      width: 1, color: Color(0XFFABABAB)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Third Preference',
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    DropdownButton(
                                      isExpanded: true,
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
                                      items: ThirdDropDown.map(
                                          (String singleItem) {
                                        return DropdownMenuItem<String>(
                                            value: singleItem,
                                            child: Text(singleItem));
                                      }).toList(),
                                      value: SelectedThirdSolution,
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
                        position: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
