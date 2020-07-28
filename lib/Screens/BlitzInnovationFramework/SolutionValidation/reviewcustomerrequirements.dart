import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Data/CardData.dart';
import 'package:iventure001/Widgets/CompleteStepButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';
import 'package:iventure001/Widgets/NoteCard.dart';

class ReviewCustomerRequirements extends StatefulWidget {
  @override
  _ReviewCustomerRequirementsState createState() =>
      _ReviewCustomerRequirementsState();
}

class _ReviewCustomerRequirementsState
    extends State<ReviewCustomerRequirements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFAFAFA),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: NavigationBar(),
      ),
      body: Center(
        child: Container(
          //height: MediaQuery.of(context).size.height * .40,
          margin: EdgeInsets.only(top: 40.0),
          width: MediaQuery.of(context).size.width * .40,
          decoration: BoxDecoration(
            color: Colors.white,
            //shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 2.0,
              ),
            ],
          ),
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Schedule a Review of Problem-Solution fit",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  NoteCard(
                    Note:
                        'Tip: Customer pain points can change over time and the solution will need to evolve accordingly to stay relevant. Additionally, It might be a good idea to have a review of the problem-solution fit after some time, to see if the current solution concept is still the best option to resolve the customer pain points. These can be done after a 3 month, 6 month or 1 year window.',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        headBackButtton(),
                        SizedBox(
                          width: 50,
                        ),
                        CompleteStepButton(
                          OnTap: () {
                            bcpData[5].CompletionValidator = true;
                            print(bcpData[5].CompletionValidator);
                            Navigator.pushNamed(
                                context, '/BlitzInnovationFramework');
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
