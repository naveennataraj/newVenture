import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Constants/TextFieldConstants.dart';
import 'package:iventure001/Data/BlitxInnovationFrameWork/SolutionFormulation/addProductGoal.dart';
import 'package:iventure001/Widgets/AddProductGoalButton.dart';
import 'package:iventure001/Widgets/CancelButton.dart';
import 'package:iventure001/Widgets/TextFieldWidget.dart';

class addProductGoalsDialogue extends StatefulWidget {
  final int index;

  const addProductGoalsDialogue({this.index});
  @override
  _addProductGoalsDialogueState createState() =>
      _addProductGoalsDialogueState(index);
}

var ProductGoallabelColor = Color(0XFF919191);
bool validProductGoal = true;
var ProductGoalTextController = TextEditingController();
final ProductGoalFocusNode = new FocusNode();
String ProductGoal = '';

class _addProductGoalsDialogueState extends State<addProductGoalsDialogue> {
  int index;
  final _firestore = Firestore.instance;

  _addProductGoalsDialogueState(this.index);
  @override
  void initState() {
    super.initState();
    if (index != null) {
      ProductGoalTextController =
          TextEditingController(text: AddingNewProductGoals[index].goal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)), //this right here
        child: Container(
          height: MediaQuery.of(context).size.height * 0.40,
          width: MediaQuery.of(context).size.width * 0.4,
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
                        "Add a Product Goal:",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TextFieldWidget(
                      labelText: "Add a product goal",
                      maxLines: 1,
                      validText: validProductGoal,
                      myFocusNode: ProductGoalFocusNode,
                      myTextController: ProductGoalTextController,
                      textCollecter: ProductGoal,
                      helperText:
                          'Adding a product goal for a solution concept can help validate the product concept,\nafter it is used by the user',
                      labelcolour: ProductGoallabelColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AddProductGoalButton(
                            onTap: () {
                              setState(() {
//                                final NewProductGoals = addProductGoal(
//                                  goal: ProductGoalTextController.text,
//                                );

                                if (index == null) {
//                                  AddingNewProductGoals.add(NewProductGoals);
                                  _firestore
                                      .collection(
                                          '$currentUser/SolutionFormulation/productGoal')
                                      .add({
                                    'goal': ProductGoalTextController.text,
                                    'Sender': currentUser,
                                  });
                                } else {
//                                  AddingNewProductGoals.removeAt(index);
//                                  AddingNewProductGoals.insert(
//                                      index, NewProductGoals);
                                  _firestore
                                      .collection(
                                          '$currentUser/SolutionFormulation/productGoal')
                                      .document(AddingNewProductGoals[index].ID)
                                      .updateData({
                                    'goal': ProductGoalTextController.text,
                                    'Sender': currentUser,
                                  });
                                }

                                ProductGoalTextController.clear();

                                Navigator.pop(context);
                              });
                            },
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          CancelButtton(
                            OnTap: () {
                              ProductGoalTextController.clear();

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
