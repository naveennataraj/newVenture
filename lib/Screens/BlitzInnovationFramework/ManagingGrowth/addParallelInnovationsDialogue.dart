import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/ManagingGrowth/addparallelinnovations.dart';
import 'package:iventure001/Widgets/AddSolutionConceptButton.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';

class addParallelInnovationDialogue extends StatefulWidget {
  final int index;

  const addParallelInnovationDialogue({this.index});
  @override
  _addParallelInnovationDialogueState createState() =>
      _addParallelInnovationDialogueState(index);
}

bool SolutionChecked = false;
Color CheckTextActive = Colors.black;
Color CheckTextInActive = Color(0XFFABABAB);

var SolutionNamelabelColor = Color(0XFF919191);
bool validSolutionName = true;
var SolutionNameTextController = TextEditingController();
final SolutionNameFocusNode = new FocusNode();
String SolutionName;

var SolutionDescriptionlabelColor = Color(0XFF919191);
bool validSolutionDescription = true;
var SolutionDescriptionTextController = TextEditingController();
final SolutionDescriptionFocusNode = new FocusNode();
String SolutionDescription;

class _addParallelInnovationDialogueState
    extends State<addParallelInnovationDialogue> {
  int index;

  final _firestore = Firestore.instance;

  _addParallelInnovationDialogueState(this.index);
  @override
  void initState() {
    super.initState();
    if (index != null) {
      SolutionNameTextController =
          TextEditingController(text: AddingNewParallelInnovations[index].Name);
      SolutionDescriptionTextController = TextEditingController(
          text: AddingNewParallelInnovations[index].Description);
      SolutionChecked = AddingNewParallelInnovations[index].CheckedSolution;
    } else {
      SolutionNameTextController.clear();
      SolutionDescriptionTextController.clear();
      SolutionChecked = false;
    }
  }

  validator() {
    setState(() {
      SolutionNameTextController.text.isEmpty
          ? validSolutionName = false
          : validSolutionName = true;
      SolutionNameTextController.text.isEmpty
          ? SolutionNamelabelColor = Color(0xFFF53E70)
          : SolutionNamelabelColor = Color(0xFF919191);
      SolutionDescriptionTextController.text.isEmpty
          ? validSolutionDescription = false
          : validSolutionDescription = true;
      SolutionDescriptionTextController.text.isEmpty
          ? SolutionDescriptionlabelColor = Color(0xFFF53E70)
          : SolutionDescriptionlabelColor = Color(0xFF919191);
      print("(Validator is called)");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)), //this right here
        child: Container(
//          height: 500,
          width: 800,
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Add a parallel solution concept:",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextFieldWidget(
                    labelText: "Add solution name",
                    maxLines: 2,
                    validText: validSolutionName,
                    myFocusNode: SolutionNameFocusNode,
                    myTextController: SolutionNameTextController,
                    textCollecter: SolutionName,
                    helperText: '',
                    labelcolour: SolutionNamelabelColor,
                  ),
                  TextFieldWidget(
                    labelText: "Add solution description",
                    maxLines: 2,
                    validText: validSolutionDescription,
                    myFocusNode: SolutionDescriptionFocusNode,
                    myTextController: SolutionDescriptionTextController,
                    textCollecter: SolutionDescription,
                    helperText: '',
                    labelcolour: SolutionDescriptionlabelColor,
                  ),
                  CheckboxListTile(
                    title: Text(
                      'This solution concept has disruptive qualities',
                      style: TextStyle(
                          color: SolutionChecked
                              ? CheckTextActive
                              : CheckTextInActive),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: SolutionChecked,
                    onChanged: (bool value) {
                      setState(() {
                        SolutionChecked = value;
                      });
                    },
                    activeColor: Color(0XFFE95420),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AddSolutionConceptButton(
                          onTap: (SolutionNameTextController.text == '' ||
                                  SolutionDescriptionTextController.text == '')
                              ? () {
                                  validator();
                                }
                              : () {
                                  (SolutionNameTextController.text != '' &&
                                          SolutionDescriptionTextController
                                                  .text !=
                                              '')
                                      ? Navigator.pop(context)
                                      : {};
                                  setState(() {
//                                final NewParallelInnovation =
//                                    addparallelinnovations(
//                                        Name: SolutionNameTextController.text,
//                                        Description:
//                                            SolutionDescriptionTextController
//                                                .text,
//                                        CheckedSolution: SolutionChecked);

                                    if (index == null) {
//                                  AddingNewParallelInnovations.add(
//                                      NewParallelInnovation);
                                      _firestore
                                          .collection(
                                              '$currentUser/ManagingGrowth/parallelInnovations')
                                          .add({
                                        'Name': SolutionNameTextController.text,
                                        'Description':
                                            SolutionDescriptionTextController
                                                .text,
                                        'CheckedSolution': SolutionChecked,
                                        'Sender': "tester@gmail.com",
                                      });
                                    } else {
//                                  AddingNewParallelInnovations.removeAt(index);
//                                  AddingNewParallelInnovations.insert(
//                                      index, NewParallelInnovation);
                                      _firestore
                                          .collection(
                                              '$currentUser/ManagingGrowth/parallelInnovations')
                                          .document(
                                              AddingNewParallelInnovations[
                                                      index]
                                                  .ID)
                                          .updateData({
                                        'Name': SolutionNameTextController.text,
                                        'Description':
                                            SolutionDescriptionTextController
                                                .text,
                                        'CheckedSolution': SolutionChecked,
                                        'Sender': "tester@gmail.com",
                                      });
                                    }
                                  });
                                },
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        CancelButtton(
                          OnTap: () {
                            SolutionNameTextController.clear();
                            SolutionDescriptionTextController.clear();
                            SolutionChecked = false;

                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ));
  }
}
