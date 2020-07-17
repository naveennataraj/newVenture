import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iventure001/Widgets/CompleteStepButton.dart';
import 'package:iventure001/Widgets/HeadBackButton.dart';

class AddPainPoints extends StatefulWidget {
  @override
  _AddPainPointsState createState() => _AddPainPointsState();
}

class _AddPainPointsState extends State<AddPainPoints> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iVENTURE'),
        backgroundColor: Color(0XFFE95420),
      ),
      backgroundColor: Color(0XFFFAFAFA),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Material(
              color: Colors.white,
              elevation: 5,
              child: Container(
                height: MediaQuery.of(context).size.height * .60,
                width: MediaQuery.of(context).size.width * .40,
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
                      SizedBox(
                        height: 20,
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
                            CompleteStepButton(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(100),
                child: FloatingActionButton(
                  tooltip: "Add's New Card",
                  backgroundColor: Color(0XFFE95420),
                  onPressed: () {},
                  child: Icon(Icons.add),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
