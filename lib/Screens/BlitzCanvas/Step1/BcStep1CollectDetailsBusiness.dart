import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//Import button widgets
import 'package:iventure001/Widgets/GoNextButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';

String customerProblems = '';

const activeOrangeColour = Color(0XFFE95420);
const unActiveBlackColour = Color(0xFF274C4B);

class BcStep1CollectionAspects extends StatefulWidget {
//  final ContentBcStep1CollectionFoundation collectionFoundationContent;
//  BcStep1CollectionAspects(this.collectionFoundationContent);

  @override
  _BcStep1CollectionAspectsState createState() =>
      _BcStep1CollectionAspectsState();
}

class _BcStep1CollectionAspectsState extends State<BcStep1CollectionAspects> {
  bool validTitle = true;
  final titleController = TextEditingController();
  final customerProblemController = TextEditingController();
  //text controllers to receive the information from the screen that is written by the user
  TextEditingController missionController = TextEditingController();
  TextEditingController visionController = TextEditingController();

  //final problemImportanceController = TextEditingController();
  //final problemImportanceController = TextEditingController();

  bool _isEditingText = false;
  TextEditingController _editingController;
  String initialText = "To empower people to become more productive with the help of IT enabled capabilities";
  Color missionStatementColour = unActiveBlackColour;
//  TextStyle _decorationStyleOf(BuildContext context) {
//    final theme = Theme.of(context);
//    return theme.textTheme.subtitle1
//        .copyWith(color: Colors.black);
//  }

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: initialText,);
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _editTitleTextField() {
      if (_isEditingText) // when editing the text field
        return TextField(
          style: TextStyle(
            //color: Colors.black,
            fontSize: 17.0,
          ),
          //textAlign: TextAlign.left,
          decoration: InputDecoration(
          border: InputBorder.none,
            contentPadding: EdgeInsets.all(0),
            isDense: true,
        ),

          onSubmitted: (newValue) {
            setState(() {
              initialText = newValue;
              _isEditingText = false;
              missionStatementColour = unActiveBlackColour;

            });
          },

          autofocus: false,
          controller: _editingController,
        );
      return GestureDetector(
        onTap: () {
          setState(() {
            _isEditingText = true;
            missionStatementColour = activeOrangeColour;
          });
        },
        child: Text(
          initialText,
          style: TextStyle(
            //color: Colors.black,
            fontSize: 16.0,
          ),

        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('iVENTURE'),
        backgroundColor: Color(0XFFE95420),
      ),
      backgroundColor: Color(0XFFFAFAFA),
      body: Center(
        child: Material(
          color: Colors.white,
          elevation: 5,
          child: Container(
            height: MediaQuery.of(context).size.height * .60,
            width: MediaQuery.of(context).size.width * .50,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let's collect some details on the foundational aspects of the business",
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .120,
                      width: MediaQuery.of(context).size.width * .50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10),

                  ),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, top:  10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Provide a mission statement', style: TextStyle(color: missionStatementColour),),

                            SizedBox(height: 10.0,),
                            _editTitleTextField(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

//                  Container(
//                    margin: EdgeInsets.all(20),
//                    child: TextField(
//                      controller: customerProblemController,
//                      maxLines: 3,
//                      decoration: InputDecoration(
//                        labelText:
//                            'Describe the problem that the customer is facing',
//                        errorText: validTitle ? null : 'This field is required',
//                        border: OutlineInputBorder(
//                          borderRadius: BorderRadius.all(Radius.circular(10)),
//                        ),
//                      ),
//                      onSubmitted: (customerProblem) {
//                        customerProblems = customerProblem;
//                        print(customerProblemController.text);
//                        print(customerProblem);
//                        print(customerProblems);
//                      },
//                    ),
//                  ),
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
                        goNextButton(
                          routeName: '/BCStep1AddDetails',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
