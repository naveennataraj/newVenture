import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String customerProblems = '';

class ProblemStudy extends StatefulWidget {
  @override
  _ProblemStudyState createState() => _ProblemStudyState();
}

class _ProblemStudyState extends State<ProblemStudy> {
  bool validTitle = true;
  final titleController = TextEditingController();
  final customerProblemController = TextEditingController();
  final problemImportanceController = TextEditingController();

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
                    "Let's collect some details on the Customer's Problem",
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.right,
                  ),
                  Container(
                    margin: EdgeInsets.all(30),
                    child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        labelText: 'Provide a title for your Project',
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
                    margin: EdgeInsets.all(30),
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
                  Container(
                    margin: EdgeInsets.all(30),
                    child: TextField(
                      controller: problemImportanceController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText:
                            'Why is the problem importatnt to the customer?',
                        errorText: validTitle ? null : 'This field is required',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      onSubmitted: (problemImportance) {
                        print(problemImportanceController.text);
                      },
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'HEAD BACK',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        GestureDetector(
                          onTap: () {
//                            ProblemStudy().customerProblem =
//                                customerProblemController.text;
                            Navigator.pushNamed(context, '/bifdashboard');
                          },
                          child: Text(
                            'GO NEXT',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0XFFE95420)),
                          ),
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
