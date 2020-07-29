import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/CardData.dart';
import 'package:iventure001/Widgets/FrameworkCards.dart';

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
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: GridView.builder(
                  shrinkWrap: true,
//                  physics: NeverScrollableScrollPhysics(),
                  itemCount: bcpData.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 1.5,
                      crossAxisSpacing: 1.5,
                      childAspectRatio: 2.5,
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return FrameworkCards(
                        stepCompleteValidator:
                            bcpData[index].CompletionValidator,
                        frameworkicon: bcpData[index].frameworkicon,
                        frameworkStep: bcpData[index].frameworkStep,
                        frameworkdescrip: bcpData[index].frameworkdescrip,
                        buttonText: bcpData[index].buttonText,
                        navigateTo: bcpData[index].navigateTo);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
