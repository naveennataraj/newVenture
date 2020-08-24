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

  validator() {
    setState(() {
      ProductGoalTextController.text.isEmpty
          ? validProductGoal = false
          : validProductGoal = true;
      ProductGoalTextController.text.isEmpty
          ? ProductGoallabelColor = Color(0xFFF53E70)
          : ProductGoallabelColor = Color(0xFF919191);
    });
  }

  _addProductGoalsDialogueState(this.index);
  @override
  void initState() {
    super.initState();
    if (index != null) {
      ProductGoalTextController =
          TextEditingController(text: AddingNewProductGoals[index].goal);
    } else {
      ProductGoalTextController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)), //this right here
        child: Container(
          height: 300,
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
                            onTap: (ProductGoalTextController.text == '')
                                ? () {
                                    validator();
                                  }
                                : () {
                                    (ProductGoalTextController.text != '')
                                        ? Navigator.pop(context)
                                        : {};
                                    setState(() {
                                      if (index == null) {
                                        _firestore
                                            .collection(
                                                '$currentUser/SolutionFormulation/productGoal')
                                            .add({
                                          'goal':
                                              ProductGoalTextController.text,
                                          'Sender': currentUser,
                                        });
                                      } else {
                                        _firestore
                                            .collection(
                                                '$currentUser/SolutionFormulation/productGoal')
                                            .document(
                                                AddingNewProductGoals[index].ID)
                                            .updateData({
                                          'goal':
                                              ProductGoalTextController.text,
                                          'Sender': currentUser,
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
