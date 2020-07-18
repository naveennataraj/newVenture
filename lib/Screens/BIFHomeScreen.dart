import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BIFHomeScreen extends StatelessWidget {
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
            height: MediaQuery.of(context).size.height * .40,
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
                    'Welcome to a product and business development exercise using the Blitz Unified Framework.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  Flexible(
                    child: SizedBox(
                      height: 30,
                    ),
                  ),
                  Text(
                    'In the first section, we will be working on developing a product concept using an innovation based framework called the Blitz Innovation Framework.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  Flexible(
                    child: SizedBox(
                      height: 30,
                    ),
                  ),
                  Text(
                      'In the second section, we will be work on business model development around the product concept, which we built as an outcome of the first section.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center),
                  Flexible(
                    child: SizedBox(
                      height: 30,
                    ),
                  ),
                  Text(
                    "Please choose the 'Let's get started' button below to get started with this exercise.",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  Flexible(
                    child: SizedBox(
                      height: 30,
                    ),
                  ),
                  RaisedButton(
                    elevation: 5,
                    hoverElevation: 10,
                    color: Color(0XFFE95420),
                    onPressed: () {
                      Navigator.pushNamed(context, '/BlitzInnovationFramework');
                    },
                    child: Text(
                      "Let's Get Started",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
