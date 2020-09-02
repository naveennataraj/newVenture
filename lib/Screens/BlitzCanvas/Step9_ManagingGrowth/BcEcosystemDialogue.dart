import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Step9_ManagingGrowth/ContentParallelSolution.dart';
import 'package:iventure001/Widgets/AddMetricButton.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';
import 'package:iventure001/Constants/ResposiveLayout.dart';

class BcEcosystemsDialogue extends StatefulWidget {
  final int index;
  const BcEcosystemsDialogue({this.index});
  @override
  _BcEcosystemsDialogueState createState() => _BcEcosystemsDialogueState(index);
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

class _BcEcosystemsDialogueState extends State<BcEcosystemsDialogue> {
  final _firestore = Firestore.instance;
  int index;
  _BcEcosystemsDialogueState(this.index);

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

    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)), //this right here
        child: Container(
          //height: 430, // MediaQuery.of(context).size.height * 0.60,
          width: 800, //MediaQuery.of(context).size.width * 0.5,
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Add a parallel solution concept:",
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
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
                    myFocusNode: SolutionNameFocusNode,
                    myTextController: SolutionDescriptionTextController,
                    textCollecter: SolutionDescription,
                    helperText: '',
                    labelcolour: SolutionDescriptionlabelColor,
                  ),
                  CheckboxListTile(
                    title: Text(
                      'This solution concept has disruptive qualities',
                      style: TextStyle(
                        fontSize: (ResponsiveLayout.isSmallScreen(context) ?  12: ResponsiveLayout.isMediumScreen(context) ? 15 : 16),
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
                        AddMetricButton(
                          onTap: () {

                            if(SolutionNameTextController.text != '' && SolutionDescriptionTextController.text != '') {
                              setState(() {
                                final NewParallelInnovation =
                                ContentParallelSolution(
                                    Name: SolutionNameTextController.text,
                                    Description:
                                    SolutionDescriptionTextController
                                        .text,
                                    CheckedSolution: SolutionChecked);

                                if (index == null) {
                                  AddingNewParallelInnovations.add(
                                      NewParallelInnovation);
                                  _firestore.collection('$currentUser/Bc9_managingGrowth/addConcepts').add({
                                    'Name': SolutionNameTextController.text,
                                    'Description': SolutionDescriptionTextController.text,
                                    'CheckedSolution': SolutionChecked,
                                    'Sender': currentUser,
                                  });

                                } else {
//                                  AddingNewParallelInnovations.removeAt(index);
//                                  AddingNewParallelInnovations.insert(
//                                      index, NewParallelInnovation);
                                  _firestore
                                      .collection('$currentUser/Bc9_managingGrowth/addConcepts')
                                      .document(AddingNewParallelInnovations[index].ID)
                                      .updateData({
                                    'Name': SolutionNameTextController.text,
                                    'Description': SolutionDescriptionTextController.text,
                                    'CheckedSolution': SolutionChecked,
                                    'Sender': currentUser,
                                  });
                                }
                                Navigator.pop(context);
//                                Navigator.push(context, new MaterialPageRoute(builder: (context) => BcCreatingEcosystems()),
//                                )
//                                    .then((value) => setState(() {}),);
                              });
                            } else{
                              validator();
                            }
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
        ),);
  }
}
