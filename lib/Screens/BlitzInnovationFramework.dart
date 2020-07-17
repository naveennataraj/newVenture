import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/FrameworkCards.dart';

class BlitzInnovationFramework extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iVENTURE'),
        backgroundColor: Color(0XFFE95420),
      ),
      backgroundColor: Color(0XFFFAFAFA),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Blitz Innovation Framework',
                  style: TextStyle(fontSize: 60),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                color: Colors.white,
                elevation: 5,
                child: Container(
                  height: MediaQuery.of(context).size.height * .30,
                  width: MediaQuery.of(context).size.width * .50,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Text(
                          'Blitz Unified Framework',
                          style: TextStyle(fontSize: 30),
                          textAlign: TextAlign.center,
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 30,
                          ),
                        ),
                        Text(
                          'Welcome to a innovation oriented software product development exercise using the Blitz Innovation Framework.',
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 30,
                          ),
                        ),
                        Text(
                          'In the NEXT EIGHT STEPS, we will go through the steps of developing an SAMPLE innovative software product concept. For the purpose of this exercise, the fictional product offered to the customer is a To-Do list application',
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 30,
                          ),
                        ),
                        Text(
                          'PLEASE NOTE: THIS IS AN INNOVATION DRIVEN NEW PRODUCT CONCEPTUALIZATION EXERCISE. THE ENTRIES FOR EACH STEP HAS ALREADY BEEN FILLED IN.',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 30,
                          ),
                        ),
                        Text(
                          "Please choose the 'Let's get started' button below to get started with this process.",
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 300, right: 300),
                child: GridView.count(
                  childAspectRatio: 1.5,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  children: <Widget>[
                    FrameworkCards(
                      frameworkStep: 'Step 1 - Study the problem',
                      frameworkicon: Icons.book,
                      frameworkdescrip:
                          'Studying the problem space and understanding the pain points involved.',
                      buttonText: "Let's Get Started",
                      navigateTo: '/Problemstudy',
                    ),
                    FrameworkCards(
                      frameworkStep: 'Step 2 - Studying the user',
                      frameworkicon: Icons.book,
                      frameworkdescrip:
                          'Studying the user, who they are, their environment and what they want.',
                      buttonText: 'Begin Step 2',
                      navigateTo: '/Problemstudy',
                    ),
                    FrameworkCards(
                      frameworkStep: 'Step 3 - Ideate and Conceptualize',
                      frameworkicon: Icons.book,
                      frameworkdescrip:
                          'Brainstorming possible solutions and selecting the best option.',
                      buttonText: 'Begin Step 3',
                      navigateTo: '/Problemstudy',
                    ),
                    FrameworkCards(
                      frameworkStep: 'Step 4 - Solution formulation',
                      frameworkicon: Icons.book,
                      frameworkdescrip:
                          'Defining product goals, the features of the product and Creating a solution outline.',
                      buttonText: 'Begin Step 4',
                      navigateTo: '/Problemstudy',
                    ),
                    FrameworkCards(
                      frameworkStep: 'Step 5 - Pre-Validation',
                      frameworkicon: Icons.book,
                      frameworkdescrip:
                          "Preparing for the collection of user's initial feedback on the solution concept.",
                      buttonText: 'Begin Step 5',
                      navigateTo: '/Problemstudy',
                    ),
                    FrameworkCards(
                      frameworkStep: 'Step 6 - Solution Validation',
                      frameworkicon: Icons.book,
                      frameworkdescrip:
                          "Capturing the user's thoughts after they have tried out the solution and next steps.",
                      buttonText: 'Begin Step 6',
                      navigateTo: '/Problemstudy',
                    ),
                    FrameworkCards(
                      frameworkStep: 'Step 7 - Managing growth',
                      frameworkicon: Icons.book,
                      frameworkdescrip:
                          'Outlining how the product plans to scale and planning for new parallel products.',
                      buttonText: 'Begin Step 7',
                      navigateTo: '/Problemstudy',
                    ),
                    FrameworkCards(
                      frameworkStep: 'Step 8 - Metrics',
                      frameworkicon: Icons.book,
                      frameworkdescrip:
                          'List out the metrics which will be used to keep track of the product.',
                      buttonText: 'Begin Step 8',
                      navigateTo: '/Problemstudy',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
