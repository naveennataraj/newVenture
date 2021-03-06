import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/Stu3_DefiningTheSolution/ContentBcProductGoals.dart';
import 'package:iventure001/Widgets/AddProductGoalButton.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';


class GoalDialogue extends StatefulWidget {
  final int index;
  const GoalDialogue({this.index});
  @override
  _GoalDialogueState createState() => _GoalDialogueState(index);
}

var goalLabelColor = Color(0XFF919191);
bool validGoal = true;
var goalTextController = TextEditingController();
final goalFocusNode = new FocusNode();
String goal;

class _GoalDialogueState extends State<GoalDialogue> {
  final _firestore = Firestore.instance;
  int index;
  _GoalDialogueState(this.index);
  @override
  void initState() {
    super.initState();
    if (index != null) {
      goalTextController =
          TextEditingController(text: productGoals[index].goals);
    } else{
      goalTextController.clear();
    }
  }

  validator() {
    setState(() {
      goalTextController.text.isEmpty
          ? validGoal = false
          : validGoal = true;
      goalTextController.text.isEmpty
          ? goalLabelColor = Color(0xFFF53E70)
          : goalLabelColor = Color(0xFF919191);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)), //this right here
      child: Container(
        height: 300,//MediaQuery.of(context).size.height * 0.40,
        width: 800,//MediaQuery.of(context).size.width * 0.4,
        child: Center(
          child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Add a Product Goal:",
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextFieldWidget(
                    labelText: "Add a product goal",
                    maxLines: 2,
                    validText: validGoal,
                    myFocusNode: goalFocusNode,
                    myTextController: goalTextController,
                    textCollecter: goal,
                    helperText: 'Adding a product goal for a solution concept can help validate the product concept, after it is used by the user',
                    labelcolour: goalLabelColor,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AddProductGoalButton(
                          onTap: ()
                          {
                          if (goalTextController.text != '') {
                            Navigator.pop(context);
                            setState(() {
                              //setState(() {});
                              final newProductGoal = BcContentProductGoals(
                                goals: goalTextController.text,
                              );
                              if (index == null) {
                                productGoals.add(newProductGoal);
                                _firestore.collection('$currentUser/Bc3_definingTheSolution/addGoals').add({
                                  'goal': goalTextController.text,
                                  'Sender': currentUser,
                                });


                              } else {
//                                productGoals.removeAt(index);
//                                productGoals.insert(index, newProductGoal);
                                _firestore
                                    .collection('$currentUser/Bc3_definingTheSolution/addGoals')
                                    .document(productGoals[index].ID)
                                    .updateData({
                                  'goal': goalTextController.text,
                                  'Sender': currentUser,
                                },);

                              }
//
//                              Navigator.push(context, new MaterialPageRoute(builder: (context) => Step3GoalsTheSolution()),
//                              )
//                              .then((value) => setState(() {}),);
                            },);
                          }
                          else {
                            validator();
                          }


                          },
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        CancelButtton(
                          OnTap: () {
                            goalTextController.clear();
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}



