import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/FrameworkCards.dart';
import 'BlitzCanvas/Step1/BcStep1CollectDetailsBusiness.dart';

class Editingscreen extends StatefulWidget {
  @override
  _EditingscreenState createState() => _EditingscreenState();
}

class _EditingscreenState extends State<Editingscreen> {
  bool validTitle = true;
  final titleController = TextEditingController();
  final customerProblemController =
      TextEditingController(text: customerProblems);
  final problemImportanceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iVENTURE'),
        backgroundColor: Color(0XFFE95420),
      ),
      backgroundColor: Color(0XFFFAFAFA),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Center(
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
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
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
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            onChanged: (customerProblem) {
                              setState(() {
                                customerProblems = customerProblem;
                              });
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
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
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
//
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
          ),
          SizedBox(
            width: 1,
            child: Divider(
              thickness: 500,
              color: Colors.black,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Concept Dashboard Preview',
                    style: TextStyle(fontSize: 60),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Hero(
                  tag: 'hola',
                  child: FrameworkCards(
                    frameworkdescrip: customerProblems,
                    buttonText: 'Explore Other Pain Points',
                    frameworkicon: Icons.people,
                    frameworkStep: 'Customer Pain Point',
                    navigateTo: null,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
