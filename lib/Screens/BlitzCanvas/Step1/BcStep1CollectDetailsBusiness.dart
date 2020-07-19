import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//Import button widgets
import 'package:iventure001/Widgets/GoNextButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';


String customerProblems = '';

class BcStep1CollectionAspects extends StatefulWidget {

//  final ContentBcStep1CollectionFoundation collectionFoundationContent;
//  BcStep1CollectionAspects(this.collectionFoundationContent);

  @override
  _BcStep1CollectionAspectsState createState() => _BcStep1CollectionAspectsState();
}

class _BcStep1CollectionAspectsState extends State<BcStep1CollectionAspects> {
  bool validTitle = true;
  final titleController = TextEditingController();
  final customerProblemController = TextEditingController();
  //final problemImportanceController = TextEditingController();
  //final problemImportanceController = TextEditingController();


  @override
  Widget build(BuildContext context) {
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
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        labelText: 'Provide a mission statement for the business adventure',
                        errorText: validTitle ? null : 'This field is required',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      onSubmitted: (title) {
                        print(titleController.text.toString());
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: TextField(
                      controller: customerProblemController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText:
                        'Describe the problem that the customer is facing',
                        errorText: validTitle ? null : 'This field is required',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      onSubmitted: (customerProblem) {
                        customerProblems = customerProblem;
                        print(customerProblemController.text);
                        print(customerProblem);
                        print(customerProblems);
                      },
                    ),
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

