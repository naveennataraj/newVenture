import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionIdeation/addSolutions.dart';
import 'package:iventure001/Widgets/AddSolutionButton.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/SolutionExistsDialog.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';

class solutionIdeationDialogue extends StatefulWidget {
  final int index;

  const solutionIdeationDialogue({this.index});
  @override
  _solutionIdeationDialogueState createState() =>
      _solutionIdeationDialogueState(index);
}

var NamelabelColor = Color(0XFF919191);
bool validName = true;
var NameTextController = TextEditingController();
final NameFocusNode = new FocusNode();
String Name;

var BrieflabelColor = Color(0XFF919191);
bool validBrief = true;
var BriefTextController = TextEditingController();
final BriefFocusNode = new FocusNode();
String Brief;

class _solutionIdeationDialogueState extends State<solutionIdeationDialogue> {
  int index;
  final _firestore = Firestore.instance;

  validator() {
    setState(() {
      NameTextController.text.isEmpty ? validName = false : validName = true;
      NameTextController.text.isEmpty
          ? NamelabelColor = Color(0xFFF53E70)
          : NamelabelColor = Color(0xFF919191);
      BriefTextController.text.isEmpty ? validBrief = false : validBrief = true;
      BriefTextController.text.isEmpty
          ? BrieflabelColor = Color(0xFFF53E70)
          : BrieflabelColor = Color(0xFF919191);

      print("(Validator is called)");
    });
  }

  _solutionIdeationDialogueState(this.index);
  @override
  void initState() {
    super.initState();
    if (index != null) {
      NameTextController =
          TextEditingController(text: AddingNewSolutions[index].Name);
      BriefTextController = TextEditingController(
          text: AddingNewSolutions[index].BriefDesctiption);
    } else {
      NameTextController.clear();
      BriefTextController.clear();
    }
  }

  ValueofSolution() {
    int value = AddingNewSolutions.length - 1;
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)), //this right here
        child: Container(
          height: 500,
          width: 800,
          child: Center(
            child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Add a New Solution Concept",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TextFieldWidget(
                      labelText: "Name of the solution",
                      maxLines: 1,
                      validText: validName,
                      myFocusNode: NameFocusNode,
                      myTextController: NameTextController,
                      textCollecter: Name,
                      helperText: '',
                      labelcolour: NamelabelColor,
                    ),
                    TextFieldWidget(
                      labelText: "Brief Description",
                      maxLines: 3,
                      validText: validBrief,
                      myFocusNode: BriefFocusNode,
                      myTextController: BriefTextController,
                      textCollecter: Brief,
                      helperText: '',
                      labelcolour: BrieflabelColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AddSolutionButton(
                            onTap: (NameTextController.text == '' ||
                                    BriefTextController.text == '')
                                ? () {
                                    validator();
                                  }
                                : () {
                                    (NameTextController.text != '' &&
                                            BriefTextController.text != '')
                                        ? Navigator.pop(context)
                                        : {};

                                    (AddingNewSolutions.contains(Name))
                                        ? showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                SolutionExistsDialogue(),
                                          )
                                        : {};
                                    setState(() {
//                                final NewSolutionIdeation = addSolutions(
//                                  Name: NameTextController.text,
//                                  BriefDesctiption: BriefTextController.text,
//                                );

                                      if (index == null) {
//                                  AddingNewSolutions.add(NewSolutionIdeation);
                                        _firestore
                                            .collection(
                                                '$currentUser/SolutionIdeation/solutionIdeation')
                                            .add({
                                          'Name': NameTextController.text,
                                          'BriefDesctiption':
                                              BriefTextController.text,
                                          'Sender': "tester@gmail.com",
                                        });
                                      } else {
//                                  AddingNewSolutions.removeAt(index);
//                                  AddingNewSolutions.insert(
//                                      index, NewSolutionIdeation);
                                        _firestore
                                            .collection(
                                                '$currentUser/SolutionIdeation/solutionIdeation')
                                            .document(
                                                AddingNewSolutions[index].ID)
                                            .updateData({
                                          'Name': NameTextController.text,
                                          'BriefDesctiption':
                                              BriefTextController.text,
                                          'Sender': "tester@gmail.com",
                                        });
                                      }

//                                      //Adding solutions to dropdown
//                                      final AddingSolutinstoDropdown =
//                                          NameTextController.text;
//
//                                      if (index == null) {
//                                        SolutionRankingList.add(
//                                            AddingSolutinstoDropdown);
//                                      } else {
//                                        SolutionRankingList.removeAt(index);
//                                        SolutionRankingList.insert(
//                                            index, AddingSolutinstoDropdown);
//                                      }
                                    });
                                  },
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          CancelButtton(
                            OnTap: () {
                              NameTextController.clear();
                              BriefTextController.clear();
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }
}
